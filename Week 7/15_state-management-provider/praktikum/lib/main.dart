import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:praktikum/contacts.dart';
import 'package:praktikum/style.dart';
import 'package:praktikum/widget/button.dart';
import 'package:praktikum/widget/header.dart';
import 'package:praktikum/widget/textfield.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ContactModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.light(),
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: const Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              const Header(),
              TextFieldWidget(
                textController: context.read<ContactModel>().nameController,
                textLabel: 'Name',
                textHint: 'Insert Your Name',
              ),
              const SizedBox(
                height: 16,
              ),
              TextFieldWidget(
                textController: context.read<ContactModel>().numController,
                textLabel: 'Nomor',
                textHint: '+62',
              ),
              const SizedBox(
                height: 15,
              ),
              ButtonWidget(
                titleText: 'Submit',
                onPressed: () {
                  context.read<ContactModel>().addValue();
                },
              )
            ],
          ),
          Text(
            'List Contacts',
            style: TextAppStyle().m3headlinesmall,
          ),
          Consumer<ContactModel>(
            builder: (context, model, child) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      itemExtent: 55,
                      shrinkWrap: true,
                      itemCount: model.contact.length,
                      itemBuilder: (context, index) {
                        final contacts = model.contact[index];
                        final icon =
                            contacts.name.isNotEmpty ? contacts.name[0] : ' ';
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: AppColor().lightPrimaryContainer,
                            child: Text(
                              icon,
                              style: TextStyle(
                                  color: AppColor().onPrimaryContainer),
                            ),
                          ),
                          title: Text(
                            contacts.name,
                            style: TextAppStyle().m3bodylarge,
                          ),
                          subtitle: Text(
                            contacts.number,
                            style: TextAppStyle().m3bodymedium,
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: () {
                                  model.removeValue(index);
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
              );
            },
          )
        ],
      ),
    );
  }
}
