import 'package:chat/core/infrastructure/socket_connection.dart';
import 'package:chat/message/domain/message.dart';
import 'package:chat/message/infrastructure/message_local_service.dart';
import 'package:chat/message/infrastructure/message_remote_service.dart';
import 'package:chat/message/infrastructure/message_repository.dart';
import 'package:chat/user/domain/user.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late final FakeFirebaseFirestore instance;
  late final MessageRepository messageRepository;
  late final TextEditingController textEditingController;
  late final stream;
  final sultan = User(uid: 'sultan', name: 'sultan', isCustomer: true);
  final aamir = User(uid: 'aamir', name: 'aamir', isCustomer: false);
  @override
  void initState() {
    textEditingController = TextEditingController();
    instance = FakeFirebaseFirestore();
    messageRepository = MessageRepository(
        MessageRemoteService(instance, activeUser: sultan, secondUser: aamir),
        MessageLocalService());
    stream = messageRepository.getMessages().fold((l) => null, (r) => r);
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    messageRepository.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: 50,
          child: Column(
            children: [
              StreamBuilder(
                  stream: stream,
                  builder: (context, AsyncSnapshot<Message> snapshot) {
                    if (snapshot.hasData) {
                      return Card(
                        child: Text(snapshot.data!.contents),
                      );
                    } else {
                      return SizedBox();
                    }
                  }),
              Row(
                children: [
                  SizedBox(
                    height: 20,
                    width: 100,
                    child: TextField(
                      controller: textEditingController,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          messageRepository.send(
                              message: Message(
                                  id: DateTime.now().toString(),
                                  from: sultan.userUid,
                                  to: aamir.userUid,
                                  timeStamp: DateTime.now().toString(),
                                  contents: textEditingController.text));
                        });
                      },
                      child: Text('send')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
