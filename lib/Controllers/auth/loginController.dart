// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_management_system/Core/Components/components.dart';
import 'package:sales_management_system/Core/Components/widget.dart';
import 'package:sales_management_system/Core/helper/services/getTest.dart';
import 'package:sales_management_system/Models/admins/users_model.dart';
import 'package:sales_management_system/Models/auth/userModel.dart';
import 'package:sales_management_system/Views/admins/admins.dart';
import 'package:sales_management_system/Views/home/dashboard.dart';

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
            url: 'login',
            data: {'username': 'M_zakaria_K', 'password': '123456'})
        .then((value) async {
      userModel = UserModel.fromJson(value.data);
      token = userModel!.data!.token!;
      print("${token}   GGGGGG");

      await DioHelper().getData(path: 'users/list', token: token).then((value) {
        print("gg");
        listUserModel = ListUserModel.fromJson(value.data);
        print(listUserModel!.data.UsersCount);
        showToast(text: 'text', state: ToastStates.SUCCESS);
      }).catchError((e) {
        showToast(text: e.toString(), state: ToastStates.ERROR);
      });

      showToast(text: 'Logged in Successfully', state: ToastStates.SUCCESS);
      Get.to(const DashboardPage());
    }).catchError((e) {});
  }
}
