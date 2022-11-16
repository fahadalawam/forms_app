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

    await http.post(url, body: _json);
  }

  // GET from DB
  Future<List<Market>> fetch() async {
    //TODO: change url to your firebase project url.
    Uri url = Uri.parse('https://first-app-5b37b-default-rtdb.firebaseio.com/markets.json');
    final res = await http.get(url);

    //if nothing is found return an empty List.
    if (res.body == 'null') return [];

    final _json = json.decode(res.body) as Map<String, dynamic>;

    List<Market> markes = [];
    _json.forEach((key, value) {
      markes.add(Market(
        id: key,
        name: value['name'],
        phoneNumber: value['number'],
      ));
    });
    return markes;
  }

  //DELETE
  void delete(String id) async {
    Uri url = Uri.parse('https://first-app-5b37b-default-rtdb.firebaseio.com/markets/$id.json');
    await http.delete(url);
  }
}
