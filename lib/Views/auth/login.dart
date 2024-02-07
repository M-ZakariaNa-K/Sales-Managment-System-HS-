import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_management_system/Controllers/auth/loginController.dart';
import 'package:sales_management_system/Core/Components/components.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  var userController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginController>(
        init: LoginController(),
        builder: (LoginController controller) => SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: formKey,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  defaultButton(
                      function: () {
                        if (formKey.currentState!.validate()) {
                          controller.loginState(
                              phone: userController.text,
                              password: passwordController.text);
                        }
                      },
                      label: '25'.tr,
                      context: context),
                  SizedBox(
                    height: 20,
                  ),
                  CheckboxListTile(
                    title: Text(
                      "23".tr,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                    value: controller.checkBox,
                    onChanged: (value) {
                      controller.changeCheckBox();
                    },
                    side: BorderSide(),
                  ),
                  Text(
                    "24".tr,
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "26".tr,
                        style: TextStyle(
                          color: ThemeColors.primary,
                          fontFamily: "Poppins",
                          fontSize: 18,
                        ),
                      ),
                      TextButton(
                        child: Text("27".tr,
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: ThemeColors.primary,
                            )),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
