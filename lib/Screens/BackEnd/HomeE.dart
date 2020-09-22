import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeAdmin extends StatefulWidget {
  final FirebaseUser user;
  HomeAdmin({
    Key key,
    this.user,
  }) : super(key: key);

  @override
  _HomeAdminState createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  // FirebaseAuth user;
  double _progress = 20;
  get downloadProgress => _progress;
  @override
  Widget build(BuildContext context) {
    // print('rrrrrrrrrrrrrrrrrrrr');
    // print(widget.boutique.description);
    // final providerB = Provider.of<Boutiques>(context);
    // print(providerB.item);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Hello, ${widget.user.displayName}',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              child: CircleAvatar(
                backgroundColor: Colors.blue,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          // decoration: BoxDecoration(color: Colors.red),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width,
                  // decoration: BoxDecoration(color: Colors.amber),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text('Statistiques',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ),
                      Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFF562ec2),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                            right: 0,
                                            child: Icon(Icons.trending_up,
                                                color: Colors.green)),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '97,7 %',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    '20,325',
                                                    style: TextStyle(
                                                        color: Colors.grey),
                                                  )
                                                ],
                                              ),
                                            ),
                                            // Container(
                                            //     child:
                                            //         new LinearPercentIndicator(
                                            //   percent: 0.5,
                                            //   progressColor: Colors.red,
                                            // )),
                                            Container(
                                              child: Text(
                                                'Transaction \n success',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFF562ec2),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                            right: 0,
                                            child: Icon(Icons.trending_down,
                                                color: Colors.red)),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '90 %',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    '20,325',
                                                    style: TextStyle(
                                                        color: Colors.grey),
                                                  )
                                                ],
                                              ),
                                            ),
                                            // Container(
                                            //     child:
                                            //         new LinearPercentIndicator(
                                            //   percent: 0.2,
                                            //   progressColor: Colors.red,
                                            // )),
                                            Container(
                                              child: Text(
                                                'Transaction \n échoué',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFF562ec2),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                            right: 0,
                                            child: Icon(Icons.trending_up,
                                                color: Colors.green)),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '97,7 %',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    '20,325',
                                                    style: TextStyle(
                                                        color: Colors.grey),
                                                  )
                                                ],
                                              ),
                                            ),
                                            // Container(
                                            //     child:
                                            //         new LinearPercentIndicator(
                                            //   percent: 0.7,
                                            //   progressColor: Colors.red,
                                            // )),
                                            Container(
                                                child: Text(
                                              'Transaction \n en attente',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: Colors.grey[300]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            // decoration: BoxDecoration(color: Colors.amber),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Eanings',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Total balance',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 18)),
                                      Text('\$ 800000000',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18))
                                    ],
                                  ),
                                ),
                                Card(
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height / 7,
                                    width: MediaQuery.of(context).size.width,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Eaning in March',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Color(0xFF562ec2)),
                                          ),
                                          Expanded(
                                              child: Container(
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('\$ 80000000',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20)),
                                                Icon(
                                                  Icons.trending_up,
                                                  size: 40,
                                                )
                                              ],
                                            ),
                                          ))
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )),
                      Expanded(
                          child: Container(
                        width: MediaQuery.of(context).size.width,
                        // decoration: BoxDecoration(color: Colors.green),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Historique',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 12,
                              width: MediaQuery.of(context).size.width,
                              // decoration: BoxDecoration(color: Colors.amber),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text('Last Payment',
                                          style: TextStyle(
                                              color: Color(0xFF562fbe),
                                              fontWeight: FontWeight.bold)),
                                      Text('Friday, 21 March',
                                          style: TextStyle(color: Colors.grey))
                                    ],
                                  )),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '\$20,00',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      )
                                    ],
                                  )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              )),
              Container(
                height: 70,
              )
            ],
          ),
        ),
      ),
    );
  }
}
