import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String image;

  const DetailPage({super.key, required this.image});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Image.asset(image),
      ),
    );
  }
}