// import 'package:apps_ecom/Providers/Models/Product.dart';
// import 'package:apps_ecom/Providers/Models/User.dart';
import 'package:flutter/foundation.dart';
import 'package:nantest/Providers/Models/Article.dart';
import 'package:nantest/Providers/Models/User.dart';

class Boutique with ChangeNotifier {
  final String id;
  final String type;
  final String description;
  final User user;
  List<Article> products;

  Boutique({this.id, this.type, this.description, this.user, this.products});
}
