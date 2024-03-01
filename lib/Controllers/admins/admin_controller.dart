import 'package:get/get.dart';
import 'package:sales_management_system/Core/Components/components.dart';
import 'package:sales_management_system/Core/Components/widget.dart';
import 'package:sales_management_system/Core/helper/services/getTest.dart';
import 'package:sales_management_system/Core/helper/shared/shared.dart';
import 'package:sales_management_system/Models/admins/new_user_model.dart';
import 'package:sales_management_system/Models/admins/users_model.dart';

class AdminController extends GetxController {
  
  onInit() {}

  void removeUser() {
    DioHelper().getData(path: 'path').then((value) {
      showToast(state: ToastStates.SUCCESS, text: 'User removed Successfully');
    }).catchError((e) {
      showToast(text: "Something went wrong", state: ToastStates.ERROR);
    });
  }
void addUser({
  required String username,
  required String name,
  required String password,
  required String confirmPassword,
}) {
  DioHelper().postDataWithAuth(
    url: 'url',
    token: token,
    data: {
      'username': username,
      'name': name,
      'password': password,
      'confirmPassword': confirmPassword,
    },
  ).then((value) async {
    newUserModel = NewUserModel.fromJson(value.data);
    await DioHelper().getData(path: 'users/list', token: tokenVar).then((value) {
      listUserModel = ListUserModel.fromJson(value.data);
      // Notify UI that data has changed
      update();
    });
    showToast(text: 'User added Successfully', state: ToastStates.SUCCESS);
  }).catchError((e) {
    showToast(text: 'Something went wrong', state: ToastStates.WARNING);
  });
}

}
