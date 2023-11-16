import 'package:flutter/material.dart';
import 'package:soal_prioritas_1/nomor1.dart';
import 'package:soal_prioritas_1/nomor2.dart';
import 'package:soal_prioritas_1/nomor3.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                sendContact();
              },
              child: const Text('1. send contact')),
          ElevatedButton(
              onPressed: () {
                fetchContact();
              },
              child: const Text('2. fetch contact')),
          ElevatedButton(
              onPressed: () {
                updateContac();
              },
              child: const Text('3. update contact'))
        ],
      )),
    );
  }
}
