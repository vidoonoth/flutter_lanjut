import 'package:flutter/material.dart';
import 'pages/patungan.dart';

void main() => runApp(const PatunganApp());

class PatunganApp extends StatelessWidget {
  const PatunganApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Patungan',
      debugShowCheckedModeBanner: false,
      home: const PatunganPage(),
    );
  }
}
