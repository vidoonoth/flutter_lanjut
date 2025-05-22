import 'package:flutter/material.dart';
import 'input_page.dart';
import 'score_page.dart';
import 'result_page.dart';

void main() {
  runApp(SoccerScoreApp());
}

class SoccerScoreApp extends StatelessWidget {
  const SoccerScoreApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skor Tim Sepakbola',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/score': (context) => ScorePage(),
        '/result': (context) => ResultPage(),
      },
      theme: ThemeData(
        fontFamily: 'Arial',
        scaffoldBackgroundColor: Colors.teal[700],
      ),
    );
  }
}