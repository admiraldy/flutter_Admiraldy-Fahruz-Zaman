import 'package:dio/dio.dart';

void sendContact() async {
  Dio dio = Dio();
  var url =
      'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts';

  try {
    Map<String, dynamic> contacts = {
      'name': 'admiraldy',
      'phone': '081234567890',
      'email': 'admiraldy@mail.com'
    };

    var response = await dio.post(url, data: contacts);

    if (response.statusCode == 201) {
      print('Success');
    } else {
      print('Failed');
    }
  } catch (e) {
    print(e);
  }
}
