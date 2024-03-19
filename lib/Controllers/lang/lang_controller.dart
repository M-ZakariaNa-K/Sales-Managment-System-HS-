import 'package:get/get.dart';
import 'package:sales_management_system/Core/helper/shared/LocaleController.dart';

class LanguageRadioController extends GetxController {
  LocalController controllerLang = Get.find();
  bool get selectedValue => Get.locale?.languageCode == 'ar';

  void toggleLanguage() {
    if (Get.locale?.languageCode == 'ar') {
      controllerLang.changeLang("en");
    } else {
      controllerLang.changeLang("ar");
    }
  }
}
