// ignore: file_names
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sales_management_system/Core/Components/components.dart';
import 'package:sales_management_system/Core/helper/services/getTest.dart';
import 'package:sales_management_system/Core/helper/shared/shared.dart';
import 'package:sales_management_system/Models/home/get_database_name_model.dart';

class HostIpController extends GetxController {
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

  void hostIPLogin({required String hostController}) async {
    DioHelper.postData(
        url: 'databases/set-host',
        data: {'name': hostController}).then((value) {
      showToast(text: value.data['message'], state: ToastStates.SUCCESS);
    }).catchError((e) {
      print("object");
      showToast(text: e.toString(), state: ToastStates.ERROR);
    });
  }

  Future<String> gethostIP() async {
    var response = await Dio().get("$zakBasicUrl/databases/get-host");
    String host = GetAllDatabsNameModel.fromJson(response.data).data.name;
    // hostIp = GetAllDatabsNameModel.fromJson(response.data).data.name;
    return host;
    // update();
    // ignore: body_might_complete_normally_catch_error
    // .catchError((e) {
    // showToast(
    //     text: e.response?.data['message'], state: ToastStates.ERROR);

    // });

    // await DioHelper().getData(path: 'databases/get-host').then((value) {
    //   print("ssss");
    //   hostIp = GetAllDatabsNameModel.fromJson(value.data).data.name;
    //   update();
    // }).catchError((e) {
    //   showToast(text: e.toString(), state: ToastStates.ERROR);
    //   update();
    // });
  }
}
