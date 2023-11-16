import 'package:dio/dio.dart';

class Contact {
  int? id;
  String? name;
  String? email;
  String? phone;

  Contact({this.id, this.name, this.email, this.phone});

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
    );
  }
}

Future fetchContact() async {
  Dio dio = Dio();

  try {
    var response = await dio.get(
        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/2');

    if (response.statusCode == 200) {
      Map<String, dynamic> contact = response.data;
      Contact contacts = Contact.fromJson(contact);
      print(contacts.id);
      print(contacts.name);
      print(contacts.email);
      print(contacts.phone);
    } else {
      print('Failed');
    }
  } catch (e) {
    print(e);
  }
}
