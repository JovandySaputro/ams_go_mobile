import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:ams_go_mobile/data/data_model.dart';

final String url = "http://116.254.100.222:8000/ExportedFile/apites.txt";

List<User> parseUser(String responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;
  var users = list.map((e) => User.fromJson(e)).toList();
  return users;
}

Future<List<User>> fetchUsers() async {
  final http.Response response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return compute(parseUser, response.body);
  } else {
    throw Exception(response.statusCode);
  }
}
