import 'dart:convert';
import 'package:ams_go_mobile/data/get_api.dart';
import 'package:ams_go_mobile/data/get_list_api.dart';
import 'package:ams_go_mobile/data/post_api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:http/http.dart' as http;
import 'package:ams_go_mobile/data/data_model.dart';

class ApiService {
  final String apiUrl = "http://116.254.100.222:8000/";

  List<User> parseUser(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    var users = list.map((e) => User.fromJson(e)).toList();
    return users;
  }

  Post_API parsePostApi(String responseBody) {
    var list = json.decode(responseBody);
    var post = Post_API.fromJson(list);
    return post;
  }

  Get_Api parseGetApi(String responseBody) {
    var list = json.decode(responseBody) as Map<String, dynamic>;
    var get = Get_Api.fromJson(list);
    return get;
  }

  Get_List_Api parseGetListApi(String responseBody) {
    var list = json.decode(responseBody) as Map<String, dynamic>;
    var get = Get_List_Api.fromJson(list);
    return get;
  }

  Future<List<User>> fetchUsers() async {
    final http.Response response =
        await http.get(Uri.parse(apiUrl + "ExportedFile/apites.txt"));

    if (response.statusCode == 200) {
      return compute(parseUser, response.body);
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<Post_API> fetchCreate(String name, String job) async {
    final http.Response response = await http.post(
        Uri.parse("https://reqres.in/api/users"),
        body: {"name": name, "job": job});

    if (response.statusCode == 201) {
      return compute(parsePostApi, response.body);
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<Get_Api> fetchGetApi(String id) async {
    final http.Response response = await http.get(
      Uri.parse("https://reqres.in/api/users/" + id),
    );

    if (response.statusCode == 200) {
      return compute(parseGetApi, response.body);
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<Get_List_Api> fetchGetListApi(String id) async {
    final http.Response response = await http.get(
      Uri.parse("https://reqres.in/api/users?page=" + id),
    );

    if (response.statusCode == 200) {
      return compute(parseGetListApi, response.body);
    } else {
      throw Exception(response.statusCode);
    }
  }
}


// final String url = "http://116.254.100.222:8000/ExportedFile/apites.txt";

// List<User> parseUser(String responseBody) {
//   var list = json.decode(responseBody) as List<dynamic>;
//   var users = list.map((e) => User.fromJson(e)).toList();
//   return users;
// }

// Future<List<User>> fetchUsers() async {
//   final http.Response response = await http.get(Uri.parse(url));

//   if (response.statusCode == 200) {
//     return compute(parseUser, response.body);
//   } else {
//     throw Exception(response.statusCode);
//   }
// }


