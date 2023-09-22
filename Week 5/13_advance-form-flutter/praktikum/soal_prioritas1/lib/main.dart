import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Fix the constructor signature
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key); // Fix the constructor signature

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime selectedDate = DateTime.now();
  final currentDate = DateTime.now();
  Color selectedColor = Colors.redAccent;

  void _openFile(PlatformFile file){
    OpenFile.open(file.path);
  }

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final file = result.files.first;
    _openFile(file);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interactive Widgets'),
        centerTitle: true,
      ),
      body: Padding(
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
            const SizedBox(height: 15,),
            const Text('Color'),
            const SizedBox(height: 10,),
            Container(
              height: 100,
              width: double.infinity,
              color: selectedColor,
            ),
            const SizedBox(height: 10,),
            Center(
              child: ElevatedButton(
                onPressed: (){
                  showDialog(
                    context: context,
                    builder: (context){
                      return AlertDialog(
                        title: const Text('Pick Your Color'),
                        content: SingleChildScrollView(
                          child: ColorPicker(
                            pickerColor: selectedColor,
                            onColorChanged: (Color color){
                              setState(() {
                                selectedColor = color;
                              });
                            },
                            pickerAreaHeightPercent: 0.8,
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                            child: const Text('save'),
                          ),
                        ],
                      );
                    }
                  );
                },
                child: const Text('Pick Color'),
              ),
            ),
            const SizedBox(height: 15,),
            const Text('Pick Files'),
            const SizedBox(height: 10,),
            Center(
              child: ElevatedButton(
                onPressed: (){
                  _pickFile();
                },
                child: const Text('Pick and Open File'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
