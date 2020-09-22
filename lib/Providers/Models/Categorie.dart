import 'package:nantest/Providers/Models/Article.dart';

class Categorie {
  final int id;
  final String title;
  List<Article> listArticle;

  Categorie(this.id, this.title, {this.listArticle});
}
