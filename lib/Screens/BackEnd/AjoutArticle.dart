// import 'package:flutter/material.dart';

// class BoutiqueScreen extends StatefulWidget {
//   const BoutiqueScreen({Key key}): super(key: key);
//   @override
//   _BoutiqueScreenState createState() => _BoutiqueScreenState();
// }

// class _BoutiqueScreenState extends State<BoutiqueScreen> {
//   static const statut=<String>[
//   "Particulier"
//   "Createur"
//   "Bloggeur"
//   "Vender professionnel"
//   ];
//   // final List<DropdownMenuItem<String>>_dropDownMenuItems=statut.map(
//   //   (String value)=>DropdownMenuItem<String>(
//   //   value: value,
//   //   child: Text(value),
//   //   ),
//   // ).toList();
// //   final List<PopupMenuItem<String>>_popUpMenuItems=statut.map((String value) => PopupMenuItem<String>(
// // value: value,
// // child: Text(value),
// //   )).toList();
//   String _btn1SelectedVal="Particulier";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//   appBar: AppBar(
//     title: Text("CREER MA BOUTIQUE",
//     style: TextStyle(
//       color: Colors.black
//     ),
//     ),
//   ),

//   body: SingleChildScrollView(
//     child: Container(
//       child: Column(
//     children: [
//    Stack(
//      overflow: Overflow.visible,
//      children: [
//           Container(
//          height: 200,
//          width: double.infinity,
//          color: Colors.orange.shade100,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.phone_iphone, color: Colors.black,size: 40,),
//              Container(
//               height: 50,
//               width: 250,
//               child: Text("Avant de mettre en vente vos articles, creez votre boutique en quelque seconds!"),
//             ),

