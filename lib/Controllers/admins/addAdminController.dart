import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAdminController extends GetxController {
  bool Gg = true;
  bool checkBox = false;
  Icon secureOrNot = const Icon(Icons.remove_red_eye);
  Icon confirmSecureOrNot = const Icon(Icons.remove_red_eye);

  void isSecure() {
    Gg = !Gg;
    secureOrNot = Gg
        ? const Icon(Icons.remove_red_eye)
        : const Icon(Icons.visibility_off);
    update();
  }

  
  void confirmIsSecure() {
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

  void registerState({required String phone, required String name,required String email,required String password}) {}
}
