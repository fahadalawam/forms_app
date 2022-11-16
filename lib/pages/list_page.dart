import 'package:flutter/material.dart';
import 'package:forms_app/api/database.dart';

import '../models/market.dart';
import '../pages/new_market_page.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Market> markets = [];

  @override
  void initState() {
    super.initState();

    DataBase().fetch().then((value) {
      setState(() {
        markets = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: markets.isEmpty
          ? Center(
              child: Text('لم يتم اضافة اي متجر بعد'),
            )
          : ListView.builder(
              itemCount: markets.length,
              itemBuilder: ((context, i) {
                return ListTile(
                  title: Text(markets[i].name),
                  subtitle: Text(markets[i].phoneNumber),
                  trailing: IconButton(
                    onPressed: () {
                      DataBase().delete(markets[i].id!);
                    },
                    icon: Icon(Icons.delete),
                  ),
                );
              }),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return NewMarketPage();
              },
            ),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
