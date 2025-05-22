import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final int counter;

  const ResultPage({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tampil angka')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Nilai terakhir adalah', style: TextStyle(fontSize: 20)),
            Text('$counter', style: const TextStyle(fontSize: 28)),
          ],
        ),
      ),
    );
  }
}
