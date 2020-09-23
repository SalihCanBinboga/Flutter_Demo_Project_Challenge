import 'dart:convert';
import 'package:biletall_project_1/data/remote/models/QuestionAnswerModel.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'QuestionAnswerDetailsScreen.dart';

class EncyclopediaCategoriesScreen extends StatefulWidget {
  @override
  _EncyclopediaCategoriesScreenState createState() => _EncyclopediaCategoriesScreenState();
}

class _EncyclopediaCategoriesScreenState extends State<EncyclopediaCategoriesScreen> {
  List<QuestionAnswerModel> allModelList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ansiklopedi Kategorileri"),
      ),
      body: FutureBuilder(
        future: getCategories(),
        builder: (BuildContext context, AsyncSnapshot<List<String>> snap) {
          if (snap.hasData) {
            return ListView.builder(
              itemBuilder: (ctx, index) {
                return ListTile(
                  title: Text(
                    snap.data[index],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  onTap: () => {openQADetailPage(snap.data[index])},
                );
              },
              itemCount: snap.data.length,
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    allModelList = null;
    super.dispose();
  }

  Future<List<String>> getCategories() async {
    var response = await http.get("https://www.netdata.com/JSON/21FC2BE0");
    if (response.statusCode == 200) {
      allModelList = (json.decode(response.body) as List).map((singleQA) => QuestionAnswerModel.fromJson(singleQA)).toList();

      return await parseCategories(allModelList);
    } else {
      throw Exception("Api bağlantı sırasında problem oluştur ${response.statusCode}");
    }
  }

  Future<List<String>> parseCategories(List<QuestionAnswerModel> _modelList) async {
    Set<String> categories = Set();
    _modelList.forEach((qAModel) {
      categories.add(qAModel.dcKategori);
    });
    return categories.toList();
  }

  openQADetailPage(String categoryName) {
    List<QuestionAnswerModel> onlyCategoryList = List();

    allModelList.forEach((qaModel) {
      if (qaModel.dcKategori.toLowerCase() == categoryName.toLowerCase()) {
        onlyCategoryList.add(qaModel);
      }
    });

    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext ctx) => QuestionAnswerDetailsScreen(
              modelList: onlyCategoryList,
              selectedCategoryName: categoryName,
            )));
  }
}
