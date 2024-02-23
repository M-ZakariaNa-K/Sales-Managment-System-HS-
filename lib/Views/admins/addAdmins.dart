import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_management_system/Controllers/admins/addAdminController.dart';
import 'package:sales_management_system/Core/Components/components.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';

// ignore: must_be_immutable
class AddAdminScreen extends StatelessWidget {
  TextEditingController phoneController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  AddAdminScreen({super.key});

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
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 45),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Add a new admin",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                        color: ThemeColors.primary),
                  ),
                  defaultTextFormField(
                      label: 'User Name',
                      preIcon: const Icon(Icons.person),
                      validator: (value) {},
                      controller: userNameController),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultTextFormField(
                      label: 'Email',
                      preIcon: const Icon(Icons.email),
                      validator: (value) {},
                      controller: emailController),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultTextFormField(
                      label: 'Phone Number',
                      preIcon: const Icon(Icons.phone),
                      validator: (value) {},
                      controller: phoneController),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultTextFormField(
                      suffix: IconButton(
                          onPressed: () {
                            controller.isSecure();
                          },
                          icon: controller.confirmSecureOrNot),
                      label: 'Password',
                      preIcon: const Icon(Icons.lock),
                      validator: (value) {},
                      controller: passwordController),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultTextFormField(
                      label: 'Confirm Password',
                      preIcon: const Icon(Icons.lock),
                      validator: (value) {},
                      suffix: IconButton(
                          onPressed: () {
                            controller.confirmIsSecure();
                          },
                          icon: controller.confirmSecureOrNot),
                      controller: confirmPasswordController),
                  const SizedBox(height: 25),
                  defaultButton(
                      function: () {
                        if (formKey.currentState!.validate()) {
                          controller.registerState(
                            name: userNameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                            password: passwordController.text,
                          );
                        }
                      },
                      label: 'Register',
                      context: context),
                  const SizedBox(
                    height: 20,
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
