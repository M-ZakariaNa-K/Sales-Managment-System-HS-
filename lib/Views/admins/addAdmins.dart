// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sales_management_system/Controllers/admins/addAdminController.dart';
import 'package:sales_management_system/Controllers/admins/admin_controller.dart';
import 'package:sales_management_system/Core/Components/components.dart';
import 'package:sales_management_system/Core/Components/widget.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';

// ignore: must_be_immutable
class AddAdminScreen extends StatelessWidget {
  TextEditingController userNameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  List<String> permission = [];
  bool isUpdate;
  int id = 0;
  AddAdminScreen({
    super.key,
    String name = '',
    String userName = '',
    String password = '',
    String confirmPassword = '',
    List<String>? permissions,
    required this.isUpdate,
    int id = 0,
  }) {
    if (isUpdate) {
      nameController.text = name;
      userNameController.text = userName;
      passwordController.text = password;
      confirmPasswordController.text = confirmPassword;
      permission = permissions!;
      this.id = id;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Material(
        child: Form(
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
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
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
                        height: 30,
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
                          labelText: 'Username'.tr,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
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
                        height: 30,
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
                        height: 20,
                      ),
                      Row(
                        children: [
                          CheckboxMenuButton(
                            value: permission.contains('export-excel'),
                            onChanged: (value) {
                              // _isPdfSelected = value!;
                              controller.update();
                              if (value!) {
                                permission.add("export-excel");
                              } else {
                                permission.removeWhere(
                                    (element) => element == "export-excel");
                              }
                            },
                            child: Text("Export Excel".tr),
                          ),
                          CheckboxMenuButton(
                            value: permission.contains('export-pdf'),
                            onChanged: (value) {
                              //_isExcelSelected = value!;
                              controller.update();
                              if (value!) {
                                permission.add("export-pdf");
                              } else {
                                permission.removeWhere(
                                    (element) => element == "export-pdf");
                              }
                            },
                            child: Text("Export PDF".tr),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      defaultButton(
                          function: () {
                            if (formKey.currentState!.validate()) {
                              if (!isUpdate) {
                                controller.registerState(context,
                                    userName: userNameController.text,
                                    name: nameController.text,
                                    password: passwordController.text,
                                    passwordConfirmation:
                                        confirmPasswordController.text,
                                    permissions: permission);

                                Get.find<AdminController>().getUserList();
                              } else {
                                controller.editUserInformation(
                                    id: id,
                                    userName: userNameController.text,
                                    name: nameController.text,
                                    password: passwordController.text,
                                    passwordConfirmation:
                                        confirmPasswordController.text,
                                    permissions: permission);
                                isEditAdmin = false;
                                Get.find<AdminController>().getUserList();
                                //tabe3 al update
                              }
                            }
                          },
                          label: isUpdate ? '27'.tr : '26'.tr,
                          context: context),
                      const SizedBox(
                        height: 30,
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
