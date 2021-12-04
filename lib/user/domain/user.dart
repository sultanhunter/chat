import 'dart:convert';

class User {
  late final String _uid;
  final String name;
  final String avatarUrl;
  final bool isActive;
  final String lastSeen;
  final bool isCustomer;

  User(
      {required String uid,
      required this.name,
      this.avatarUrl = '',
      this.isActive = false,
      this.lastSeen = '',
      required this.isCustomer}) {
    _uid = uid;
  }

  String get userUid => _uid;

  Map<String, dynamic> toMap() {
    return {
      'uid': _uid,
      'name': name,
      'avatarUrl': avatarUrl,
      'isActive': isActive,
      'lastSeen': lastSeen,
      'isCustomer': isCustomer
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'],
      name: map['name'],
      avatarUrl: map['avatarUrl'] ?? '',
      isActive: map['isActive'] ?? false,
      lastSeen: map['lastSeen'] ?? '',
      isCustomer: map['isCustomer'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
