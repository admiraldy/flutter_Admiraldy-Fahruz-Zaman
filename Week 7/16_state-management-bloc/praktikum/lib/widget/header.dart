import 'package:flutter/material.dart';
import 'package:praktikum/style.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 35, left: 35, right: 35, bottom: 10),
      child: Column(
      children: [
        const Icon(Icons.mobile_friendly,),
        const SizedBox(height: 16,),
        Text('Create New Contact', style: TextAppStyle().m3headlinesmall),
        const SizedBox(height: 16,),
        Text(
          'A dialog is a type of Modal window that appears in front of app content to provide critical information, or prompt for a decision to be',
          style: TextAppStyle().m3bodymedium
          ),
          const SizedBox(height: 15,),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          )
      ],
    ),
    );
  }
}

