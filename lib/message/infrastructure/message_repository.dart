import 'dart:async';

import 'package:chat/core/infrastructure/network_exceptions.dart';
import 'package:chat/message/domain/message.dart';
import 'package:chat/message/domain/message_failure.dart';
import 'package:chat/message/infrastructure/message_local_service.dart';
import 'package:chat/message/infrastructure/message_remote_service.dart';
import 'package:chat/user/domain/user.dart';
import 'package:dartz/dartz.dart';

class MessageRepository {
  final MessageRemoteService _messageRemoteService;
  final MessageLocalService _messageLocalService;
  final _controller = StreamController<Message>.broadcast();
  late final StreamSubscription _messageDTOStreamSubscription;

  MessageRepository(
    this._messageRemoteService,
    this._messageLocalService,
  ) {
    _messageDTOStreamSubscription =
        _messageRemoteService.getMessages().listen((_) {});
  }

  Either<MessageFailure, Stream<Message>> getMessages() {
    try {
      _messageDTOStreamSubscription.onData((data) {
        _controller.sink.add(data.toDomain());
      });
      return right(_controller.stream);
    } on ApiException {
      return left(const MessageFailure.stream());
    }
  }

  Future<Either<MessageFailure, Unit>> send({required Message message}) async {
    try {
      await _messageRemoteService.send(message: message);
      return right(unit);
    } on ApiException catch (e) {
      return left(const MessageFailure.send());
    }
  }

  dispose() {
    _messageRemoteService.dispose();
  }
}
