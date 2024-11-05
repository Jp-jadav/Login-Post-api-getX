import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  final TextEditingController emailController =
      TextEditingController(text: "eve.holt@reqres.in");
  final TextEditingController passwordController =
      TextEditingController(text: "cityslicka");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            Obx(
              () {
                if (loginController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ElevatedButton(
                      onPressed: () {
                        String email = emailController.text.trim();
                        String password = passwordController.text.trim();
                        loginController.login(email, password);
                      },
                      child: const Text("Login"));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
