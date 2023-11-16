import 'package:flutter/material.dart';

class Contacts {
  final String name;
  final String number;

  Contacts(this.name, this.number);
}

class ContactModel extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numController = TextEditingController();
  final List<Contacts> contact = [];

  void addValue() {
    final name = nameController.text;
    final number = numController.text;
    if (name.isNotEmpty || number.isNotEmpty) {
      contact.add(
        Contacts(name, number),
      );
      nameController.clear();
      numController.clear();
      notifyListeners();
    }
  }

  void removeValue(int index) {
    contact.removeAt(index);
    notifyListeners();
  }
}
