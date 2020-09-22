import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nantest/Screens/BaseAuth.dart';
import 'package:nantest/Screens/CreationCompte.dart';

class LoginSignupPage extends StatefulWidget {
  LoginSignupPage({this.auth, this.loginCallback});

  final BaseAuth auth;
  final VoidCallback loginCallback;

  @override
  State<StatefulWidget> createState() => new _LoginSignupPageState();
}

class _LoginSignupPageState extends State<LoginSignupPage> {
  final _formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  String _errorMessage;

  bool _isLoginForm;
  bool _isLoading;
  bool _busy = false;
  FirebaseUser _user;

  // Check if form is valid before perform login or signup
  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  // Perform login or signup
  void validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    if (validateAndSave()) {
      String userId = "";
      try {
        if (_isLoginForm) {
          userId = await widget.auth.signIn(_email, _password);
          print('Signed in: $userId');
        } else {
          userId = await widget.auth.signUp(_email, _password);
          //widget.auth.sendEmailVerification();
          //_showVerifyEmailSentDialog();
          print('Signed up user: $userId');
        }
        setState(() {
          _isLoading = false;
        });

        if (userId.length > 0 && userId != null && _isLoginForm) {
          widget.loginCallback();
        }
      } catch (e) {
        print('Error: $e');
        setState(() {
          _isLoading = false;
          _errorMessage = e.message;
          _formKey.currentState.reset();
        });
      }
    }
  }

  @override
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    _isLoginForm = true;
    super.initState();
  }

  void resetForm() {
    _formKey.currentState.reset();
    _errorMessage = "";
  }

  void toggleFormMode() {
    resetForm();
    setState(() {
      _isLoginForm = !_isLoginForm;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print('//////////////// AUTH ///////////////');
    // print(FirebaseAuth.instance.currentUser());
    return new Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.grey.shade300,
          elevation: 0,
          title: Column(
            children: [
              Text(
                "Connexion",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              Text(
                "Identifiez-vous pour acceder a votre compte",
                style: TextStyle(color: Colors.black, fontSize: 10),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              _showForm(),
              _showCircularProgress(),
            ],
          ),
        )));
  }

  Widget _showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

//  void _showVerifyEmailSentDialog() {
//    showDialog(
//      context: context,
//      builder: (BuildContext context) {
//        // return object of type Dialog
//        return AlertDialog(
//          title: new Text("Verify your account"),
//          content:
//              new Text("Link to verify account has been sent to your email"),
//          actions: <Widget>[
//            new FlatButton(
//              child: new Text("Dismiss"),
//              onPressed: () {
//                toggleFormMode();
//                Navigator.of(context).pop();
//              },
//            ),
//          ],
//        );
//      },
//    );
//  }

  Widget _showForm() {
    return new Container(
        padding: EdgeInsets.only(left: 8.0, right: 8.0),
        child: new Form(
          key: _formKey,
          child: new ListView(
            shrinkWrap: true,
            children: <Widget>[
              // showEmailInput(),
              // showPasswordInput(),
              // showPrimaryButton(),
              // showSecondaryButton(),
              showThistButton(),
              showErrorMessage(),
            ],
          ),
        ));
  }

  Widget showErrorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return new Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }

  Widget showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Email',
            icon: new Icon(
              Icons.mail,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => _email = value.trim(),
      ),
    );
  }

  Widget showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Password',
            icon: new Icon(
              Icons.lock,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
        onSaved: (value) => _password = value.trim(),
      ),
    );
  }

  Widget showSecondaryButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
      child: SizedBox(
        height: 50,
        child: new FlatButton(
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            color: Colors.black,
            child: new Text('Creer un compte',
                style: new TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey)),
            onPressed: () {
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (_) => CreerMonCompte()));
            }),
      ),
    );
  }

  Widget showPrimaryButton() {
    return new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
        child: SizedBox(
          height: 50.0,
          child: new RaisedButton(
            elevation: 5.0,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            color: Colors.black,
            child: new Text('Connexion',
                style: new TextStyle(fontSize: 20.0, color: Colors.white)),
            onPressed: validateAndSubmit,
          ),
        ));
  }

  Widget showThistButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
      child: SizedBox(
        height: 50.0,
        child: InkWell(
          onTap: this._busy
              ? null
              : () async {
                  try {
                    setState(() => this._busy = true);
                    final user = await this._googleSignIn();
                    this._showUserProfilePage(user);
                  } catch (e) {
                    setState(() => this._busy = false);
                  }
                },
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width / 1.5,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26),
              border: Border.all(color: Colors.black),
              // color: Color(0xff22C8CF),
            ),
            child: Text(
              "connexion avec google",
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
          ),
        ),
      ),
    );
  }

  Future<FirebaseUser> _googleSignIn() async {
    final curUser = this._user ?? await FirebaseAuth.instance.currentUser();
    if (curUser != null && !curUser.isAnonymous) {
      return curUser;
    }

    final googleUser = await GoogleSignIn().signIn();

    final googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // Note: user.providerData[0].photoUrl == googleUser.photoUrl.

    // FirebaseAuth.instance.currentUser();

    final user =
        (await FirebaseAuth.instance.signInWithCredential(credential)).user;
//    kFirebaseAnalytics.logLogin();
    setState(() => this._user = user);

    return user;
  }

  void _showUserProfilePage(FirebaseUser user, {FirebaseAuth users}) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (ctx) => CreationCompte(
                user: user,
              )),
    );
  }
}

/// ***************************************************
/// GET CURRENT USER WITH FIREBASE
///

/*

get firebaseAuth => FirebaseAuth.instance;

firebaseAuth

*/
