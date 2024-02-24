// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_management_system/Core/Components/components.dart';
import 'package:sales_management_system/Core/helper/services/getTest.dart';

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

  void loginState({required String userName, required String password}) {
    DioHelper.postData(
        baseURL: 'baseURL',
        query: 'query',
        data: {'username': userName, 'password': password}).then((value) {
      showToast(text: 'Login Successfully', state: ToastStates.SUCCESS);
    });
  }
}
