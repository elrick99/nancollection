import 'package:firebase_auth/firebase_auth.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:nantest/Providers/Services/Articles.dart';
import 'package:nantest/Screens/BackEnd/AjoutArticle.dart';
import 'package:nantest/Screens/BackEnd/ArticleList.dart';
import 'package:nantest/Screens/BackEnd/HomeE.dart';
import 'package:nantest/Widgets/Badge.dart';
import 'package:provider/provider.dart';

class BottomBarE extends StatefulWidget {
  final FirebaseUser user;

  BottomBarE({Key key, this.user}) : super(key: key);
  @override
  _BottomBarEState createState() => _BottomBarEState();
}

class _BottomBarEState extends State<BottomBarE> {
  List<Widget> generatePage(
    FirebaseUser myUser,
  ) {
    return [
      HomeAdmin(
        user: myUser,
      ),
      ArticleListAdmin(
        user: myUser,
      ),
      Photo(
        user: myUser,
      ),
    ];
  }

  int _index = 0;
  @override
  Widget build(BuildContext context) {
    // print('Boutiqute');
    // print(widget.boutique.description);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFf9f9f9),
        extendBody: true,
        body: generatePage(widget.user)[_index],
        bottomNavigationBar: FloatingNavbar(
          backgroundColor: Colors.white,
          selectedBackgroundColor: Color(0xff562fbe),
          selectedItemColor: Colors.white,
          unselectedItemColor: Color(0xff292929),
          onTap: (int val) => setState(() => _index = val),
          currentIndex: _index,
          items: [
            FloatingNavbarItem(
                icon: Icon(
                  Icons.home,
                  color: (_index == 0) ? Colors.white : Colors.black,
                ),
                title: ''),
            // FloatingNavbarItem(
            //     icon: Icon(
            //       Icons.archive,
            //       color: (_index == 1) ? Colors.white : Colors.black,
            //     ),
            //     title: ''),
            FloatingNavbarItem(
              icon: Consumer<Articles>(
                builder: (BuildContext context, cartData, ch) => Badge(
                  child: ch,
                  value: cartData.items.length.toString(),
                  color: Colors.black,
                ),
                child: Icon(
                  Icons.archive,
                  color: (_index == 1) ? Colors.white : Colors.black,
                ),
              ),
              title: '',
            ),
            // FloatingNavbarItem(
            //     icon: Icon(
            //       Icons.account_circle,
            //       color: (_index == 3) ? Colors.white : Colors.black,
            //     ),
            //     title: ''),
            FloatingNavbarItem(
                icon: Icon(
                  Icons.add_a_photo,
                  color: (_index == 2) ? Colors.white : Colors.black,
                ),
                title: ''),
          ],
        ),
      ),
    );
  }
}
