import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  bool Gg = true;
  bool checkBox = false;
  Icon secureOrNot = const Icon(Icons.remove_red_eye);

  void isSecure() {
    Gg = !Gg;
    secureOrNot = Gg
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
