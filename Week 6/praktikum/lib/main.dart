import 'package:flutter/material.dart';
import 'package:praktikum/page/contact_page.dart';
import 'package:praktikum/page/gallery_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(),
      ),
      // home: const GalleryPage(),
      initialRoute: '/',
      routes: {
        '/' : (context) => const ContactPage(),
        '/gallery': (context) => const GalleryPage(),
      },
    );
  }
}