import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:praktikum/contacts.dart';
import 'package:praktikum/widget/button.dart';
import 'package:praktikum/widget/header.dart';
import 'package:praktikum/widget/textfield.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        centerTitle: true,
      ),
      body: const Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({
    super.key,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numController = TextEditingController();
  final List<Contacts> contact = [];

  void addValue() {
    final name = nameController.text;
    final number = numController.text;

    if (name.isNotEmpty || number.isNotEmpty) {
      setState(() {
        contact.add(Contacts(name, number));
        nameController.clear();
        numController.clear();
      });
    }
  }

  DateTime selectedDate = DateTime.now();
  final currentDate = DateTime.now();
  Color selectedColor = Colors.redAccent;

  String pickedFileName = '';

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);

    setState(() {
      pickedFileName = file.name;
    });
  }

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final file = result.files.first;
    _openFile(file);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      Column(
        children: [
          const Header(),
          TextFieldWidget(
            textController: nameController,
            textLabel: 'Name',
            textHint: 'Insert Your Name',
          ),
          const SizedBox(
            height: 16,
          ),
          TextFieldWidget(
            textController: numController,
            textLabel: 'Nomor',
            textHint: '+62',
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Date'),
                    TextButton(
                      onPressed: () async {
                        final selectDate = await showDatePicker(
                            context: context,
                            initialDate: currentDate,
                            firstDate: DateTime(currentDate.year - 3),
                            lastDate: DateTime(currentDate.year + 3));
                        setState(() {
                          if (selectDate != null) {
                            selectedDate = selectDate;
                          }
                        });
                      },
                      child: const Text('Select'),
                    )
                  ],
                ),
                Text(DateFormat('dd-MM-yyyy').format(selectedDate)),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Color'),
                    TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Pick Your Color'),
                                content: SingleChildScrollView(
                                  child: ColorPicker(
                                    pickerColor: selectedColor,
                                    onColorChanged: (Color color) {
                                      setState(() {
                                        selectedColor = color;
                                      });
                                    },
                                    pickerAreaHeightPercent: 0.8,
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('save'),
                                  ),
                                ],
                              );
                            });
                      },
                      child: const Text('Pick Color'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  color: selectedColor,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Pick Files'),
                    TextButton(
                      onPressed: () {
                        _pickFile();
                      },
                      child: const Text('Pick and Open File'),
                    ),
                  ],
                ),
                ButtonWidget(
                    titleText: 'Submit',
                    onPressed: () {
                      print('Name: ${nameController.text}');
                      print('Number: ${numController.text}');
                      print(
                          'Date: ${DateFormat('dd-MM-yyyy').format(selectedDate)}');
                      print('Color: $selectedColor');
                      print('Picked File: $pickedFileName');
                    })
              ],
            ),
          ),
        ],
      ),
    ]));
  }
}
