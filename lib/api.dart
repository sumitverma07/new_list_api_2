import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:new_list_api2/Model/model.dart';

Future<List<Model>> getApidata() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1/comments'));
  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    return data.map((item) => Model.fromJson(item)).toList();
  } else {
    throw Exception('Unable to fetch data');
  }
}
