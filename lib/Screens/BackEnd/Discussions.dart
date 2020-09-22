import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_5.dart';

import 'package:nantest/Providers/Services/Articles.dart';
import 'package:nantest/Providers/Models/Article.dart';
import 'package:nantest/Providers/Services/Chats.dart';
import 'package:provider/provider.dart';

class DiscuAdmin extends StatefulWidget {
  final FirebaseUser user;
  final Article product;

  const DiscuAdmin({Key key, this.user, this.product}) : super(key: key);
  @override
  _DiscuAdminState createState() => _DiscuAdminState();
}

class _DiscuAdminState extends State<DiscuAdmin> {
  String _discu;
  Article article;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final providerchat = Provider.of<Chats>(context, listen: false);
    providerchat.getChat(id: widget.product.code);
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.product.code);
    final providerchat = Provider.of<Chats>(context);
    final datachat = providerchat.items;

    print('//////////CHAT/////////');
    print(datachat.length);
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color(0xFF562ec2)),
          backgroundColor: Colors.white,
          title: Text(
            widget.product.title,
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            // IconButton(icon: Icon(Icons.call), onPressed: () {}),
            // IconButton(icon: Icon(Icons.videocam), onPressed: () {}),
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
          ],
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: ListView.builder(
                  itemCount: datachat.length,
                  itemBuilder: (context, index) {
                    // return Text('data');
                    // print("qfsdsfsdfsdfsd");
                    // print(datachat[index].collectionneur);
                    // if (datachat[index].collectionneur.toString() == '1') {
                    //   return getSenderView(
                    //       ChatBubbleClipper5(type: BubbleType.sendBubble),
                    //       context);
                    // } else {
                    //   getReceiverView(
                    //       ChatBubbleClipper5(type: BubbleType.receiverBubble),
                    //       context);
                    // }
                    return datachat[index].collectionneur.toString() == '1'
                        ? getSenderView(
                            ChatBubbleClipper5(type: BubbleType.sendBubble),
                            context,
                            text: datachat[index].message,
                            heure: datachat[index]
                                .dateTime
                                .split(' ')[1]
                                .split('.')[0])
                        : getReceiverView(
                            ChatBubbleClipper5(type: BubbleType.receiverBubble),
                            context,
                            text: datachat[index].message,
                            heure: datachat[index]
                                .dateTime
                                .split(' ')[1]
                                .split('.')[0]);
                  }),
            )),
            Container(
              // color: Colors.grey,
              height: 80,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      child: TextFormField(
                        onChanged: (String valuePrice) {
                          setState(() {
                            _discu = valuePrice;
                          });
                        },
                        onSaved: (newValue) {
                          _discu = newValue;
                        },
                        autofocus: false,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Tapez message",
                          prefixIcon: Icon(
                            Icons.mood,
                            color: Color(0xFF562ec2),
                          ),
                        ),
                      )),
                  SizedBox(width: 10),
                  CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        onPressed: () {
                          var now = DateTime.now().toString();

                          providerchat.postChat(
                              id: widget.product.code,
                              message: _discu,
                              now: now);
                        },
                        icon: Icon(
                          Icons.send,
                          color: Color(0xFF562ec2),
                        ),
                      ))
                ],
              ),
            )
          ],
        ));
  }

  getSenderView(CustomClipper clipper, BuildContext context,
          {String text, heure}) =>
      ChatBubble(
        clipper: clipper,
        alignment: Alignment.topRight,
        margin: EdgeInsets.only(top: 20),
        backGroundColor: Color(0xFF562ec2),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    heure,
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ],
              )
            ],
          ),
        ),
      );

  getReceiverView(CustomClipper clipper, BuildContext context,
          {String text, heure}) =>
      ChatBubble(
        clipper: clipper,
        backGroundColor: Color(0xffE7E7ED),
        margin: EdgeInsets.only(top: 20),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    heure,
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),
                ],
              )
            ],
          ),
        ),
      );
}
