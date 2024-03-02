import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_management_system/Controllers/admins/admin_controller.dart';
import 'package:sales_management_system/Core/Components/components.dart';
import 'package:sales_management_system/Core/Components/widget.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';
import 'package:sales_management_system/Views/admins/addAdmins.dart';

class AdminsTabletLayout extends StatelessWidget {
  bool isAddAdmin = false;

  AdminsTabletLayout(BuildContext context, {super.key});
  @override
  Widget build(BuildContext context) {
    String addAdminText = '';

    // ignore: non_constant_identifier_names
    final MediaQueryData = MediaQuery.of(context);
    final horizontalPadding = MediaQueryData.size.width;
    final verticalPadding = MediaQueryData.size.height;
    return Scaffold(
      backgroundColor: ThemeColors.secondary,
      body: GetBuilder<AdminController>(
          init: AdminController(),
          builder: (AdminController controller) => Padding(
                padding: EdgeInsets.only(
                    top: verticalPadding * .05, right: horizontalPadding * 0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              color: ThemeColors.primary,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25))),
                          width: horizontalPadding * 0.5,
                          height: verticalPadding * 0.08,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(children: [
                              Text(
                                '7'.tr,
                                style: const TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w300),
                              ),
                              const Spacer(),
                              IconButton(
                                icon: const Icon(Icons.person_add_alt_rounded),
                                onPressed: () {
                                  addAdminText = '8'.tr;
                                  isAddAdmin = !isAddAdmin;
                                  controller.update();
                                },
                              ),
                            ]),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.8),
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(25),
                                  bottomRight: Radius.circular(25))),
                          width: horizontalPadding * 0.5,
                          height: verticalPadding * 0.8,
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: listUserModel!.data.users.isNotEmpty
                                ? ListView.separated(
                                    itemBuilder: (context, index) => SizedBox(
                                        height: 60,
                                        child: Row(
                                          children: [
                                            const CircleAvatar(
                                              child: Icon(Icons.person),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Text(listUserModel!
                                                .data.users[index].username),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            const Text('Admin number'),
                                            const Spacer(),
                                            TextButton(
                                                onPressed: () {
                                                  isAddAdmin = !isAddAdmin;
                                                  addAdminText = '12'.tr;
                                                  controller.update();
                                                },
                                                child: Text('10'.tr)),
                                            SizedBox(
                                              width: horizontalPadding * .0015,
                                            ),
                                            TextButton(
                                                onPressed: () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          title: Column(
                                                            children: [
                                                              Text('18'.tr),
                                                              Text(
                                                                  listUserModel!
                                                                      .data
                                                                      .users[
                                                                          index]
                                                                      .name),
                                                            ],
                                                          ),
                                                          content:
                                                              Row(children: [
                                                            TextButton(
                                                                onPressed: () {
                                                                  controller.removeUser(
                                                                      id: listUserModel!
                                                                          .data
                                                                          .users[
                                                                              index]
                                                                          .id);
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Text(
                                                                    '17'.tr)),
                                                            TextButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Text(
                                                                    '19'.tr))
                                                          ]),
                                                        );
                                                      });
                                                },
                                                child: Text('30'.tr))
                                          ],
                                        )),
                                    separatorBuilder: (context, index) =>
                                        defaultDivider(),
                                    itemCount: listUserModel!.data.UsersCount)
                                : Center(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.person_add,
                                            size: 45,
                                            color: Colors.grey,
                                          ),
                                          Text(
                                            '32'.tr,
                                            style: const TextStyle(
                                                fontSize: 45,
                                                color: Colors.grey),
                                          )
                                        ]),
                                  ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        AnimatedContainer(
                          curve: Curves.easeOutBack,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(25),
                                  topLeft: Radius.circular(25))),
                          width: horizontalPadding * .4,
                          height: verticalPadding * .08,
                          duration: const Duration(milliseconds: 300),
                          child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: isAddAdmin
                                  ? Row(children: [
                                      Text(
                                        addAdminText,
                                        style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ])
                                  : const SizedBox()),
                        ),
                        AnimatedContainer(
                            curve: Curves.easeOutBack,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(25),
                                    bottomLeft: Radius.circular(25))),
                            width: horizontalPadding * .4,
                            height: verticalPadding * .8,
                            duration: const Duration(milliseconds: 300),
                            child: isAddAdmin
                                ? AddAdminScreen(
                                    isUpdate: false,
                                  )
                                : Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.person_add_alt_1_rounded,
                                          color: Colors.grey,
                                        ),
                                        Expanded(
                                          child: Text(
                                            locale: const Locale('ar'),
                                            "14".tr,
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                      ],
                    )
                  ],
                ),
              )),
    );
  }
}
