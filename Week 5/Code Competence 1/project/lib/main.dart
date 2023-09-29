import 'package:flutter/material.dart';
import 'package:project/Widget/Contact.dart';
import 'package:project/Widget/header.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.black,
          flexibleSpace: FlexibleSpaceBar(
            title: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
            ),
            centerTitle: true,
            expandedTitleScale: 1,
            titlePadding: const EdgeInsets.only(top: 27, bottom: 15),
          ),
          elevation: 0,
        ),
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TitleWidget(),
              const SizedBox(height:20,),
              ContactUsWidget()
            ],
          ),
        ),
      )
    );
  }
}
