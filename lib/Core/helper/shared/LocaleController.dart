import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LocalController extends GetxController {
  void changeLang(String codeLang) {
    Locale locale = Locale(codeLang);
    Get.updateLocale(locale);
  }
}
