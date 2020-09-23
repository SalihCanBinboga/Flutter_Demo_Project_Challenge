import 'package:biletall_project_1/data/remote/models/QuestionAnswerModel.dart';
import 'package:flutter/material.dart';

class QuestionAnswerDetailsScreen extends StatelessWidget {
  final List<QuestionAnswerModel> modelList;
  final String selectedCategoryName;

  const QuestionAnswerDetailsScreen({this.modelList, this.selectedCategoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedCategoryName),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return questionAnswerWidget(index);
        },
        itemCount: modelList.length,
      ),
    );
  }

  Widget questionAnswerWidget(int _index) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        margin: EdgeInsets.all(4),
        child: Material(
          elevation: 4,
          child: ListTile(
              title: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: "Soru: ", style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 15)),
                    TextSpan(
                        text: modelList[_index].dcSoru,
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: "Cevap: ", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold)),
                      TextSpan(text: modelList[_index].dcCevap, style: TextStyle(color: Colors.black45)),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
