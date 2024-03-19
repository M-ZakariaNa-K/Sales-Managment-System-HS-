// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_management_system/Controllers/auth/loginController.dart';
import 'package:sales_management_system/Controllers/lang/lang_controller.dart';
import 'package:sales_management_system/Core/Components/components.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';

// ignore: must_be_immutable
class DesktopLayoutLoginScreen extends StatelessWidget {
  var userController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  DesktopLayoutLoginScreen(BuildContext context, {super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    final horizontalPadding = mediaQueryData.size.width;

    final verticalPadding =
        mediaQueryData.size.height * 0.7; // Adjust the multiplier as needed

    return Scaffold(
      body: GetBuilder<LoginController>(
        init: LoginController(),
        builder: (LoginController controller) => Scaffold(
          backgroundColor: ThemeColors.secondary,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding * .2),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: Row(children: [
                Form(
                  key: formKey,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: LanguageRadioController().selectedValue
                              ? const Radius.circular(0)
                              : const Radius.circular(20),
                          bottomRight: LanguageRadioController().selectedValue
                              ? const Radius.circular(20)
                              : const Radius.circular(0),
                          topRight: LanguageRadioController().selectedValue
                              ? const Radius.circular(20)
                              : const Radius.circular(0),
                          topLeft: LanguageRadioController().selectedValue
                              ? const Radius.circular(0)
                              : const Radius.circular(20)),
                      color: Colors.white.withOpacity(.9),
                    ),
                    height: verticalPadding > 400 ? verticalPadding : 400,
                    width: horizontalPadding * 0.4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Login to your Account'.tr,
                            style: const TextStyle(
                                color: ThemeColors.primary,
                                fontSize: 25,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: userController,
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
                                Icons.person,
                                color: ThemeColors.primary,
                              ),
                              labelText: 'Username'.tr,
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
                                  controller.changeSecureState();
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          defaultButton(
                              function: () async {
                                if (formKey.currentState!.validate()) {
                                  controller.loginState(
                                      userName: userController.text,
                                      password: passwordController.text);
                                }
                              },
                              label: '25'.tr,
                              context: context),
                          const SizedBox(
                            height: 20,
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: verticalPadding,
                  width: horizontalPadding * 0.2,
                  decoration: const BoxDecoration(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: LanguageRadioController().selectedValue
                            ? const Radius.circular(20)
                            : const Radius.circular(0),
                        bottomLeft: LanguageRadioController().selectedValue
                            ? const Radius.circular(20)
                            : const Radius.circular(0),
                        topRight: LanguageRadioController().selectedValue
                            ? const Radius.circular(0)
                            : const Radius.circular(20),
                        bottomRight: LanguageRadioController().selectedValue
                            ? const Radius.circular(0)
                            : const Radius.circular(20)),
                    child: Image.asset(
                      'images/pic1.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
