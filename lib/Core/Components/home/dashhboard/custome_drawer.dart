import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_management_system/Controllers/lang/lang_controller.dart';
import 'package:sales_management_system/Core/Components/components.dart';
import 'package:sales_management_system/Core/Components/home/dashhboard/custome_drawer_item.dart';
import 'package:sales_management_system/Core/Components/widget.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';
import 'package:sales_management_system/Core/helper/services/getTest.dart';
import 'package:sales_management_system/Views/auth/login.dart';

class DrawerWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  final Color selectedColor;

  const DrawerWidget({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
    required this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      color: ThemeColors.secondary,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            width: 170,
            height: 170,
            child: Image.asset(
              'images/Logo2.png',
              width: 50,
            ),
          ),
          DrawerItem(
            title: '1'.tr,
            icon: Icons.home_work_outlined,
            index: 0,
            selectedIndex: selectedIndex,
            onItemTapped: onItemTapped,
            selectedColor: selectedColor,
          ),
          !isUserAdmin!
              ? const SizedBox()
              : DrawerItem(
                  title: '47'.tr,
                  icon: Icons.person_2_outlined,
                  index: 1,
                  selectedIndex: selectedIndex,
                  onItemTapped: isUserAdmin! ? onItemTapped : (p0) {},
                  selectedColor: selectedColor,
                ),
          DrawerItem(
            title: '4'.tr,
            icon: Icons.picture_as_pdf_outlined,
            index: 2,
            selectedIndex: selectedIndex,
            onItemTapped: onItemTapped,
            selectedColor: selectedColor,
          ),
          DrawerItem(
            title: '9'.tr,
            icon: Icons.logout,
            index: 4,
            selectedIndex: selectedIndex,
            onItemTapped: (value) {
              DioHelper()
                  .getData(path: 'users/logout', token: token)
                  .then((value) {
                showToast(
                    text: "Successfully logged out",
                    state: ToastStates.SUCCESS);
                token = '';
                Get.off(LoginScreen());
              });
            },
            selectedColor: selectedColor,
          ),
          const Spacer(
            flex: 3,
          ),
          GetBuilder<LanguageRadioController>(
              init: LanguageRadioController(),
              builder: (LanguageRadioController controller) {
                return
                    Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "Arabic".tr,
                        style: const TextStyle(
                          color: ThemeColors.secondaryTextColor,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            controller.toggleLanguage();
                          },
                          icon: const Icon(
                            Icons.swap_horiz_rounded,
                            color: ThemeColors.secondaryTextColor,
                            size: 18,
                          )),
                      Text(
                        "English".tr,
                        style: const TextStyle(
                          color: ThemeColors.secondaryTextColor,
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
