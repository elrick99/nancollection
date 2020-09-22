import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:nantest/Providers/Models/Article.dart';
import 'package:nantest/Providers/Models/Boutique.dart';
import 'package:nantest/Providers/Models/User.dart';

class Boutiques with ChangeNotifier {
  List<Boutique> _item = [];
  List<Boutique> get item => _item;

  Future<void> postBoutique(String type, String description, User user) async {
    Map data = {
      'iduser': user.id,
      'type': type,
      'email': user.email,
      'description': description,
      'genre': (user.genre == OptionGenre.Femme) ? 'Femme' : 'Homme',
      'prenom': user.prenom,
      'nom': user.nom,
      'pays': user.pays,
      'adresse': user.adress1,
      'codePostal': user.codePostal,
      'ville': user.ville,
      'telephone': user.telnumber
    };
    print(data);
    final String url = "https://appsecom-839d9.firebaseio.com/boutique.json";

    try {
      var response = await http.post(url, body: jsonEncode(data));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print('////////// Models /////////');
        Boutique boutique = Boutique(
            id: "${data["name"]}",
            description: description,
            type: type,
            user: user);
        // print('///////// Fin Models /////////');
        _item.add(boutique);
        notifyListeners();
        // print('////////// _ITEM /////////');
      }
    } catch (e) {
      print(e);
    }
  }

  /**
   * GET Boutique
   */

  Future<void> getBoutique() async {
    final String url = "https://appsecom-839d9.firebaseio.com/boutique.json";
    try {
      var response = await http.get(url);
      // print(response.body);
      if (response.statusCode == 200) {
        _item = [];
        // print('////////// Insérer dans le provider /////////');
        Map<String, dynamic> data = json.decode(response.body);
        data.forEach((key, value) {
          Boutique boutique = Boutique(
            id: key,
            description: value['description'],
            type: value['value'],
            user: User(
                id: value['iduser'],
                nom: value['nom'],
                prenom: value['prenom'],
                genre: (value['genre'] == 'Homme')
                    ? OptionGenre.Homme
                    : OptionGenre.Femme,
                telnumber: value['telephone'],
                email: value['email'],
                adress1: value['adresse'],
                codePostal: value['codePostal'],
                ville: value['ville'],
                pays: value['pays']),
          );
          _item.add(boutique);
        });
        // // print(_item.length);
        // print('////////// Fin Insertion dans le provider /////////');
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }

  /**
   * RECUPERATION DE LA BOUTIQUE DU USER CONNECTE
   */

  bool wheremail(String email) {
    return _item
        .where((element) => element.user.email == email)
        .toList()
        .isEmpty;
    // return _item.firstWhere((boutique) => boutique.user.nom == email);
  }

  Boutique findbyemail(String email) {
    return _item.firstWhere((element) => element.user.email == email);
  }

  /**
   * AJOUTER UN PRODUIT
   */

  Future<void> postProduct(
      Article product, String idBoutique, User user) async {
    Map data = {
      'title': product.title,
      'description': product.description,
      'price': product.price,
      'etat': product.etat,
      'picture': product.picture,
      'taille': product.taille,
      'marque': product.marque,
      'categorie': product.categorie,
      'sousCategorie': product.sousCategorie,
    };
    print(data);
    final String url = "https://appsecom-839d9.firebaseio.com/boutique.json";

    try {
      var response = await http.post(url, body: jsonEncode(data));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print('////////// Models /////////');
        Article products = Article(
            title: product.title,
            description: product.description,
            price: product.price,
            etat: product.etat,
            picture: product.picture,
            taille: product.taille,
            marque: product.marque,
            categorie: product.categorie,
            sousCategorie: product.sousCategorie,
            admin: user.id);
        // print('///////// Fin Models /////////');
        // _item.add(bout);
        notifyListeners();
        // print('////////// _ITEM /////////');
      }
    } catch (e) {
      print(e);
    }
  }
}
