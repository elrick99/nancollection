import 'package:flutter/material.dart';
import 'package:nantest/Providers/Services/Articles.dart';
import 'package:nantest/Widgets/Article_Item.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArticleGridHome extends StatefulWidget {
  @override
  _ArticleGridHomeState createState() => _ArticleGridHomeState();
}

class _ArticleGridHomeState extends State<ArticleGridHome> {
  var emails;
  Future<void> sha() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    emails = prefs.getString('email');
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final provider = Provider.of<Articles>(context);
    provider.getProducts();
    sha();
  }

  @override
  Widget build(BuildContext context) {
    int i = 0;
    final providerProducts = Provider.of<Articles>(context);
    final dataProduct = providerProducts.items;
    // print('/////////////DATA PRODUCTS////////////////');
    // print(dataProduct.map((e) => print(e.title)));
    return GridView.count(
      // key: key,
      physics: ClampingScrollPhysics(),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: 2 / 3,
      children: dataProduct.map((product) {
        // i--;
        i++;
        // print(i - 1);
        int a = i - 1;
        // print(a);
        return ChangeNotifierProvider.value(
          value: dataProduct[a],
          child: InkWell(
            // onTap: () => Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (_) => DetailsScreen(id: product.id))),
            child: ArticleItem(
              email: emails,
            ),
          ),
        );
      }).toList(),
    );
  }
}
