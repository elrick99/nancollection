import 'dart:convert';

import 'package:flutter/foundation.dart';

enum Etat { Neuf, QuasiNeuf, Amoche }

class Article with ChangeNotifier {
  int id;
  final String code;
  final String title;
  final String description;
  final double price;
  final Etat etat;
  bool isFavorite;
  final int point;
  final String picture;
  final String taille;
  final String marque;
  final int categorie;
  final int sousCategorie;
  final String admin;

  Article(
      {@required this.id,
      @required this.code,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.etat,
      this.isFavorite = false,
      @required this.point,
      @required this.picture,
      this.taille,
      @required this.marque,
      @required this.categorie,
      @required this.sousCategorie,
      this.admin});

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'price': price,
        'etat': etat == Etat.Neuf ? 'Neuf' : 'QuasiNeuf',
        'isFavorite': isFavorite,
        'point': point,
        'picture': picture,
        'taille': taille,
        'marque': marque,
        'categorie': categorie,
        'sousCategorie': sousCategorie,
        'admin': admin,
      };

  Map<String, dynamic> toMap(bool forUpdate) {
    var data = {
//      'id': id,  since id is auto incremented in the database we don't need to send it to the insert query.
      'code': code,
      'title': title,
      'price': price,
      'isFavorite': isFavorite,
      'date_last_edited': epochFromDate(
          DateTime.now()), //  for later use for integrating archiving
    };
    if (forUpdate) {
      data["id"] = this.id;
    }

    return data;
  }

  int epochFromDate(DateTime dt) {
    return dt.millisecondsSinceEpoch ~/ 1000;
  }

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}

class AllProducts {
  AllProducts({
    this.products,
  });

  Article products;

  Map<String, dynamic> toJson() => {
        "products": products.toJson(),
      };
}
