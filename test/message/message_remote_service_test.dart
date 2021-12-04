import 'package:chat/message/domain/message.dart';
import 'package:chat/message/infrastructure/message_remote_service.dart';
import 'package:chat/user/domain/user.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final instance = FakeFirebaseFirestore();
  late final MessageRemoteService messageRemoteService;
  final sultan = User(uid: 'sultan', name: 'sultan', isCustomer: true);
  final aamir = User(uid: 'aamir', name: 'aamir', isCustomer: false);

  setUpAll(() async {
    final message = Message(
        id: 'id',
        from: 'sultan',
        to: 'aamir',
        timeStamp: DateTime.now().toString(),
        contents: 'hello');
    await instance
        .collection('chats')
        .doc('sultanaamir')
        .collection('messages')
        .doc('first')
        .set(message.toMap());
    messageRemoteService =
        MessageRemoteService(instance, activeUser: sultan, secondUser: aamir);
  });

  tearDownAll(() {
    messageRemoteService.dispose();
  });

  test('sent message succesfully', () async {
    Message message = Message(
        id: '2',
        from: 'sultan',
        to: 'aamir',
        timeStamp: DateTime.now().toString(),
        contents: 'id is 2');
    await messageRemoteService.send(message: message);
    final doc = await instance
        .collection('chats')
        .doc('sultanaamir')
        .collection('messages')
        .doc(message.id)
        .get();

    expect(doc.data()!['contents'], equals('id is 2'));
  });

  test('succesfully subscribe and receive messages', () async {
    final message = Message(
        id: 'id-5',
        from: 'sultan',
        to: 'aamir',
        timeStamp: DateTime.now().toString(),
        contents: 'first message');
    final message2 = Message(
        id: 'id-6',
        from: 'sultan',
        to: 'aamir',
        timeStamp: DateTime.now().toString(),
        contents: 'second message');

    await messageRemoteService.send(message: message);
    await messageRemoteService.send(message: message2).whenComplete(() {
      messageRemoteService.getMessages().listen(expectAsync1((message) {
            expect(message.from, 'sultan');
          }, count: 3));
    });
  });
}
