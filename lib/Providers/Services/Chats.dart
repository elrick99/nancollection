import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:nantest/Providers/Models/Chat.dart';

class Chats with ChangeNotifier {
  List<Chat> _items = [];

  List<Chat> get items => [..._items];

  /**
 * POST SUR FIREBASE
 */
  Future<void> postChat({String message, now, id}) async {
    final String url = "https://appsecom-839d9.firebaseio.com/chat/$id.json";
    final Map<String, dynamic> data = {
      "message": message,
      "dateTime": now,
      "employe": '0',
      "collectionneur": '1',
    };
    print(data);

    try {
      var response = await http.post(url, body: json.encode(data));
      print('///////////RESPONSE///////////');
      print(response.body);
      var newUser = Chat(
          code: json.decode(response.body)['nom'],
          message: message,
          dateTime: now,
          employe: '1',
          collectionneur: '0');
      _items.insert(0, newUser);
      print(_items.length);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getChat({String id}) async {
    final String url = "https://appsecom-839d9.firebaseio.com/chat/$id.json";
    try {
      var response = await http.get(url);
      // print(response.body);
      if (response.statusCode == 200) {
        _items = [];
        // print('////////// Insérer dans le provider /////////');
        Map<String, dynamic> data = json.decode(response.body);
        Map<String, dynamic> produits = {};
        List<String> keys = [];
        data.forEach((key1, value) {
          produits.addAll(value);
          keys.add(key1);
          // print(key1);
        });
        // print(keys);
        int i = 0;
        data.forEach((key, value) {
          i++;
          int a = i - 1;

          // print(a);
          _items.add(Chat(
            id: a,
            code: keys[a],
            collectionneur: value['collectionneur'].toString(),
            employe: value['employe'].toString(),
            dateTime: value['dateTime'].toString(),
            message: value['message'],
          ));
          // print(value['admin']);
        });
        // print('////////// Fin Insertion dans le provider /////////');
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }
}
