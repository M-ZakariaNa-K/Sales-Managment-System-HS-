import 'package:get/get.dart';
import 'package:sales_management_system/Core/Components/components.dart';
import 'package:sales_management_system/Core/Components/widget.dart';
import 'package:sales_management_system/Core/helper/services/getTest.dart';
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

  void addUser(
      {required String username,
      required String name,
      required String password,
      required String confirmPassword}) {
    DioHelper().postDataWithAuth(url: 'url', token: token, data: {
      'username': username,
      'name': name,
      'password': password,
      'confirmPassword': confirmPassword
    }).then((value) async {
      newUserModel = NewUserModel.fromJson(value.data);
      await DioHelper().getData(path: 'users/list', token: token).then((value) {
        print("gg");
        listUserModel = ListUserModel.fromJson(value.data);
        print(listUserModel!.data.UsersCount);
      });
      showToast(text: 'User add Successfully', state: ToastStates.SUCCESS);
      update();
    }).catchError((e) {
      showToast(text: 'something went wrong', state: ToastStates.WARNING);
    });
  }
}
