import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';
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
    final mediaQueryData = MediaQuery.of(context);

    final horizontalPadding = mediaQueryData.size.width;

    final verticalPadding =
        mediaQueryData.size.height * 0.7; // Adjust the multiplier as needed

    return Scaffold(
      body: GetBuilder<LoginController>(
        init: LoginController(),
        builder: (LoginController controller) => SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(children: [
            ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Image.asset('images/u.jpg')),
            Form(
              key: formKey,
              child: Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: verticalPadding * 0.35),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(.9),
                      ),
                      height: verticalPadding,
                      width: horizontalPadding * 0.3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 80.0,
                                    horizontal: horizontalPadding),
                                child: Image.asset('images/logo.png'),
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'UserName musn\'t be empty';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  prefixIcon: const Icon(
                                    Icons.person,
                                    color: ThemeColors.primary,
                                  ),
                                  labelText: 'UserName',
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Password musn\'t be empty';
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
                                  labelText: 'Password',
                                  suffixIcon: IconButton(
                                    icon: controller.secureOrNot,
                                    onPressed: () {
                                      controller.changeSecureState();
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              defaultButton(
                                  function: () {
                                    if (formKey.currentState!.validate()) {
                                      controller.loginState(
                                          phone: userController.text,
                                          password: passwordController.text);
                                    }
                                  },
                                  label: 'Login',
                                  context: context),
                              const SizedBox(
                                height: 20,
                              ),
                              CheckboxListTile(
                                title: const Text(
                                  "Remember me",
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      color: ThemeColors.primary),
                                ),
                                value: controller.checkBox,
                                onChanged: (value) {
                                  controller.changeCheckBox();
                                },
                                side: const BorderSide(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: horizontalPadding * 0.435,
                  top: verticalPadding * 0.135),
              child: Image.asset('images/logo.png'),
            ),
          ]),
        ),
      ),
    );
  }
}
