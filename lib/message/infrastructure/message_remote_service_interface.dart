import 'package:chat/message/domain/message.dart';
import 'package:chat/message/infrastructure/message_dto.dart';
import 'package:chat/user/domain/user.dart';

abstract class IMessageRemoteService {
  Future<void> send({required Message message});
  Stream<MessageDTO> getMessages();
  dispose();
}