//           ],
//         ),
//       ),
//        Positioned(
//          left: 150,
//          bottom: -30,
//             child:Container(
//               height: 70,
//               width: 70,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(100),
//                 color: Colors.green
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   IconButton(icon: Icon(Icons.add), onPressed:() async=> await _pickImageFromCamera(),
//                   tooltip: "Pick",
//                   ),
//                   Text("Ajouter"),
//                    Text("Uun photo")
//                 ],
//               ),
//             )
//           ),
//      ],
//    ),

//    Padding(
//      padding: const EdgeInsets.all(30),
//      child: Column(
//        children: [
//        Card(
//          elevation: 7,
//          child: Container(
//             height: 40,
//           width: MediaQuery.of(context).size.width/1,
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: [
//                Container(
//                  child: Text("particulier"),
//                ),
//                DropdownButton<String>(
//                  items: [],
//                  value: _btn1SelectedVal,
//                  onChanged: (String newValue){
//                    setState(() {
//                      _btn1SelectedVal= newValue;
//                    });
//                  },
//                 // items:this._dropDownMenuItems,
//                ),
//              ],
//            ),
//          ),
//        ),
//     SizedBox(height: 10,),
//        Card(
//          elevation: 7,
//          child: TextFormField(
//          textCapitalization: TextCapitalization.words,
//          decoration: InputDecoration(
//          border: OutlineInputBorder(),
//          filled: true,
//          hintText: 'Description de vos activites',
//          labelText: 'Description(facultatif)'
//          ),
//          maxLength: 250,
//          ),
//        ),
//         SizedBox(height: 10,),
//        Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//              Container(child: Text("Addre de votre boutique",
//              style: TextStyle(
//                fontWeight: FontWeight.bold
//              ),
//              )),
//                Container(child: Text("Elle sera utiser en cas de remise en main propre ou de retour du colis"))
//           ],
//        ),
//        SizedBox(height: 10,),
//        Container(
//          width: 300,
//          height: 50,
//          child: Row(
//            children: [
//              Container(
//                 width: 150,
//                 height: 50,
//                 color: Colors.grey,
//                child: Center(child: Text("Mme")),
//              ),
//                Container(
//                  color: Colors.grey.shade300,
//                   width: 150,
//                child: Center(child: Text("M.")),
//              )

//            ],
//          ),
//        ),
//            SizedBox(height: 24,),
//            Card(
//              elevation: 7,
//              child: TextFormField(
//               textCapitalization: TextCapitalization.words,
//               decoration: InputDecoration(
//                 border: UnderlineInputBorder(),
//                 filled: true,
//                 hintText: 'votre nom',
//                 labelText: 'nom'
//               ),
//              ),
//            ),
//             SizedBox(height: 24,),
//            Card(
//              elevation: 7,
//              child: TextFormField(
//               textCapitalization: TextCapitalization.words,
//               decoration: InputDecoration(
//                 border: UnderlineInputBorder(),
//                 filled: true,
//                 hintText: 'votre prenom',
//                 labelText: 'prenom'
//               ),
//              ),
//            ),
//             SizedBox(height: 24,),
//              Card(
//                elevation: 7,
//                child: TextFormField(
//             textCapitalization: TextCapitalization.words,
//             decoration: InputDecoration(
//                 border: UnderlineInputBorder(),
//                 filled: true,
//                 hintText: 'Code postal',
//                 labelText: 'Code postal'
//             ),
//             keyboardType: TextInputType.phone,
//            ),
//              ) ,

//               SizedBox(height: 24,),
//            Card(
//            elevation: 7,
//              child: TextFormField(
//               textCapitalization: TextCapitalization.words,
//               decoration: InputDecoration(
//                 border: UnderlineInputBorder(),
//                 filled: true,
//                 hintText: 'votre ville',
//                 labelText: 'ville'
//               ),
//              ),
//            ),
//            SizedBox(height: 24,),
//               Card(
//                 elevation: 7,
//                 child: TextFormField(
//             textCapitalization: TextCapitalization.words,
//             decoration: InputDecoration(
//                 border: UnderlineInputBorder(),
//                 filled: true,
//                 hintText: 'votre pays',
//                 labelText: 'pays'
//             ),
//            ),
//               ),
//            SizedBox(height: 24,),
//              Card(
//                elevation: 7,
//                child: TextFormField(
//             textCapitalization: TextCapitalization.words,
//             decoration: InputDecoration(
//                 border: UnderlineInputBorder(),
//                 filled: true,
//                 hintText: 'Numero de telephone',
//                 labelText: 'Numero de telephone'
//             ),
//             keyboardType: TextInputType.phone,
//            ),
//              ),
//              SizedBox(height: 20,),
//              Row(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: [
//                   Container(
//                      child: IconButton(icon: Icon(Icons.security), onPressed: (){}),
//                   ),
//                   Container(
//                     height: 70,
//                     width: 200,

//                     child: Text("voila voila voila vvoila voila voila voila voila voila voila voila voila voila voila voila voila v voila vv"),
//                   ),
//                ],
//              ),
//                  Container(
//                     height: 50,

//                     child: Text("voila voila voila vvoila voila voila voila voila voila voila voila voila voila voila voila voila v voila vv"),
//                   ),
//              Container(
//      height: 50,
//      child: Center(child: Text("CREES Ma BOUTIQUE",
//      style: TextStyle(
//        color: Colors.white
//      ),
//      )),
//      color: Colors.black,
//    )
//        ],
//      ),
//    ),

//     ],
//       ),
//     ),
//   ),

//     );
//   }
// }
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nantest/Providers/Models/Categorie.dart';
import 'package:nantest/Providers/Services/Categories.dart';
import 'package:nantest/Screens/BackEnd/UploadArticle.dart';
import 'package:provider/provider.dart';

class Photo extends StatefulWidget {
  final FirebaseUser user;
  // final String result;

  const Photo({
    Key key,
    this.user,
  }) : super(key: key);
  @override
  _PhotoState createState() => _PhotoState();
}

class _PhotoState extends State<Photo> {
  bool styleCat = false;
  bool styleSousCat = false;
  bool stylePhoto = false;
  bool styleLivr = false;
  bool styleDesc = false;
  bool stylePrix = false;
  Categorie categorie;

  @override
  Widget build(BuildContext context) {
    // Scaffold.of(context).showSnackBar(SnackBar(
    //     content: Container(
    //   color: Color(0xff562fbe),
    //   child: Text('Votre Produit a été ajouté'),
    // )));

    // print('AJOUT DANS LA BOUTIQUE ');
    // print(widget.boutique.id);
    // print(widget.user);
    final providerCat = Provider.of<Categories>(context);
    final dataCategories = providerCat.items;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF562ec2)),
        backgroundColor: Colors.white,
        title: Text(
          'Ajouter un Article',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 50, bottom: 50),
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              AppBar(
                                backgroundColor: Colors.white,
                                title: Text(
                                  'Categorie',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                    itemCount: dataCategories.length,
                                    itemBuilder: (BuildContext context, index) {
                                      return Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                10,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(),
                                        child: MaterialButton(
                                          onPressed: () {
                                            setState(() {
                                              categorie = dataCategories[index];
                                              stylePhoto = true;
                                            });

                                            print(categorie.id);
                                            Navigator.pop(context);
                                          },
                                          child: Card(
                                            child: Center(
                                              child: Text(
                                                dataCategories[index].title,
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              )
                            ],
                          ),
                        ),
                      ));
                  // showAboutDialog(context: context, children: [Text('data')]);
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 8,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              // color: Colors.red,
                              borderRadius: BorderRadius.circular(30),
                              border:
                                  Border.all(color: Colors.black, width: 2)),
                          child: Center(
                              child: Text(
                            '1',
                            style: TextStyle(fontSize: 18),
                          )),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: categorie == null
                                ? MainAxisAlignment.center
                                : MainAxisAlignment.center,
                            children: [
                              Text(
                                'Categorie d\'article',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              categorie == null
                                  ? Text('')
                                  : Text('${categorie.title}')
                            ],
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: InkWell(
                onTap: stylePhoto == true
                    ? () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => UploadPhoto(
                                      categorieId: categorie.id,
                                      user: widget.user,
                                    )));
                        // showDialog(
                        //     context: context,
                        //     child: Padding(
                        //       padding: const EdgeInsets.only(
                        //           left: 8.0, right: 8.0, top: 50, bottom: 50),
                        //       child: Container(
                        //         height: MediaQuery.of(context).size.height,
                        //         width: MediaQuery.of(context).size.width,
                        //         child: Column(
                        //           children: [
                        //             AppBar(
                        //               title: Text(
                        //                 'Photo',
                        //                 style: TextStyle(
                        //                     color: Colors.black,
                        //                     fontWeight: FontWeight.bold,
                        //                     fontSize: 20),
                        //               ),
                        //             ),
                        //             Expanded(
                        //               child: Scaffold(
                        //                 body: Center(
                        //                   child: sampleImage == null
                        //                       ? Text('Select une Image')
                        //                       : enableUpload(),
                        //                 ),
                        //                 floatingActionButton: FloatingActionButton(
                        //                     child: Icon(Icons.add_a_photo),
                        //                     onPressed: getImage),
                        //               ),
                        //             )
                        //           ],
                        //         ),
                        //       ),
                        //     ));
                        // showAboutDialog(context: context, children: [Text('data')]);
                      }
                    : null,
                child: Container(
                  height: MediaQuery.of(context).size.height / 8,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              // color: Colors.red,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  color: (stylePhoto == false)
                                      ? Colors.grey
                                      : Colors.black,
                                  width: 2)),
                          child: Center(
                              child: Text(
                            '3',
                            style: (stylePhoto == false)
                                ? TextStyle(fontSize: 18, color: Colors.grey)
                                : TextStyle(fontSize: 18, color: Colors.black),
                          )),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: categorie == null
                                ? MainAxisAlignment.center
                                : MainAxisAlignment.center,
                            children: [
                              Text(
                                'Photo',
                                style: (stylePhoto == false)
                                    ? TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey)
                                    : TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                              ),
                              // categorie == null
                              //     ? Text('')
                              //     : Text('${categorie.title}')
                            ],
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: (stylePhoto == false)
                              ? Colors.grey
                              : Colors.black,
                        )
                      ],
                    ),
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
