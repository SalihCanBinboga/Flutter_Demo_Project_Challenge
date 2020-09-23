import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideoScreen extends StatefulWidget {
  final String videoURL;

  const YoutubeVideoScreen({this.videoURL});

  @override
  _YoutubeVideoScreenState createState() => _YoutubeVideoScreenState();
}

class _YoutubeVideoScreenState extends State<YoutubeVideoScreen> {
  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: YoutubePlayerController(
          initialVideoId: YoutubePlayer.convertUrlToId(widget.videoURL),
        ),
        onReady: () {
          print("Player Hazır");
        },
      ),
      builder: (context, player) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            player,
          ],
        );
      },
    );
  }
}
