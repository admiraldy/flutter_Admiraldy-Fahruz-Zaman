import 'package:flutter/material.dart';
import 'package:praktikum/contacts.dart';
import 'package:praktikum/style.dart';
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
      theme: ThemeData(
        colorScheme: const ColorScheme.light()
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
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
      ),
      body: const Body()
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key,});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numController = TextEditingController();
  final List<Contacts> contact = [];

  void addValue(){
    final name = nameController.text;
    final number = numController.text;
    if(name.isNotEmpty || number.isNotEmpty){
      setState(() {
        contact.add(
          Contacts(name, number)
        );
        nameController.clear();
        numController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              const Header(),
              TextFieldWidget(
                textController: nameController,
                textLabel: 'Name',
                textHint: 'Insert Your Name',
              ),
              const SizedBox(height: 16,),
              TextFieldWidget(
                textController: numController,
                textLabel: 'Nomor',
                textHint: '+62',
              ),
              const SizedBox(height: 15,),
              ButtonWidget(
                titleText: 'Submit',
                onPressed: addValue,
              )
            ],
          ),
          Text('List Contacts', style: TextAppStyle().m3headlinesmall,),
          SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  itemExtent: 55,
                  shrinkWrap: true,
                  itemCount: contact.length,
                  itemBuilder: (context, index){
                    final contacts = contact[index];
                    final icon = contacts.name.isNotEmpty ? contacts.name[0] : ' ';
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppColor().lightPrimaryContainer,
                        child: Text(icon, style: TextStyle(
                          color: AppColor().onPrimaryContainer
                        ),),
                      ),
                      title: Text(contacts.name, style: TextAppStyle().m3bodylarge,),
                      subtitle: Text(contacts.number, style: TextAppStyle().m3bodymedium,),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: (){},
                            icon: const Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: (){
                              setState(() {
                                contact.removeAt(index);
                              });
                            },
                            icon: const Icon(Icons.delete),
                          )
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
