import 'package:flutter/material.dart';
import 'package:praktikum/model/contacts.dart';

class ContactsModel extends ChangeNotifier {
  final List contacts = [];

  void addContact(Contacts contact){
    contacts.add(contact);
    notifyListeners();
  }
}