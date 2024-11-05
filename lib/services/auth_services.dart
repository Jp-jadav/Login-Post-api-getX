import 'package:get/get.dart';
import 'package:login_post_api_getx/models/login_response_model.dart';

class AuthServices extends GetConnect {
  static const String url = "https://reqres.in/api/login";

  Future<LoginResponseModel?> login(String email, String password) async {
    final response = await post(url, {"email": email, "password": password});

    if (response.statusCode == 200) {
      LoginResponseModel model = LoginResponseModel.fromJson(response.body);
      return model;
    } else {
      throw Exception("Not login");
    }
  }
}
