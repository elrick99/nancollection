import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:nantest/Providers/Models/Article.dart';
import 'package:nantest/Providers/Services/Articles.dart';
import 'package:provider/provider.dart';

class ArticleItem extends StatefulWidget {
  final String email;

  const ArticleItem({Key key, this.email}) : super(key: key);

  @override
  _ArticleItemState createState() => _ArticleItemState();
}

class _ArticleItemState extends State<ArticleItem> {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Article>(context, listen: false);

    final providerProduct = Provider.of<Articles>(context);
    // print(providerProduct.postFavoris(key: product.code));
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(product.picture),
                            fit: BoxFit.cover)),
                    // child: Stack(
                    //   children: [
                    //     Positioned(
                    //       right: 5,
                    //       child: Consumer<Article>(builder: (ctx, product, _) {
                    //         return IconButton(
                    //             icon: Icon(product.isFavorite
                    //                 ? Icons.favorite
                    //                 : Icons.favorite_border),
                    //             onPressed: () {
                    //               product.toggleFavoriteStatus();
                    //             },
                    //             color: Color(0xFFee7b77));
                    //       }),
                    //     ),
                    //   ],
                    // ),
                  )),
              Expanded(
                  child: Container(
                width: MediaQuery.of(context).size.width,
                // color: Colors.green,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${product.price} \Frs',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        )),
                    Text(product.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        )),
                    Text(product.description,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle())
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
