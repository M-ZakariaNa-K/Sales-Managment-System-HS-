// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_management_system/Controllers/admins/admin_controller.dart';
import 'package:sales_management_system/Core/Components/components.dart';
import 'package:sales_management_system/Core/Components/widget.dart';
import 'package:sales_management_system/Core/helper/services/getTest.dart';
import 'package:sales_management_system/Models/admins/users_model.dart';
import 'package:sales_management_system/Models/auth/userModel.dart';
import 'package:sales_management_system/Views/admins/admins.dart';
import 'package:sales_management_system/Views/home/dashboard.dart';
import 'package:sales_management_system/Views/home/splash_view.dart';
import 'package:sales_management_system/main.dart';

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
        data: {'username': userName, 'password': password}).then((value) async {
      userModel = UserModel.fromJson(value.data);
      token = userModel!.data!.token!;
      storeToken(token);
      print("${token}   GGGGGG");
      await AdminController().getUserList();
      showToast(text: 'Logged in Successfully', state: ToastStates.SUCCESS);
      storage.setItem('isLoggedIn', true);
      // Get.toNamed('/DashBoard');
      Get.off(const DashboardPage());

      void navigateToNewScreen(BuildContext context, String route) {
        //saveCurrentRoute(route);
        // Get.toNamed('/DashBoard');
        Get.off(const DashboardPage());
      }
    });
  }
}
