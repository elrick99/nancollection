import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DiscuAdmin extends StatefulWidget {
  final FirebaseUser user;

  const DiscuAdmin({Key key, this.user}) : super(key: key);
  @override
  _DiscuAdminState createState() => _DiscuAdminState();
}

class _DiscuAdminState extends State<DiscuAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Discussions',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
