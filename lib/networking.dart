import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Album> createAlbum(String title,String otp) async {
  final response = await http.post(
    Uri.parse('https://startuptest.tech/api/auth/client/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'mobile_number': title,
      'otp': otp,
    }),
  );

  if (response.statusCode == 200) {

    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(response.statusCode);
  }
}

class Album {
  final String id;
  final String title;

  const Album({required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['name'],
      title: json['mobile_number'],
    );
  }
}
