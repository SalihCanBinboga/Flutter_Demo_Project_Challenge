import 'package:biletall_project_1/ui/screens/turkish_dictionary_screens/TurkishDictionaryScreen.dart';
import 'package:flutter/material.dart';
import 'beyaz_show_screens/BeyazShowVideosScreen.dart';
import 'question_answer_screens/QuestionAnswerCategoriesScreen.dart';


class ApplicationsScreen extends StatelessWidget {
  double height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Uygulamalar"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              InkWell(
                  onTap: () => {Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => EncyclopediaCategoriesScreen()))},
                  child: appCard("Lüzumsuz Bilgiler Ansiklopedisi", Colors.blueGrey)),
              InkWell(
                  onTap: () => {
                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => BeyazShowVideosScreen())),
                      },
                  child: appCard("Beyaz Show Videoları", Colors.amberAccent)),
              InkWell(
                  onTap: () => {
                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => TurkishDictionaryScreen())),
                      },
                  child: appCard("Türkçe İngilizce Sözlük", Colors.blueAccent)),
            ],
          ),
        ),
      ),
    );
  }

  Widget appCard(String title, Color _color) {
    return Container(
      height: height * .18,
      width: width * .9,
      padding: EdgeInsets.all(8),
      child: Material(
        elevation: 4,
        color: _color,
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );
  }
}
