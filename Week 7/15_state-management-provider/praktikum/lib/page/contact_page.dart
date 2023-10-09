import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:praktikum/model/contacts.dart';
import 'package:praktikum/model/contacts_model.dart';
import 'package:praktikum/style.dart';
import 'package:praktikum/widget/button.dart';
import 'package:praktikum/widget/drawer.dart';
import 'package:praktikum/widget/edit_dialog.dart';
import 'package:praktikum/widget/header.dart';
import 'package:praktikum/widget/textfield.dart';
import 'package:provider/provider.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        centerTitle: true,
      ),
      drawer: const DrawerWidget(),
      body: const ContactApp(),
    );
  }
}

class ContactApp extends StatefulWidget {
  const ContactApp({super.key});

  @override
  State<ContactApp> createState() => _ContactAppState();
}

class _ContactAppState extends State<ContactApp> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  final currentDate = DateTime.now();
  Color selectedColor = Colors.redAccent;
  String pickedFileName = '';

  void addValue() {
    final name = nameController.text;
    final number = numController.text;

    if (name.isNotEmpty || number.isNotEmpty) {
      final contactsModel = Provider.of<ContactsModel>(context, listen: false);
      contactsModel.addContact(Contacts(name, number));
      nameController.clear();
      numController.clear();
    }
  }

  void _openFile(PlatformFile file){
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
    final contactsModel = Provider.of<ContactsModel>(context);
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
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Color'),
                        TextButton(
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
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      height: 50,
                      width: double.infinity,
                      color: selectedColor,
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Pick Files'),
                        TextButton(
                        onPressed: (){
                          _pickFile();
                        },
                        child: const Text('Pick and Open File'),
                      ),
                      ],
                    ),
                    const SizedBox(height: 15,),
                    ButtonWidget(
                      titleText: 'Submit',
                      onPressed: addValue,
                    )
                  ],
                ),
              ),
              Text('List Contacts', style: TextAppStyle().m3headlinesmall,),
              SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      itemExtent: 55,
                      shrinkWrap: true,
                      itemCount: contactsModel.contacts.length,
                      itemBuilder: (contet, index){
                        final contact = contactsModel.contacts[index];
                        final icon = contact.name.isNotEmpty ? contact.name[0] : ' ';
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: AppColor().lightPrimaryContainer,
                            child: Text(icon, style: TextStyle(
                              color: AppColor().onPrimaryContainer
                            ),),
                          ),
                          title: Text(contact.name, style: TextAppStyle().m3bodylarge,),
                          subtitle: Text(contact.number, style: TextAppStyle().m3bodymedium,),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: (){
                                  showDialog(
                                    context: contet,
                                    builder: (context) {
                                      return EditDialog(
                                        contact: contactsModel.contacts[index]
                                      );
                                    }
                                  );
                                },
                                icon: const Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: (){
                                  setState(() {
                                    contactsModel.contacts.removeAt(index);
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
        ]
      ));
  }
}