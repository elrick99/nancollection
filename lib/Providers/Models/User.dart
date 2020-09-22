import 'package:flutter/foundation.dart';

enum OptionGenre { Femme, Homme }

class User with ChangeNotifier {
  final String id;
  final String nom;
  final String prenom;
  final String type;
  final OptionGenre genre;
  final String email;
  final String telnumber;
  final String dtenaiss;
  final String password;
  final String adress1;
  final String adress2;
  final String ville;
  final String pays;
  final String codePostal;

  User({
    this.id,
    this.nom,
    this.prenom,
    this.type,
    this.genre,
    this.email,
    this.telnumber,
    this.dtenaiss,
    this.password,
    this.adress1,
    this.adress2,
    this.ville,
    this.pays,
    this.codePostal,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json['key'],
      nom: json['nom'],
      prenom: json['prenom'],
      email: json['email'],
      genre: json['genre'],
      password: json['password']);

  Map<String, dynamic> toJson() => {
        "key": id,
        "nom": nom,
        "prenom": prenom,
        "email": email,
        "genre": genre,
        "password": password,
      };
}
