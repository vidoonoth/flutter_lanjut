import 'package:flutter/material.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({super.key});
  @override
  ScorePageState createState() => ScorePageState();
}

class ScorePageState extends State<ScorePage> {
  int scoreA = 0;
  int scoreB = 0;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final String teamA = args['teamA'];
    final String teamB = args['teamB'];

    return Scaffold(
      backgroundColor: Color(0xFF090852),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTeamSection(
            teamA,
            scoreA,
            () {
              setState(() {
                if (scoreA > 0) scoreA--;
              });
            },
            () {
              setState(() {
                scoreA++;
              });
            },
          ),
          Divider(color: Colors.white),
          _buildTeamSection(
            teamB,
            scoreB,
            () {
              setState(() {
                if (scoreB > 0) scoreB--;
              });
            },
            () {
              setState(() {
                scoreB++;
              });
            },
          ),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/result',
                arguments: {
                  'teamA': teamA,
                  'teamB': teamB,
                  'scoreA': scoreA,
                  'scoreB': scoreB,
                },
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(
                255,
                255,
                255,
                255,
              ), // Greenish color like the UEFA logo
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              elevation: 10,
            ),
            child: Text(
              "Hasil",
              style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamSection(
    String name,
    int score,
    VoidCallback onDecrement,
    VoidCallback onIncrement,
  ) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Color.fromARGB(
              255,
              255,
              255,
              255,
            ), // Matching greenish color for teams
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            name,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          '$score',
          style: TextStyle(
            fontSize: 60,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildScoreButton('-', onDecrement),
            SizedBox(width: 15),
            _buildScoreButton('+', onIncrement),
          ],
        ),
      ],
    );
  }

  Widget _buildScoreButton(String label, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        elevation: 5,
      ),
      child: Text(
        label,
        style: TextStyle(
          color: const Color.fromARGB(255, 0, 0, 0),
          fontSize: 24,
        ),
      ),
    );
  }
}
