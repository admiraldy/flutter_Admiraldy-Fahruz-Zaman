import 'package:flutter/material.dart';

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
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Contact {
  String name;
  String number;

  Contact({required this.name, required this.number});
}


class _MyHomePageState extends State<MyHomePage> {
  final List<Contact> contacts = [
    Contact(name: 'Leanne Graham', number: '1-770-736-8031 x56442'),
    Contact(name: 'Ervin Howell', number: '010-692-6593 x9125'),
    Contact(name: 'Clementine Bauch', number: '1-463-123-447'),
    Contact(name: 'Patricia Lebsack', number: '493-170-9623 x156'),
    Contact(name: 'Chelsey Dietrich', number: '(254)954-1289'),
    Contact(name: 'Mrs. Dennis Schulist', number: '1-477-935-8478 x6430'),
    Contact(name: 'Kurtis Weissnat', number: '210.067.6132')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MaterialApp'),
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            ListTile(
              title: Text('Home'),
            ),
            ListTile(
              title: Text('Settings'),
            )
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index){
          final contact = contacts[index];
          final icon = contact.name.isNotEmpty ? contact.name[0] : ' ';

          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text(icon, style: const TextStyle(color: Colors.white),),
            ),
            title: Text(contact.name, style: const TextStyle(fontWeight: FontWeight.w500),),
            subtitle: Text(contact.number, style: const TextStyle(color: Colors.grey),),
          );
        },
        ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings'
          )
        ],
      ),
    );
  }
}

