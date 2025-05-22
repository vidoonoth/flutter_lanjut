import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';

class PatunganPage extends StatefulWidget {
  const PatunganPage({super.key});
  @override
  PatunganPageState createState() => PatunganPageState();
}

class PatunganPageState extends State<PatunganPage> {
  final _totalController = TextEditingController();
  final _orangController = TextEditingController();
  String _hasil = '';

  void _hitungPatungan() {
    final totalInput =
        _totalController.text.replaceAll(',', '').replaceAll('.', '');
    final total = double.tryParse(totalInput) ?? 0;
    final orang = int.tryParse(_orangController.text) ?? 1;

    if (total <= 0 || orang <= 0) {
      setState(() {
        _hasil = 'Masukkan data yang valid!';
      });
      return;
    }

    final hasilPerOrang = total / orang;
    final dibulatkan = (hasilPerOrang / 100).ceil() * 100;

    setState(() {
      _hasil = 'Setiap orang bayar: Rp ${dibulatkan.toStringAsFixed(0)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        title: const Text(
          'PEMBAGI PATUNGAN',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 22,
            fontFamily: 'Courier',
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.yellow,
        elevation: 5,
        shadowColor: Colors.black,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            CustomTextField(
              controller: _totalController,
              label: 'TOTAL PEMBAYARAN (Rp)',
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: _orangController,
              label: 'JUMLAH ORANG',
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _hitungPatungan,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black, width: 3),
                    borderRadius: BorderRadius.zero,
                  ),
                  elevation: 6,
                ),
                child: const Text(
                  'HITUNG',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Courier',
                    color: Colors.yellow,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              _hasil,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Courier',
                color: Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
