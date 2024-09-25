import 'dart:convert';
import 'dart:developer';

import 'package:doctor_module/model/loginmodel.dart';
import 'package:doctor_module/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginService {
  Future<Loginmodel?> loginService({username, password, context}) async {
    var data = json.encode({"userName": username, "password": password});
    var headers = {'Content-Type': 'application/json'};
    print("object1");
    try {
      var response = await http.post(Uri.parse(Urls.loginUrl),
          body: data, headers: headers);

      print("object");
      if (response.statusCode == 200) {
        log(response.statusCode.toString());

        return loginmodelFromJson(response.body);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Color.fromARGB(255, 255, 2, 2),
          content: Row(
            children: [
              Icon(Icons.done, color: Colors.white),
              SizedBox(width: 10),
              Text('Un Auth Credential', style: TextStyle(color: Colors.white)),
            ],
          ),
        ));
      }
    } catch (e) {
      print("error ::$e");
      rethrow;
    }
    return null;
  }
}
