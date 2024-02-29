import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_management_system/Controllers/admins/admin_controller.dart';
import 'package:sales_management_system/Core/Components/components.dart';
import 'package:sales_management_system/Core/Components/widget.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';
import 'package:sales_management_system/Views/admins/addAdmins.dart';

class AdminsMobileLayout extends StatelessWidget {
  const AdminsMobileLayout(BuildContext context, {super.key});
  @override
  Widget build(BuildContext context) {
    final MediaQueryData = MediaQuery.of(context);
    final horizontalPadding = MediaQueryData.size.width;
    final verticalPadding = MediaQueryData.size.height;
    return Scaffold(
      backgroundColor: ThemeColors.secondary,
      body: GetBuilder<AdminController>(
          init: AdminController(),
          builder: (AdminController controller) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25))),
                      width: horizontalPadding * 0.5,
                      height: verticalPadding * 0.08,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(children: [
                           Text(
                            '7'.tr,
                            style:const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w300),
                          ),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(Icons.person_add_alt_rounded),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Row(
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: Icon(Icons.arrow_back)),
                                          Spacer(),
                                          Text("8".tr),
                                        ],
                                      ),
                                      content: SizedBox(
                                          width: horizontalPadding * .7,
                                          height: verticalPadding * .8,
                                          child:
                                              AddAdminScreen(isUpdate: false)),
                                    );
                                  });
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
                        padding: const EdgeInsets.all(10.0),
                        child: users.isNotEmpty
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
                                        Text('9'.tr),
                                        const Spacer(),
                                        TextButton(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          "12".tr),
                                                      content: SizedBox(
                                                          width:
                                                              horizontalPadding *
                                                                  .7,
                                                          height:
                                                              verticalPadding *
                                                                  .8,
                                                          child: AddAdminScreen(
                                                            isUpdate: true,
                                                          )),
                                                    );
                                                  });
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
                                                      title:  Column(
                                                        children: [
                                                          Text(
                                                              '18'.tr),
                                                          Text('9'.tr),
                                                        ],
                                                      ),
                                                      content: Row(children: [
                                                        TextButton(
                                                            onPressed: () {},
                                                            child:  Text(
                                                                '17'.tr)),
                                                        TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child:  Text(
                                                                '19'.tr))
                                                      ]),
                                                    );
                                                  });
                                            },
                                            child:  Text('30'.tr))
                                      ],
                                    )),
                                separatorBuilder: (context, index) =>
                                    defaultDivider(),
                                itemCount: users.length)
                            : Center(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.person_add,
                                        size: 45,
                                        color: Colors.grey,
                                      ),
                                      Text(
                                        '32'.tr,
                                        style:const  TextStyle(
                                            fontSize: 45, color: Colors.grey),
                                      )
                                    ]),
                              ),
                      ),
                    ),
                  ],
                ),
              )),
    );
  }
}
