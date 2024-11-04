import 'package:get/get.dart';
import 'package:login_post_api_getx/models/login_response_model.dart';
import 'package:login_post_api_getx/screens/home_screen.dart';

import '../services/auth_services.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var loginResponseModel = LoginResponseModel().obs;

  final AuthServices _authServices = AuthServices();

  login(String email, String password) async {
    isLoading(true);
    try {
      LoginResponseModel? response = await _authServices.login(email, password);
      loginResponseModel.value = response!;

      if (response.token != null) {
        print("Login successful, token: ${response.token}");
        // Handle successful login (e.g., navigate, store token)
        Get.to(HomeScreen());
      } else {
        print("Login failed");
      }
    } catch (e) {
      print("An error occurred: $e");
    } finally {
      isLoading(false);
    }
  }
}
