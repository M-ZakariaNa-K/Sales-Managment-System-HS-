// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sales_management_system/Controllers/admins/admin_controller.dart';
import 'package:sales_management_system/Core/Components/components.dart';
import 'package:sales_management_system/Core/Components/sharedConstant.dart';
import 'package:sales_management_system/Core/helper/services/getTest.dart';
import 'package:sales_management_system/Models/auth/userModel.dart';
import 'package:sales_management_system/Views/auth/login.dart';
import 'package:sales_management_system/main.dart';

class LoginController extends GetxController {
  bool isSecure = true;
  bool checkBox = false;
  Icon secureOrNot = const Icon(Icons.remove_red_eye);

//rony
  final box = GetStorage();

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
      data: {'username': userName, 'password': password},
    ).then((response) async {
      final data = response.data;

      if (data != null) {
        userModel = UserModel.fromJson(data);
        if (userModel != null && userModel!.data != null) {
          token = userModel!.data!.token!;
          isUserAdmin = userModel!.data!.isAdmin!;
          sessionId = userModel!.data!.sessionId!;
          //==================================
          // Store isUserAdmin in GetStorage
          // GetStorage().write('isUserAdmin', isUserAdmin);
          //==================================
          //rony
          box.write('isUserAdmin', isUserAdmin);
          isExcel = userModel!.data!.hasExcel!;
          box.write('isExcel', isExcel);
          isPdf = userModel!.data!.hasPdf!;
          box.write('isPdf', isPdf);
          storeToken(token, isUserAdmin!, isExcel!, isPdf!);

         
          showToast(text: 'Logged in Successfully', state: ToastStates.SUCCESS);
          storage.setItem('isLoggedIn', true);
          //================================
          Get.offAndToNamed('/DashBoard');
          LoginScreen.userController.clear();
          LoginScreen.passwordController.clear();
          //================================
          //Get.off(() => const DashboardPage());
        } else {
          showToast(
              text: 'Invalid response from server', state: ToastStates.ERROR);
        }
      } else {
        showToast(text: 'Empty response from server', state: ToastStates.ERROR);
      }
    }).catchError((error) {
      //showToast(text: 'Error: $error', state: ToastStates.ERROR);
    });
  }
}
