import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:nantest/Providers/Models/User.dart';

class UsersService with ChangeNotifier {
  List<User> _items = [];

  List<User> get items => [..._items];
/**
 * POST SUR FIREBASE
 */
  Future<void> addUser(
      {String password,
      nom,
      prenom,
      genre,
      email,
      type,
      ville,
      telephone}) async {
    final String url = "https://appsecom-839d9.firebaseio.com/userfinal.json";
    final Map<String, dynamic> data = {
      "nom": nom,
      "prenom": prenom,
      "email": email,
      "password": password,
      "genre": (genre == OptionGenre.Homme) ? "Homme" : "Femme",
      "Type": type,
      "Ville": ville,
      "Telephone": telephone
    };
    // print(data);

    try {
      var response = await http.post(url, body: json.encode(data));
      print('///////////RESPONSE///////////');
      // print(response.body);
      var newUser = User(
          id: json.decode(response.body)['nom'],
          prenom: prenom,
          email: email,
          type: type,
          password: password,
          genre: (genre == 'Femme') ? OptionGenre.Homme : OptionGenre.Homme);
      _items.insert(0, newUser);
      print(_items.length);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  /**
     * GET SUR FIREBASE
     */

  Future<void> getUser() async {
    final String url = "https://appsecom-839d9.firebaseio.com/userfinal.json";
    try {
      var response = await http.get(url);
      print(response.body);
      if (response.statusCode == 200) {
        _items = [];
        // print('////////// Insérer dans le provider /////////');
        Map<String, dynamic> data = json.decode(response.body);
        data.forEach((key, value) {
          User product = User(
              id: key,
              nom: value['nom'],
              prenom: value["prenom"],
              email: value["email"],
              type: value["Type"],
              genre: (value['genre'] == 'Homme')
                  ? OptionGenre.Homme
                  : OptionGenre.Femme,
              password: value['password']);
          _items.add(product);
        });
        // print('////////// Fin Insertion dans le provider /////////');
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }

  /**
   * RECUPERATION D'UN USER
   */
  User findById(String email) {
    print(email);
    return _items.firstWhere((user) => user.email == email);
  }

  bool wheremail(String email) {
    return _items.where((element) => element.email == email).toList().isEmpty;
    // return _item.firstWhere((boutique) => boutique.user.nom == email);
  }
}

// ///
// /// J"AJOUTE MES PRODUIT DAN MA BASE DE DONNEE
// ///
//   Future<void> addItem(Product product)async{
//     final String url = 'https://flutter-shoping.firebaseio.com/products.json';
//     final Map<String, dynamic> data = {
//       'title': product.title,
//       'description': product.description,
//       'imageUrl': product.imageUrl,
//       'price': product.price,
//       'isFavorite': product.isfavorite,
//     };
//     try{
//     ///
//     /// IL FAUT ENCODER LA DATA AVANT DE L'ENVOYER
//     /// lorsqu'on envoie les donnee en ligne on encode
//     /// et lorsque on reçoit les donnée on decode
//       http.Response response = await http.post(url, body: json.encode(data));
//       var newProduct = Product(
//         id: json.decode(response.body)['name'],
//         title: product.title,
//         price: product.price,
//         imageUrl: product.imageUrl,
//         description: product.description
//         );

//       _items.insert(0, newProduct);
//       notifyListeners();

//     }catch(error){
//       throw error;
//     }

//   }
