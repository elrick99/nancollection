import 'package:flutter/foundation.dart';

class Chat with ChangeNotifier {
  final String id;
  final String code;
  final String message;
  final String dateTime;
  final String collectionneur;
  final String employe;

  Chat({
    this.id,
    this.code,
    this.message,
    this.dateTime,
    this.collectionneur,
    this.employe,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
      id: json['key'],
      code: json['nom'],
      message: json['prenom'],
      dateTime: json['email'],
      collectionneur: json['genre'],
      employe: json['password']);

  Map<String, dynamic> toJson() => {
        "key": id,
        "nom": code,
        "prenom": message,
        "email": dateTime,
        "genre": collectionneur,
        "password": employe,
      };
}
