import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nantest/Providers/Services/Articles.dart';
import 'package:nantest/Screens/BackEnd/Update.dart';
import 'package:provider/provider.dart';

import 'Discussions.dart';

class ArticleListA extends StatefulWidget {
  final FirebaseUser user;
  const ArticleListA({Key key, this.user}) : super(key: key);
  @override
  _ArticleListAState createState() => _ArticleListAState();
}

class _ArticleListAState extends State<ArticleListA> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final provider = Provider.of<Articles>(context);
    provider.getProducts();
  }

  List<Articles> product;
  @override
  Widget build(BuildContext context) {
    final providerArticle = Provider.of<Articles>(context);
    final dataProduct = providerArticle.items;

    // print('////////////////ACTICLE BOUTIQUE///////////');
    // print(providerArticle);
    // print(providerArticle.map((e) => print(e.title)));
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text('Mes Produits',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black))),
        body: (dataProduct?.length == 0)
            ? Center(child: Text('Aucun Produit'))
            : Padding(
                padding: const EdgeInsets.all(4.0),
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 4,
                  itemCount: dataProduct.length,
                  itemBuilder: (BuildContext context, int index) => Padding(
                    padding: (index.isEven)
                        ? const EdgeInsets.only(top: 10.0)
                        : const EdgeInsets.only(top: 30.0),
                    child: InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => UpdateArticle(
                                    user: widget.user,
                                    categorieId: dataProduct[index].categorie,
                                    idArticle: dataProduct[index].code,
                                  ))),
                      child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      NetworkImage(dataProduct[index].picture),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height / 7,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10))),
                                child: Column(
                                  children: [
                                    Text(dataProduct[index].title,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                    Expanded(
                                        child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '\$ ${dataProduct[index].price}',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Container(
                                              child: Row(
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (_) =>
                                                              DiscuAdmin()));
                                                },
                                                icon: Icon(
                                                  Icons.message,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ))
                                        ],
                                      ),
                                    ))
                                  ],
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                  staggeredTileBuilder: (int index) =>
                      new StaggeredTile.count(2, (index.isEven) ? 3.5 : 4),
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                ),
              ));
  }
}
