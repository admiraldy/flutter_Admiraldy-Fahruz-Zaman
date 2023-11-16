import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';

class ImageData {
  final String avatar;

  ImageData({required this.avatar});

  factory ImageData.fromJson(Map<String, dynamic> json) {
    return ImageData(avatar: json['avatar']);
  }
}

class DiceBearAPI {
  Future<ImageData> fetchImage() async {
    final response = await http
        .get(Uri.parse('https://avatars.dicebear.com/api/male/example.svg'));

    if (response.statusCode == 200) {
      return ImageData.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load image');
    }
  }
}

class ShowImage extends StatelessWidget {
  const ShowImage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DiceBearAPI().fetchImage(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SvgPicture.network(snapshot.data!.avatar);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
