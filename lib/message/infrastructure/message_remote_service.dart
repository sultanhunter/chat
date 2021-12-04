import 'dart:async';

import 'package:chat/core/domain/socket_connection_failure.dart';
import 'package:chat/core/infrastructure/network_exceptions.dart';
import 'package:chat/core/infrastructure/socket_connection.dart';
import 'package:chat/message/domain/message.dart';
import 'package:chat/message/infrastructure/message_dto.dart';
import 'package:chat/message/infrastructure/message_remote_service_interface.dart';
import 'package:chat/user/domain/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class MessageRemoteService implements IMessageRemoteService {
  final FirebaseFirestore _firebaseFirestore;
  final _controller = StreamController<MessageDTO>.broadcast();
  late final StreamSubscription _streamSubscription;
  final User activeUser;
  final User secondUser;

  MessageRemoteService(this._firebaseFirestore,
      {required this.activeUser, required this.secondUser}) {
    //subscribing to firestore collection
    _streamSubscription = _firebaseFirestore
        .collection('chats')
        .doc(activeUser.isCustomer
            ? activeUser.userUid + secondUser.userUid
            : secondUser.userUid + activeUser.userUid)
        .collection('messages')
        .snapshots()
        .listen((_) {});
  }

  @override
  dispose() {
    _streamSubscription.cancel();
    _controller.close();
  }

  @override
  Stream<MessageDTO> getMessages() {
    List<MessageDTO> messageDTOs = [];
    try {
      //listening to firestore collection
      _streamSubscription.onData((data) {
        //we are converting the data which we got from firebase to message DTOs.
        data.docChanges.forEach((e) {
          if (e.doc.data() != null) {
            messageDTOs.add(MessageDTO.fromMap(e.doc.data()!));
          }
        });

        //adding messageDTOs to our streamController
        for (var element in messageDTOs) {
          _controller.sink.add(element);
        }
      });

      _streamSubscription.onError((e) {
        throw ApiException(errorMessage: e.toString());
      });
      return _controller.stream;
    } catch (e) {
      throw ApiException(errorMessage: e.toString());
    }
  }

  @override
  Future<void> send({required Message message}) async {
    try {
      await _firebaseFirestore
          .collection('chats')
          .doc(activeUser.isCustomer
              ? activeUser.userUid + secondUser.userUid
              : secondUser.userUid + activeUser.userUid)
          .collection('messages')
          .doc(message.id)
          .set(message.toMap());
    } catch (e) {
      throw ApiException(errorMessage: e.toString());
    }
  }
}
