import 'package:dio/dio.dart';

void updateContac() async {
  Dio dio = Dio();
  var url = 'https://jsonplaceholder.typicode.com/posts/1';

  try {
    Map request = {
      'id': 1,
      'title': 'admiraldy',
      'body': 'fahruz zaman',
      'userId': 1,
    };

    var response = await dio.put(url, data: request);

    if (response.statusCode == 200) {
      print(response.data);
    } else {
      print('Failed');
    }
  } catch (e) {
    print(e);
  }
}
