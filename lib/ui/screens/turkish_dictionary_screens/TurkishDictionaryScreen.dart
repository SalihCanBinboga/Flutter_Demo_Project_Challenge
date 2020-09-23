import 'dart:convert';

import 'package:biletall_project_1/data/remote/models/DictionaryModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TurkishDictionaryScreen extends StatefulWidget {
  @override
  _TurkishDictionaryScreenState createState() => _TurkishDictionaryScreenState();
}

class _TurkishDictionaryScreenState extends State<TurkishDictionaryScreen> {
  TextEditingController _tvSearchController;

  @override
  void initState() {
    _tvSearchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _tvSearchController.dispose();
    super.dispose();
  }

  void getTextTranslate(String _searchText) async {
    var response = await http.get("https://www.netdata.com/JSON/d495b07c?\$where=dc_Turkce=$_searchText");

    if (response.statusCode == 200) {
      Map<String, dynamic> exceptionControl = (json.decode(response.body) as List).first;

      if (exceptionControl.containsKey("Exception")) {
        startTranslateDialog(exceptionControl["Exception"]);
      } else {
        startTranslateDialog(DictionaryModel.fromJson((json.decode(response.body) as List).first).dcIngilizce);
      }
    } else {
      startTranslateDialog("Api bağlantı sırasında problem oluştur ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Türkçe İngilizce Sözlük"),
      ),
      body: Theme(
        data: Theme.of(context).copyWith(primaryColor: Colors.amber),
        child: Container(
          margin: EdgeInsets.only(top: 16),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(16),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Türkçe Kelime Yazın",
                    hintStyle: TextStyle(fontStyle: FontStyle.italic, letterSpacing: 3, fontSize: 15),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                  ),
                  controller: _tvSearchController,
                ),
              ),
              RaisedButton(
                onPressed: () {
                  getTextTranslate(_tvSearchController.value.text.toLowerCase());
                },
                color: Colors.blueGrey,
                elevation: 4,
                child: Text(
                  "İngilizce Çevir",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void startTranslateDialog(String _response) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "İngilizce Karşılığı",
              textAlign: TextAlign.center,
            ),
            titleTextStyle: TextStyle(color: Colors.white70, fontSize: 20, fontWeight: FontWeight.bold),
            elevation: 6,
            backgroundColor: Colors.teal.shade200,
            content: Text(_response),
            contentTextStyle: TextStyle(color: Colors.white, fontSize: 18, letterSpacing: 2, fontStyle: FontStyle.italic),
          );
        });
  }
}
