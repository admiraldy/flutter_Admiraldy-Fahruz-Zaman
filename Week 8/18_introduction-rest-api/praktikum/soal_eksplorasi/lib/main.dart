import 'package:flutter/material.dart';
import 'package:soal_eksplorasi/dice_bear.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Image Generator'),
        ),
        body: const Body(),
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController controller = TextEditingController();
  String imageUrl = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        imageUrl.isNotEmpty ? Image.network(imageUrl) : const Text('No image'),
        TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Enter seed',
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              generateImage();
            });
          },
          child: const Text('Generate'),
        ),
      ],
    );
  }

  void generateImage() async {
    final text = controller.text.trim();

    if (text.isNotEmpty) {
      try {
        final data = await DiceBearAPI.getImageData(text);
        setState(() {
          imageUrl = data.avatar;
        });
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Error'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            });
      }
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
