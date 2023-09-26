import 'package:flutter/material.dart';
import 'package:praktikum/model.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Album'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
        ),
        itemCount: albumData.length,
        itemBuilder: (context, index) {
          final album = albumData[index];
          return GestureDetector(
            onTap: () {
              _bottomSheet(context, index);
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(7),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      album.image,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _bottomSheet(BuildContext context, int index) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context){
          final album = albumData[index];
          return Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    album.image,
                    fit: BoxFit.cover,
                    height: 300,
                    ),
                  ),
                const SizedBox(height: 10,),
                Text(
                  album.title,
                  style: const TextStyle(
                    fontFamily: 'Futura',
                    fontSize: 28
                  ),
                  ),
                const SizedBox(height: 10,),
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                      _dialog(context, index);
                    },
                    child: const Text('show details'),
                    ),
                ),
              ],
            ),
          );
        }
      );
  }
}

void _dialog (BuildContext context, int index) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      final album = albumData[index];
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                album.image,
                height: 200,
                fit: BoxFit.cover
              ),
            ),
            const SizedBox(height: 15,),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/details', arguments: album);
            },
            child: const Text('Yes'),
          )
        ],
      );
    }
  );
}