import 'dart:convert';
import 'package:biletall_project_1/data/remote/models/BeyazShowModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'YoutubeVideoScreen.dart';

class BeyazShowVideosScreen extends StatefulWidget {
  @override
  _BeyazShowVideosScreenState createState() => _BeyazShowVideosScreenState();
}

class _BeyazShowVideosScreenState extends State<BeyazShowVideosScreen> {
  double height, width;

  Future<List<BeyazShowModel>> getMovieModels() async {
    var response = await http.get("https://www.netdata.com/JSON/1d35eb7f");

    if (response.statusCode == 200) {
      return (json.decode(response.body) as List).map((singleMovieModel) => BeyazShowModel.fromJson(singleMovieModel)).toList();
    } else {
      throw Exception("Api bağlantı sırasında problem oluştur ${response.statusCode}");
    }
  }

  @override
  void dispose() {
    height = null;
    width = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Beyaz Show Videoları"),
      ),
      body: FutureBuilder(
        future: getMovieModels(),
        builder: (BuildContext ctx, AsyncSnapshot<List<BeyazShowModel>> modelList) {
          if (modelList.hasData) {
            return videosGridView(modelList);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget videosGridView(AsyncSnapshot<List<BeyazShowModel>> _modelList) {
    return GridView.builder(
        itemCount: _modelList.data.length,
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (ctx, index) {
          var model = _modelList.data[index];
          return InkWell(
            onTap: () => {Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => YoutubeVideoScreen(videoURL: model.dcLink)))},
            child: Container(margin: EdgeInsets.all(4), child: youtubeCardWidget(model)),
          );
        });
  }

  Widget youtubeCardWidget(BeyazShowModel _model) {
    return Material(
      color: Colors.amber,
      elevation: 4,
      borderRadius: BorderRadius.all(Radius.circular(4)),
      child: Column(
        children: <Widget>[
          Image(
            image: AssetImage("lib/assets/images/youtube.png"),
            width: 75,
          ),
          Text(
            _model.dcVideoBaslik,
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            maxLines: 2,
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                informationWidget(_model.dcBegeniSayisi, "lib/assets/images/like.png"),
                informationWidget(_model.dcBegenilmemeSayisi, "lib/assets/images/dislike.png"),
                informationWidget(_model.dcIzlenmeSayisi, "lib/assets/images/display_count.png")
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          videoDateInformationWidget(_model)
        ],
      ),
    );
  }

  Widget informationWidget(String _detail, String _img) {
    return Row(
      children: <Widget>[
        Image(
          image: AssetImage(_img),
          width: 16,
        ),
        SizedBox(
          width: 4,
        ),
        Text(_detail)
      ],
    );
  }

  Widget videoDateInformationWidget(BeyazShowModel _model) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage("lib/assets/images/calendar.png"),
            width: 20,
          ),
          SizedBox(
            width: 5,
          ),
          Text(dateParse(_model.dcYayinlanmaTarihi))
        ],
      ),
    );
  }
}

String dateParse(String _dcYayinlanmaTarihi) {
  var date = _dcYayinlanmaTarihi;
  List<String> monthNameList =
      List.unmodifiable({"Ocak", "Şubat", "Mart", "Nisan", "Mayıs", "Haziran", "Temmuz", "Ağustos", "Eylül", "Ekim", "Kasım", "Aralık"});

  date = date.split(" ")[0];
  String day = date.split(".")[0];
  int month = int.parse(date.split(".")[1]);
  String year = date.split(".")[2];

  date = "$day ${monthNameList[month - 1]} $year";
  return date;
}
