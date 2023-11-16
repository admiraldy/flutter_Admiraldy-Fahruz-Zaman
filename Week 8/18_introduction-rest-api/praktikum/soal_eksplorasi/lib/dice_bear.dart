import 'package:http/http.dart' as http;
import 'dart:convert';

class ImageData {
  final String avatar;

  ImageData({required this.avatar});

  factory ImageData.fromJson(Map<String, dynamic> json) {
    return ImageData(
      avatar: json['avatar'],
    );
  }
}

class DiceBearAPI {
  static Future<ImageData> getImageData(String seed) async {
    final response = await http
        .get(Uri.parse('https://api.dicebear.com/7.x/lorelei/svg?seed=$seed'));
    if (response.statusCode == 200) {
      return ImageData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load image');
    }
  }
}
