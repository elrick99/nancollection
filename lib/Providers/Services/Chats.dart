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
}
