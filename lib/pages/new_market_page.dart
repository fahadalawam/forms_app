import 'package:flutter/material.dart';

import '../api/database.dart';

class NewMarketPage extends StatefulWidget {
  const NewMarketPage({super.key});

  @override
  State<NewMarketPage> createState() => _NewMarketPageState();
}
//Form
//Form validation
//Form onSave
//Http
//Post

class _NewMarketPageState extends State<NewMarketPage> {
  double sliderVal = 1;

  void send() {
    DataBase().post('name', 'number');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('اضف متجر جديد'),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                Text('اضافة متجر جديد'),
                SizedBox(height: 50),
                TextFormField(
                  decoration: InputDecoration(
                    label: Text('اسم المتجر'),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  decoration: InputDecoration(
                    label: Text('رقم الهاتف'),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: send,
                  child: Text('ارسال'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
