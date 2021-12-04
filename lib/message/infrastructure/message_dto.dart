import 'dart:convert';

import 'package:chat/message/domain/message.dart';

class MessageDTO {
  final String from;
  final String to;
  final String timeStamp;
  final String contents;
  late final String _id;

  MessageDTO(
      {required String id,
      required this.from,
      required this.to,
      required this.timeStamp,
      required this.contents}) {
    _id = id;
  }

  String get id => _id;

  Map<String, dynamic> toMap() {
    return {
      'from': from,
      'to': to,
      'timeStamp': timeStamp,
      'contents': contents,
      'id': _id,
    };
  }

  factory MessageDTO.fromMap(Map<String, dynamic> map) {
    return MessageDTO(
      from: map['from'],
      to: map['to'],
      timeStamp: map['timeStamp'],
      contents: map['contents'],
      id: map['id'],
    );
  }

  factory MessageDTO.fromDomain(Message _) {
    return MessageDTO(
      id: _.id,
      from: _.from,
      to: _.to,
      timeStamp: _.timeStamp,
      contents: _.contents,
    );
  }

  Message toDomain() {
    return Message(
      id: id,
      from: from,
      to: to,
      timeStamp: timeStamp,
      contents: contents,
    );
  }
}
