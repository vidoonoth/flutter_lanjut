import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final String teamA = args['teamA'];
    final String teamB = args['teamB'];
    final int scoreA = args['scoreA'];
    final int scoreB = args['scoreB'];

    String winnerText;
    if (scoreA > scoreB) {
      winnerText = '$teamA Menang!';
    } else if (scoreB > scoreA) {
      winnerText = '$teamB Menang!';
    } else if (scoreA == scoreB) {
      winnerText = 'Seri!';
    } else {
      winnerText ='error';
    }

    return Scaffold(
      backgroundColor: Color(0xFF090852),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: Color.fromARGB(
                  255,
                  255,
                  255,
                  255,
                ), 
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                (scoreA == scoreB)
                    ? 'Hasil'
                    : (scoreA > scoreB ? teamA : teamB),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              winnerText,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,                
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed:
                  () => Navigator.popUntil(context, ModalRoute.withName('/')),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(
                  255,
                  249,
                  249,
                  249,
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                elevation: 10,
              ),
              child: Text(
                'Main Lagi',
                style: TextStyle(
                  color: const Color.fromARGB(255, 7, 7, 7),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
