import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_management_system/Controllers/admins/addAdminController.dart';
import 'package:sales_management_system/Core/Components/components.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';

// ignore: must_be_immutable
class AddAdminScreen extends StatelessWidget {
  TextEditingController userNameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isUpdate;
  AddAdminScreen({
    super.key,
    required this.isUpdate,
    name = '',
    userName = '',
    password = '',
    confirmPassword = '',
  }) {
    nameController.text = name;
    userNameController.text = userName;
    passwordController.text = password;
    confirmPasswordController.text = confirmPassword;
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    //final horizontalPadding = mediaQueryData.size.width;
    final verticalPadding = mediaQueryData.size.height;
    return Form(
      key: formKey,
      child: GetBuilder<AddAdminController>(
        init: AddAdminController(),
        builder: (AddAdminController controller) => SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            decoration: (BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)))),
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 45),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '29'.tr;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    prefixIcon: const Icon(
                      Icons.person_2,
                      color: ThemeColors.primary,
                    ),
                    labelText: '28'.tr,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: userNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '24'.tr;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    prefixIcon: const Icon(
                      Icons.person_outline,
                      color: ThemeColors.primary,
                    ),
                    labelText: '12'.tr,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '23'.tr;
                    }
                    return null;
                  },
                  obscureText: controller.isSecure,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: ThemeColors.primary,
                    ),
                    labelText: '22'.tr,
                    suffixIcon: IconButton(
                      icon: controller.secureOrNot,
                      onPressed: () {
                        controller.changeSecure();
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '33'.tr;
                    }
                    return null;
                  },
                  obscureText: controller.isSecure,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: ThemeColors.primary,
                    ),
                    labelText: '16'.tr,
                    suffixIcon: IconButton(
                      icon: controller.secureOrNot,
                      onPressed: () {
                        controller.changeSecure();
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const SizedBox(height: 40),
                defaultButton(
                    function: () {
                      if (formKey.currentState!.validate()) {
                        if (!isUpdate) {
                          controller.registerState(context,
                              userName: userNameController.text,
                              name: nameController.text,
                              password: passwordController.text,
                              passwordConfirmation:
                                  confirmPasswordController.text);
                        } else {
                          print("ggg00");
                          //tabe3 al update
                        }
                      }
                    },
                    label: isUpdate ? '27'.tr : '26'.tr,
                    context: context),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
