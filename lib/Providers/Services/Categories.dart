import 'package:flutter/material.dart';
import 'package:nantest/Providers/Models/Categorie.dart';

class Categories with ChangeNotifier {
  List<Categorie> _items = [
    /**
     * Homme
     */
    Categorie(
      1,
      'Homme',
    ),

    /**
     * Femme
     */

    Categorie(
      2,
      'Femme',
    ),

    /**
     * Bébé
     */

    Categorie(
      3,
      'Bébé',
    ),

    /**
     * Fille
     */

    Categorie(
      4,
      'Fille',
    ),

    /**
     * Garçon
     */

    Categorie(
      5,
      'Garçon',
    )
  ];

  // var _showFavotitesOnly = false;

  List<Categorie> get items {
    // if (_showFavotitesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._items];
  }

  // List<Categories> get favoriteItems =>
  //     _items.where((prodItem) => prodItem.isFavorite).toList();

  Categorie findById(int id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  // void showFavoritesOnly() {
  //   _showFavotitesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavotitesOnly = false;
  //   notifyListeners();
  // }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }
}
