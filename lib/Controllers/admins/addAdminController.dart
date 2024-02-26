import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_management_system/Core/Components/components.dart';
import 'package:sales_management_system/Core/Components/widget.dart';
import 'package:sales_management_system/Core/helper/services/getTest.dart';
import 'package:sales_management_system/Models/admins/new_user_model.dart';

class AddAdminController extends GetxController {
  bool isSecure = true;
  bool checkBox = false;
  Icon secureOrNot = const Icon(Icons.remove_red_eye);
  Icon confirmSecureOrNot = const Icon(Icons.remove_red_eye);

  void changeSecure() {
    isSecure = !isSecure;
    secureOrNot = isSecure
        ? const Icon(Icons.remove_red_eye)
        : const Icon(Icons.visibility_off);
    update();
  }

  void confirmIsSecure() {
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

  void registerState(
      {required String userName,
      required String name,
      required String password,
      required passwordConfirmation}) {
    DioHelper.postDataWithAuth(url: 'users/add', data: {
      'name': name,
      'username': userName,
      'password': password,
      'confirm_password': passwordConfirmation,
      'permissions': ["export-pdf"],
    }).then((value) {
      newUserModel = NewUserModel.fromJson(value.data);
      showToast(text: 'User Added Successfully', state: ToastStates.SUCCESS);
    });
  }
}
