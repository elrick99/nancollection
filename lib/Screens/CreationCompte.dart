import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nantest/Providers/Models/User.dart';
import 'package:nantest/Providers/Services/Boutiques.dart';
import 'package:nantest/Providers/Services/Users.dart';
import 'package:nantest/Widgets/BottomBarA.dart';
import 'package:nantest/Widgets/BottomBarE.dart';
import 'package:provider/provider.dart';

enum TypeOptions { Particulier, Createur, Bloggeur, VenderPro }

class CreationCompte extends StatefulWidget {
  final FirebaseUser user;
  const CreationCompte({Key key, this.user}) : super(key: key);
  @override
  _CreationCompteState createState() => _CreationCompteState();
}

class _CreationCompteState extends State<CreationCompte> {
  User users;
  bool genreF = true;
  bool genreM = false;

  /**
   * Input
   */
  String description;
  String adresse;
  String codePostal;
  String ville;
  String telephone;

  static const menuItems = <String>[
    'EMPLOYEE',
    'COLLECTIONNEUR',
  ];

  static const paysItems = <String>[
    'COTE D\'IVOIRE',
    'MALI',
    'BURKINA FASO',
    'GHANA',
    'TOGO',
    'NIGERIA',
    'NIGER',
    'GUINEE'
  ];
  final List<DropdownMenuItem<String>> _dropDownpaysItems = paysItems
      .map((String value) => DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          ))
      .toList();
  final List<DropdownMenuItem<String>> _dropDownMenuItems = menuItems
      .map((String values) => DropdownMenuItem<String>(
            value: values,
            child: Text(values),
          ))
      .toList();
  String _btnSelectedVal = 'EMPLOYEE';
  // String _btnSelectedVal1 = 'COTE D\'IVOIRE';

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final provider = Provider.of<UsersService>(context);
    provider.getUser();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UsersService>(context, listen: true);

    final providerB = Provider.of<Boutiques>(context);
    var etat = provider.wheremail(widget.user.email);
    if (etat == true)
      return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.white),
          child: Center(
              child: CircularProgressIndicator(
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
          )));
    else
      users = provider.findById(widget.user.email);
    // print('//////////////////USER////////////////');
    // print(users.genre);
    // users.genre == null ? print('Aucun Genre') : print('Genre');
    if (users.genre == OptionGenre.Femme) {
      genreM = false;
      genreF = true;
    } else {
      genreM = true;
      genreF = false;
    }

    // print(widget.user);
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color(0xFFee7b77)),
          backgroundColor: Colors.white,
          title: Text(
            "CREER MON COMPTE",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // height: MediaQuery.of(context).size.height / 2.2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0, top: 10),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 6,
                          width: MediaQuery.of(context).size.width,
                          // decoration: BoxDecoration(color: Colors.red),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Type',
                                style: TextStyle(fontSize: 18),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height / 12,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(),
                                child: DropdownButton<String>(
                                    isExpanded: true,
                                    value: _btnSelectedVal,
                                    onChanged: (String newValue) {
                                      setState(() {
                                        _btnSelectedVal = newValue;
                                        print(_btnSelectedVal);
                                      });
                                    },
                                    items: this._dropDownMenuItems),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Container(
                      //   height: MediaQuery.of(context).size.height / 4,
                      //   width: MediaQuery.of(context).size.width,
                      //   // decoration: BoxDecoration(color: Colors.red),
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //     children: [
                      //       Text(
                      //         'Description',
                      //         style: TextStyle(fontSize: 18),
                      //       ),
                      //       Container(
                      //         height: MediaQuery.of(context).size.height / 6,
                      //         width: MediaQuery.of(context).size.width,
                      //         decoration: BoxDecoration(
                      //             border: Border.all(color: Colors.black)),
                      //         child: TextFormField(
                      //           onChanged: (String valueDesc) {
                      //             setState(() {
                      //               description = valueDesc;
                      //             });
                      //           },
                      //           decoration: InputDecoration(
                      //             focusedBorder: InputBorder.none,
                      //             border: UnderlineInputBorder(),
                      //           ),
                      //           maxLines: 5,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 1.8,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 6,
                          width: MediaQuery.of(context).size.width,
                          // decoration: BoxDecoration(color: Colors.red),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Genre',
                                style: TextStyle(fontSize: 18),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height / 10,
                                // decoration: BoxDecoration(color: Colors.red),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          // setState(() {
                                          //   genreF = true;
                                          //   genreM = false;
                                          // });
                                        },
                                        child: Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          decoration: BoxDecoration(
                                              color: (genreF == false)
                                                  ? Colors.white
                                                  : Colors.black,
                                              border: Border.all(
                                                  color: (genreF == false)
                                                      ? Colors.black
                                                      : Colors.white)),
                                          child: Center(
                                            child: Text('FEMME',
                                                style: TextStyle(
                                                    color: (genreF == false)
                                                        ? Colors.black
                                                        : Colors.white)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          // setState(() {
                                          //   genreM = true;
                                          //   genreF = false;
                                          // });
                                        },
                                        child: Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          decoration: BoxDecoration(
                                              color: (genreM == true)
                                                  ? Colors.black
                                                  : Colors.white,
                                              border: Border.all(
                                                  color: (genreM == true)
                                                      ? Colors.white
                                                      : Colors.black)),
                                          child: Center(
                                            child: Text(
                                              'HOMME',
                                              style: TextStyle(
                                                  color: (genreM == true)
                                                      ? Colors.white
                                                      : Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 6,
                        width: MediaQuery.of(context).size.width,
                        // decoration: BoxDecoration(color: Colors.red),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Prénom',
                              style: TextStyle(fontSize: 18),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 12,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black)),
                              child: (users.password == "")
                                  ? Center(
                                      child: Text(
                                      users.prenom,
                                      style: TextStyle(fontSize: 18),
                                    ))
                                  : TextFormField(
                                      decoration: InputDecoration(
                                        focusedBorder: InputBorder.none,
                                        border: UnderlineInputBorder(),
                                      ),
                                      maxLines: 1,
                                    ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 6,
                        width: MediaQuery.of(context).size.width,
                        // decoration: BoxDecoration(color: Colors.red),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Nom',
                              style: TextStyle(fontSize: 18),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 12,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black)),
                              child: (users.password == "")
                                  ? Center(
                                      child: Text(
                                      users.nom,
                                      style: TextStyle(fontSize: 18),
                                    ))
                                  : TextFormField(
                                      decoration: InputDecoration(
                                        focusedBorder: InputBorder.none,
                                        border: UnderlineInputBorder(),
                                      ),
                                      maxLines: 1,
                                    ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 10),
                      //   child: Container(
                      //     height: MediaQuery.of(context).size.height / 6,
                      //     width: MediaQuery.of(context).size.width,
                      //     // decoration: BoxDecoration(color: Colors.red),
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //       children: [
                      //         Text(
                      //           'Pays',
                      //           style: TextStyle(fontSize: 18),
                      //         ),
                      //         Container(
                      //           height: MediaQuery.of(context).size.height / 12,
                      //           width: MediaQuery.of(context).size.width,
                      //           decoration: BoxDecoration(),
                      //           child: DropdownButton<String>(
                      //               isExpanded: true,
                      //               value: _btnSelectedVal1,
                      //               onChanged: (String newValue) {
                      //                 setState(() {
                      //                   _btnSelectedVal1 = newValue;
                      //                   print(_btnSelectedVal1);
                      //                 });
                      //               },
                      //               items: this._dropDownpaysItems),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // Container(
                      //   height: MediaQuery.of(context).size.height / 6,
                      //   width: MediaQuery.of(context).size.width,
                      //   // decoration: BoxDecoration(color: Colors.red),
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //     children: [
                      //       Text(
                      //         'Adresse',
                      //         style: TextStyle(fontSize: 18),
                      //       ),
                      //       Container(
                      //         height: MediaQuery.of(context).size.height / 12,
                      //         width: MediaQuery.of(context).size.width,
                      //         decoration: BoxDecoration(
                      //             border: Border.all(color: Colors.black)),
                      //         child: TextFormField(
                      //           onChanged: (String valueAdd) {
                      //             setState(() {
                      //               adresse = valueAdd;
                      //             });
                      //           },
                      //           decoration: InputDecoration(
                      //             focusedBorder: InputBorder.none,
                      //             border: UnderlineInputBorder(),
                      //           ),
                      //           maxLines: 1,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Container(
                      //   height: MediaQuery.of(context).size.height / 6,
                      //   width: MediaQuery.of(context).size.width,
                      //   // decoration: BoxDecoration(color: Colors.red),
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //     children: [
                      //       Text(
                      //         'Code Postal',
                      //         style: TextStyle(fontSize: 18),
                      //       ),
                      //       Container(
                      //         height: MediaQuery.of(context).size.height / 12,
                      //         width: MediaQuery.of(context).size.width,
                      //         decoration: BoxDecoration(
                      //             border: Border.all(color: Colors.black)),
                      //         child: TextFormField(
                      //           onChanged: (String valueCodPos) {
                      //             setState(() {
                      //               codePostal = valueCodPos;
                      //             });
                      //           },
                      //           decoration: InputDecoration(
                      //             focusedBorder: InputBorder.none,
                      //             border: UnderlineInputBorder(),
                      //           ),
                      //           maxLines: 1,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Container(
                        height: MediaQuery.of(context).size.height / 6,
                        width: MediaQuery.of(context).size.width,
                        // decoration: BoxDecoration(color: Colors.red),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Ville',
                              style: TextStyle(fontSize: 18),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 12,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black)),
                              child: TextFormField(
                                onChanged: (String valueVil) {
                                  setState(() {
                                    ville = valueVil;
                                  });
                                },
                                decoration: InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  border: UnderlineInputBorder(),
                                ),
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                // height: MediaQuery.of(context).size.height / 1.8,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, bottom: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          // decoration: BoxDecoration(color: Colors.red),
                          child: Column(
                            children: [
                              Text(
                                  'Votre Numero de Téléphone ne sera pas aficché publiquement\n Il sera communiqué à un tiers uniquement en cas de remise en main propre de l\'article')
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 6,
                        width: MediaQuery.of(context).size.width,
                        // decoration: BoxDecoration(color: Colors.red),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Téléphone',
                              style: TextStyle(fontSize: 18),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 12,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black)),
                              child: TextFormField(
                                onChanged: (String valueTel) {
                                  setState(() {
                                    telephone = valueTel;
                                    print(telephone);
                                  });
                                },
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  border: UnderlineInputBorder(),
                                ),
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, bottom: 10),
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 7,
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                            'Le vendeur, s\'il se presente comme un consommateur ou un non-professionnel, alors qu\'il agit à titre professionnel, en court des sanctions'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 12,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.black,
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              provider.addUser(
                                  email: users.email,
                                  genre: users.genre,
                                  telephone: telephone,
                                  prenom: users.prenom,
                                  ville: ville,
                                  type: _btnSelectedVal,
                                  nom: users.nom);

                              _btnSelectedVal == "EMPLOYEE"
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
                                              )));

                              // providerB.postBoutique(
                              //     _btnSelectedVal,
                              //     description,
                              //     User(
                              //       id: users.id,
                              //       nom: users.nom,
                              //       prenom: users.prenom,
                              //       email: users.email,
                              //       genre: users.genre,
                              //       telnumber: telephone,
                              //       ville: ville,
                              //     ));
                            },
                            splashColor: Colors.white24,
                            child: Center(
                              child: Text(
                                'Valider',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
