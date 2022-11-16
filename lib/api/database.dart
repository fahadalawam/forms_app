import 'package:http/http.dart' as http;

import 'dart:convert';
import '../models/market.dart';

class DataBase {
  //POST to DB
  void post(name, number) async {
    //TODO: change url to your firebase project url.
    Uri url = Uri.parse('https://first-app-5b37b-default-rtdb.firebaseio.com/markets.json');

    final _json = json.encode({
      "name": name,
      "number": number,
    });

    final res = await http.post(url, body: _json);
    print('POST');
    print(res.body);
  }

  // GET from DB
  Future<List<Market>> fetch() async {
    //TODO: change url to your firebase project url.
    Uri url = Uri.parse('https://first-app-5b37b-default-rtdb.firebaseio.com/markets.json');
    final res = await http.get(url);

    List<Market> markes = [];

    //TODO: add fetchd data to the markets list.

    return markes;
  }

  //DELETE
  void delete(String id) async {
    //delete by id.
  }
}
