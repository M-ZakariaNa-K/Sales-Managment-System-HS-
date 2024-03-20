import 'package:get/get.dart';
import 'package:sales_management_system/Core/Components/components.dart';
import 'package:sales_management_system/Core/Components/sharedConstant.dart';
import 'package:sales_management_system/Core/helper/services/getTest.dart';
// ignore: unused_import
import 'package:sales_management_system/Core/helper/shared/shared.dart';
import 'package:sales_management_system/Models/admins/user_info_model.dart';
import 'package:sales_management_system/Models/admins/users_model.dart';

class AdminController extends GetxController {
  @override
  Future<void> onInit() async {
    isDataLoading = true;
    super.onInit();
    await DioHelper().getData(path: 'users/list', token: token).then((value) {
      listUserModel = ListUserModel.fromJson(value.data);
      isDataLoading = false;
      update();
    }).catchError((e) {
      isDataLoading = false;
      isLoadingFaild = false;
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
        listUserModel = ListUserModel.fromJson(value.data);
      }).catchError((e) {
        showToast(text: e.toString(), state: ToastStates.ERROR);
      });
      update();
    }).catchError((e) {
      showToast(text: "Something went wrong", state: ToastStates.ERROR);
    });
  }
  Future<void> getUserList() async {
    await DioHelper().getData(path: 'users/list', token: token).then((value) {
      listUserModel = ListUserModel.fromJson(value.data);
      isDataLoading = false;
      update();
    }).catchError((e) {
      isLoadingFaild = true;
      isDataLoading = false;
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
