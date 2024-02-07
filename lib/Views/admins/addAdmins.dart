import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_management_system/Controllers/admins/addAdminController.dart';
import 'package:sales_management_system/Core/Components/components.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        body: GetBuilder<AddAdminController>(
          init: AddAdminController(),
          builder: (AddAdminController controller) => SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 45),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 90,
                  ),
                  Text(
                    "30".tr,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      color: ThemeColors.primary,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Text("12".tr,
                          style: Theme.of(context).textTheme.labelLarge),
                    ],
                  ),
                  defaultButton(
                      function: () {
                        if (formKey.currentState!.validate()) {
                          controller.registerState(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                            password: passwordController.text,
                          );
                        }
                      },
                      label: '29'.tr,
                      context: context),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          "28".tr,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          maxLines: 3,
                          style: TextStyle(
                            fontFamily: "Poppins",
                            color: ThemeColors.primary,
                          ),
                        ),
                      ),
                      TextButton(
                        child: Text(
                          '25'.tr,
                          style: TextStyle(
                              fontFamily: "Poppins",
                              color: ThemeColors.primary,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
