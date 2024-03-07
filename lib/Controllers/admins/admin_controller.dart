import 'package:get/get.dart';
import 'package:sales_management_system/Core/Components/components.dart';
import 'package:sales_management_system/Core/Components/widget.dart';
import 'package:sales_management_system/Core/helper/services/getTest.dart';
// ignore: unused_import
import 'package:sales_management_system/Core/helper/shared/shared.dart';
import 'package:sales_management_system/Models/admins/new_user_model.dart';
import 'package:sales_management_system/Models/admins/user_info_model.dart';
import 'package:sales_management_system/Models/admins/users_model.dart';

class AdminController extends GetxController {

  Future<void> onInit() async {
    await DioHelper().getData(path: 'users/list', token: token).then((value) {
      print("gg");
      listUserModel = ListUserModel.fromJson(value.data);
      print(listUserModel!.data.UsersCount);
    }).catchError((e) {
      showToast(text: e.toString(), state: ToastStates.ERROR);
      update();
    });
  }

  void removeUser({required int id}) {
    DioHelper()
        .deletData(path: 'users/delete?id=$id', token: token)
        .then((value) async {
      showToast(state: ToastStates.SUCCESS, text: 'User removed Successfully');
      await DioHelper().getData(path: 'users/list', token: token).then((value) {
        print("gg");
        listUserModel = ListUserModel.fromJson(value.data);
        print(listUserModel!.data.UsersCount);
      }).catchError((e) {
        showToast(text: e.toString(), state: ToastStates.ERROR);
      });
      update();
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
      await DioHelper()
          .getData(path: 'users/list', token: token)
          .then((value) {
        listUserModel = ListUserModel.fromJson(value.data);
        // Notify UI that data has changed
        update();
      });
      showToast(text: 'User added Successfully', state: ToastStates.SUCCESS);
    }).catchError((e) {
      showToast(text: 'Something went wrong', state: ToastStates.WARNING);
    });
  }

  Future<void> getUserList() async {
    isDataLoading = true;
    await DioHelper().getData(path: 'users/list', token: token).then((value) {
      listUserModel = ListUserModel.fromJson(value.data);
      // Notify UI that data has changed
      isDataLoading = false;
      update();
    }).catchError((e) {
      isLoadingFaild = true;
      isDataLoading = false;
      print("gg");
      update();
    });
  }

  Future<void> getUserData({required int id}) async {
    await DioHelper()
        .getData(path: 'users/get?id=$id', token: token)
        .then((value) {
      userInfoModel = UserInfoModel.fromJson(value.data);
      update();
    }).catchError((e) {
      update();
    });
  }
}
