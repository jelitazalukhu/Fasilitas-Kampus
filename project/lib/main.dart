import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Function & State')),
        body: const LuasSegitigaPage(),
      ),
    );
  }
}

class LuasSegitigaPage extends StatefulWidget {
  const LuasSegitigaPage({super.key});

  @override
  State<LuasSegitigaPage> createState() => _LuasSegitigaPageState();
}

class _LuasSegitigaPageState extends State<LuasSegitigaPage> {
  final alasCtrl = TextEditingController();
  final tinggiCtrl = TextEditingController();
  double hasil = 0;

  double hitungLuas(double alas, double tinggi) {
    return 0.5 * alas * tinggi;
  }

  String formatAngka(double angka) {
    return angka.toStringAsFixed(2);
  }

  String? validasi(String? value) {
    if (value == null || value.isEmpty) return 'Wajib diisi';
    if (double.tryParse(value) == null) return 'Angka saja';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: alasCtrl,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Alas (cm)',
              border: OutlineInputBorder(),
            ),
            validator: validasi,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: tinggiCtrl,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Tinggi (cm)',
              border: OutlineInputBorder(),
            ),
            validator: validasi,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (validasi(alasCtrl.text) == null &&
                  validasi(tinggiCtrl.text) == null) {
                final luas = hitungLuas(
                  double.parse(alasCtrl.text),
                  double.parse(tinggiCtrl.text),
                );
                setState(() => hasil = luas);
              }
            },
            child: const Text('Hitung Luas'),
          ),
          const SizedBox(height: 20),
          Text(
            'Luas segitiga = ${formatAngka(hasil)} cm²',
            style: const TextStyle(fontSize: 22),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    alasCtrl.dispose();
    tinggiCtrl.dispose();
    super.dispose();
  }
}