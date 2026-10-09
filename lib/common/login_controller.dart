import 'package:flutter/material.dart';

class LoginControllers {
  final emialController = TextEditingController();
  final passwordController = TextEditingController();

  void dispose() {
    emialController.dispose();
    passwordController.dispose();
  }
}
