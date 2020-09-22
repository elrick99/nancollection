import 'package:flutter/material.dart';
import 'package:nantest/Widgets/ArticleGridHome.dart';
import 'package:provider/provider.dart';

class ArticleScreen extends StatelessWidget {
  // final Function dataprod;

  // const ArticleScreen({Key key, this.dataprod}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // print('/////////RELOAD/////////');
    // dataprod.call();
    // print(dataprod);
    // final providerProducts = Provider.of<Products>(context);
    // final dataProduct = providerProducts.items;
    // print(dataProduct.length);
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 100.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    gradient: LinearGradient(
                        colors: [Colors.yellow[700], Colors.redAccent],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        tileMode: TileMode.clamp)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'BIENVENUE SUR BABISHOP !',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text('-50% sur votre première commande *',
                        style: TextStyle(color: Colors.white)),
                    Container(
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(color: Colors.white),
                      child: MaterialButton(
                          child: Text('En Profiter'), onPressed: () {}),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ArticleGridHome(),
              SizedBox(
                height: 20,
              ),
              // Footer(),
              // Container(
              //   height: 100,
              //   width: 200,
              //   color: Colors.red,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
