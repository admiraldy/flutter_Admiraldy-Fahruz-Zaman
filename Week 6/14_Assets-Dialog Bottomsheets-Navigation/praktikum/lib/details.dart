import 'package:flutter/material.dart';
import 'package:praktikum/model.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Album album = ModalRoute.of(context)?.settings.arguments as Album;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    album.image,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  album.title,
                  style: const TextStyle(
                    fontFamily: 'Futura',
                    fontSize: 28,
                  ),
                ),
                Text(
                  album.artist,
                  style: const TextStyle(
                    fontSize: 20
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: const Text('Return')
            )
          ],
        ),
      ),
    );
  }
}
