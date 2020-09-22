// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nantest/Providers/Models/Boutique.dart';
import 'package:nantest/Providers/Models/User.dart';
import 'package:nantest/Providers/Services/Boutiques.dart';
import 'package:nantest/Providers/Services/Users.dart';
import 'package:nantest/Screens/BaseAuth.dart';
import 'package:nantest/Screens/HomePage.dart';
import 'package:nantest/Widgets/BottomBarA.dart';
import 'package:nantest/Widgets/BottomBarE.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilScreen extends StatefulWidget {
  ProfilScreen(
      {Key key, this.auth, this.userId, this.logoutCallback, this.user})
      : super(key: key);

  FirebaseUser user;
  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;
  @override
  _ProfilScreenState createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  //  void _addData() {
  //   try {
  //     Firestore.instance.runTransaction((Transaction transaction) async {
  //       CollectionReference reference =
  //           Firestore.instance.collection('Présence');
  //       await reference.add({
  //         "email": widget.user.email,
  //         "name": widget.user.displayName
  //       });
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  //   widget.user.sendEmailVerification();
  // }
  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }

  Widget gmailWidget() {
    return Container(
      height: MediaQuery.of(context).size.height / 3.5,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.white),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.user.photoUrl),
                      fit: BoxFit.cover),
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(100)),
            ),
            Container(
              child: (widget.user.email == null)
                  ? Text(widget.userId)
                  : Text(widget.user.email,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            )
          ],
        ),
      ),
    );
  }

  Widget emailWidget() {
    return Container(
      height: MediaQuery.of(context).size.height / 3.5,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.white),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                  // color: Colors.amber,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(100)),
              child: Icon(
                Icons.person,
                size: 100,
                color: Colors.grey,
              ),
            ),
            Container(
              child: (widget.user == null)
                  ? Text(widget.userId)
                  : Text(widget.user.email,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            )
          ],
        ),
      ),
    );
  }

  var emails;
  Future<void> sha() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', (widget.user.email));
    emails = prefs.getString('email');
    // print(emails);
  }

  User boutique;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final provider = Provider.of<UsersService>(context);
    provider.getUser();
    sha();
  }

  User users;
  @override
  Widget build(BuildContext context) {
    // print('////////////////SHARED PREFERENCES///////////');
    // print(emails);

    final providerB = Provider.of<UsersService>(context);
    var etat = providerB.wheremail(widget.user.email);

    // var type = providerB.wheretype("EMPLOYEE");
    // print(type);

    if (etat == true) {
      boutique = providerB?.findById(widget.user.email);
    } else
      boutique = providerB?.findById(widget.user.email);

    if (boutique == null) {
      return CircularProgressIndicator();
    }

    // print('aziahzeih');
    // print(boutique.type);
    // print("USER");
    // print(widget.user.email);
    // print(boutique.type);
    // print(widget.user);
    return Scaffold(
      backgroundColor: Colors.grey[250],
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
        iconTheme: IconThemeData(color: Color(0xFFee7b77)),
        backgroundColor: Colors.white,
        title: Text(
          'Mon Compte',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(),
        child: ListView(
          children: [
            (widget.user.photoUrl != null) ? gmailWidget() : emailWidget(),
            Divider(),
            InkWell(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (_) => MonCompte(user: widget.user)));
              },
              child: Container(
                height: MediaQuery.of(context).size.height / 10,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                      Text(
                        'Editer Mon Compte',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios, color: Colors.grey)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 10,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.mode_comment,
                      color: Colors.black,
                    ),
                    Text(
                      'Mes Discussions',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios, color: Colors.grey),
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (_) => DiscussionScreen()));
                      },
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 10,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.notifications,
                      color: Colors.black,
                    ),
                    Text(
                      'Notifictions',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios, color: Colors.grey),
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (_) => NotificationsScreen()));
                      },
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                child: Text(
                  'Mes Achats',
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 10,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.beenhere,
                      color: Colors.black,
                    ),
                    Text(
                      'Mes Commandes',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios, color: Colors.grey),
                      // onPressed: () => Navigator.push(context,
                      //     MaterialPageRoute(builder: (_) => CommandesScreen())),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 10,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.favorite_border,
                      color: Colors.black,
                    ),
                    Text(
                      'Mes Favoris',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios, color: Colors.grey),
                      // onPressed: () => Navigator.push(context,
                      //     MaterialPageRoute(builder: (_) => Favoris())),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                child: Text(
                  'Ma Boutique',
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ),
            ),
            InkWell(
              onTap: () => (boutique.type == "EMPLOYEE")
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => BottomBarE(
                                user: widget.user,
                              )))
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => BottomBarA(
                                user: widget.user,
                              ))),
              child: Container(
                height: MediaQuery.of(context).size.height / 10,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.card_giftcard,
                        color: Colors.black,
                      ),
                      Text(
                        (boutique.type == "EMPLOYEE")
                            ? 'PlateForme Employé'
                            : 'PlateForme Collectionneur',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios, color: Colors.grey)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                child: Text(
                  'Paramètres de Compte',
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 10,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.photo_filter,
                      color: Colors.black,
                    ),
                    Text(
                      'Mes Préférences',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, color: Colors.grey)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 10,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.account_balance_wallet,
                      color: Colors.black,
                    ),
                    Text(
                      'Mon Porte-Monnaie',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, color: Colors.grey)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 10,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.black,
                    ),
                    Text(
                      'Mon Service Clients',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, color: Colors.grey)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () async {
                FirebaseAuth.instance.signOut();

                GoogleSignIn().signOut();
                SharedPreferences prefs = await SharedPreferences.getInstance();
                emails = prefs.remove('email');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => HomePage()));
                // signOut();
              },
              child: Container(
                height: MediaQuery.of(context).size.height / 10,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.help_outline,
                        color: Colors.black,
                      ),
                      Text(
                        'Deconnection',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      Icon(Icons.settings_power, color: Colors.grey)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
