import 'dart:convert';

class Message {
  final String from;
  final String to;
  final String timeStamp;
  final String contents;
  late final String _id;

  String get id => _id;

  Message(
      {required String id,
      required this.from,
      required this.to,
      required this.timeStamp,
      required this.contents}) {
    _id = id;
  }

  Map<String, dynamic> toMap() {
    return {
      'from': from,
      'to': to,
      'timeStamp': timeStamp,
      'contents': contents,
      'id': _id,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      from: map['from'],
      to: map['to'],
      timeStamp: map['timeStamp'],
      contents: map['contents'],
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) =>
      Message.fromMap(json.decode(source));
}
