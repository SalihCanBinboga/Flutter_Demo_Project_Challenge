import 'package:biletall_project_1/ui/screens/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff26a69a),
        accentColor: Color(0xffffc107),
      ),
      title: 'Flutter Project',
      home: SplashScreen(),
    );
  }
}
