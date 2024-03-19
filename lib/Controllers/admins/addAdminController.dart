import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_management_system/Controllers/admins/admin_controller.dart';
import 'package:sales_management_system/Core/Components/components.dart';
import 'package:sales_management_system/Core/Components/sharedConstant.dart';
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

  void registerState(context,
      {required String userName,
      required String name,
      required String password,
      required passwordConfirmation,
      required permissions}) {
    DioHelper.postData(token: token, url: 'users/add', data: {
      'name': name,
      'username': userName,
      'password': password,
      'confirm_password': passwordConfirmation,
      "permissions": permissions
    }).then((value) async {
      newUserModel = NewUserModel.fromJson(value.data);
      await AdminController().getUserList();
      Get.find<AdminController>().update();
      showToast(text: 'User Added Successfully', state: ToastStates.SUCCESS);
      if (MediaQuery.sizeOf(context).width <= 600) {
        Get.back();
      }
    }).catchError((e) {
      return;
      //showToast(text: e.toString(), state: ToastStates.ERROR);
    });
  }

  Future<void> editUserInformation(
      {required int id,
      required String userName,
      required String name,
      required String password,
      required passwordConfirmation,
      required permissions}) async {
    isDataLoading = true;
    DioHelper.postData(token: token, url: 'users/update', data: {
      'id': id,
      'name': name,
      'username': userName,
      'password': password,
      'confirm_password': passwordConfirmation,
      "permissions": permissions
    }).then((value) async {
      newUserModel = NewUserModel.fromJson(value.data);
      await AdminController().getUserList();
      Get.find<AdminController>().update();
      await AdminController().getUserData(id: id);
      isDataLoading = false;
      showToast(text: 'User Edit Successfully', state: ToastStates.SUCCESS);
    }).catchError((e) {
      isLoadingFaild = true;
      return;
      //showToast(text: e.toString(), state: ToastStates.ERROR);
    });
  }
}
