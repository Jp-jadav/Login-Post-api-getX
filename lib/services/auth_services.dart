import 'dart:convert';

import 'package:login_post_api_getx/models/login_response_model.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  static const String url = "https://reqres.in/api/login";

  Future<LoginResponseModel?> login(String email, String password) async {
    final response = await http
        .post(Uri.parse(url), body: {"email": email, "password": password});

    if (response.statusCode == 200) {
      LoginResponseModel model =
          LoginResponseModel.fromJson(jsonDecode(response.body));
      return model;
    } else {
      throw Exception("Not login");
    }
  }
}
