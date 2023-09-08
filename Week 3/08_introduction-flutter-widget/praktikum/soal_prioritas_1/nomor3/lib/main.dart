import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        title: const Text('Halo Alterra',),
      ),
      body: const Center(
        child: Text('Nama Saya adalah Admiraldy Fahruz Zaman', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400,),),
      ),
    );
  }
}
