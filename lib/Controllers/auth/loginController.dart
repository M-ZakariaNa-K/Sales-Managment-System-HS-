// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  bool isSecure = true;
  bool checkBox = false;
  Icon secureOrNot = const Icon(Icons.remove_red_eye);

  void changeSecureState() {
    isSecure = !isSecure;
    secureOrNot = isSecure
        ? const Icon(Icons.remove_red_eye)
        : const Icon(Icons.visibility_off);
    update();
  }

  void changeCheckBox() {
    checkBox = !checkBox;
    update();
  }

  void loginState({required String phone, required String password}) {}
}
