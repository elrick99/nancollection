import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nantest/Screens/BaseAuth.dart';
import 'package:nantest/Screens/RoutePage.dart';
import 'package:nantest/Widgets/Article_Home.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Future<Null> _refresh() {
//   return getUser().then((_user) {
//     setState(() => user = _user);
//   });
// }
class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.logoutCallback, this.user})
      : super(key: key);

  FirebaseUser user;
  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  //     new GlobalKey<RefreshIndicatorState>();

  var emails;
  Future<void> sha() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    emails = prefs.getString('email');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sha();
  }

  @override
  Widget build(BuildContext context) {
    // print('///////dsfsdfsd/////////////');
    // print(emails);
    // var dataProduc;
    // Future<List<Product>> getUser() async {
    //   final provider = Provider.of<Products>(context, listen: false);
    //   dataProduc = provider.items;
    //   setState(() {
    //     return dataProduc;
    //   });
    //   return dataProduc;
    // }

    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            leading: IconButton(
                icon: Icon(
                  Icons.person_pin,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => RootPage(auth: Auth())));
                }),
            title: Center(
              child: Text(
                "Nan Collector",
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.grey,
            actions: <Widget>[
              CircleAvatar(
                  minRadius: 10,
                  backgroundColor: Colors.transparent,
                  child: IconButton(
                      icon: Icon(
                        Icons.notifications,
                        color: Colors.orange,
                      ),
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (_) => NotificationsScreen()));
                      }))
            ],
            expandedHeight: 300.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (_) => SearchBar()));
                },
                child: Card(
                  child: Container(
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          "Essayez<La creation de nath>",
                          style: TextStyle(fontSize: 13),
                        ),
                      )),
                ),
              ),
              background: Image(
                image: AssetImage("assets/images/fond.jpg"),
                fit: BoxFit.cover,
              ),
              // background: Image.network(
              //     'https://images.fr.shopping.rakuten.com/photo/basket-nike-air-max-97-921826-013-1230178019_ML.jpg'),
            ),
          ),
        ];
      },
      // body: RefreshIndicator(
      //     key: _refreshIndicatorKey,
      //     onRefresh: getUser,
      //     child: ArticleScreen(
      //       dataprod: getUser,
      //     ))
      body: ArticleScreen(),
    ));
  }
}
