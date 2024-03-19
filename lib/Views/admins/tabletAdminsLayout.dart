import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_management_system/Controllers/admins/admin_controller.dart';
import 'package:sales_management_system/Core/Components/components.dart';
import 'package:sales_management_system/Core/Components/sharedConstant.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';
import 'package:sales_management_system/Views/admins/addAdmins.dart';

class AdminsTabletLayout extends StatefulWidget {
  const AdminsTabletLayout(BuildContext context, {super.key});

  @override
  State<AdminsTabletLayout> createState() => _AdminsTabletLayoutState();
}

class _AdminsTabletLayoutState extends State<AdminsTabletLayout>
    with WidgetsBindingObserver {
  bool isAddAdmin = false;
  int userIndex = 0;

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final MediaQueryData = MediaQuery.of(context);
    final horizontalPadding = MediaQueryData.size.width;
    final verticalPadding = MediaQueryData.size.height;

    return Scaffold(
      backgroundColor: ThemeColors.secondary,
      body: GetBuilder<AdminController>(
          init: AdminController(),
          builder: (AdminController controller) => Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25))),
                          width: horizontalPadding * 0.8,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(children: [
                              Text(
                                '7'.tr,
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w300),
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
                                                  icon: const Icon(
                                                      Icons.arrow_back)),
                                              const Spacer(),
                                              Text(
                                                "8".tr,
                                                style: const TextStyle(
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                          content: SizedBox(
                                              width: horizontalPadding * .7,
                                              height: verticalPadding * .8,
                                              child: AddAdminScreen(
                                                  isUpdate: false)),
                                        );
                                      });
                                },
                              ),
                            ]),
                          ),
                        ),
                        Container(
                          width: horizontalPadding * 0.8,
                          height: verticalPadding * 0.04,
                          color: Colors.white.withOpacity(0.8),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 140,
                                ),
                                SizedBox(
                                  width: horizontalPadding * 0.5 * 0.15,
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    'name'.tr,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  width: 140,
                                ),
                                SizedBox(
                                  child: Text(
                                    "Username".tr,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const Spacer()
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.8),
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(25),
                                  bottomRight: Radius.circular(25))),
                          width: horizontalPadding * 0.8,
                          height: verticalPadding * 0.8,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: isDataLoading
                                ? const Center(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CircularProgressIndicator(
                                            color: ThemeColors.primary,
                                          )
                                        ]),
                                  )
                                : isLoadingFaild
                                    ? Center(
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                children: [
                                                  const Text(
                                                      "Unavailable Data"),
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        controller
                                                            .getUserList();
                                                      },
                                                      child: const Text(
                                                          "Try Again")),
                                                ],
                                              )
                                            ]),
                                      )
                                    : listUserModel!.data.users.isNotEmpty
                                        ? ListView.separated(
                                            itemBuilder: (context, index) =>
                                                SizedBox(
                                                    height: 60,
                                                    child: Row(
                                                      children: [
                                                        const CircleAvatar(
                                                          child: Icon(
                                                              Icons.person),
                                                        ),
                                                        const SizedBox(
                                                          width: 20,
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              horizontalPadding *
                                                                  0.22,
                                                          child: Text(
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              listUserModel!
                                                                  .data
                                                                  .users[index]
                                                                  .name),
                                                        ),
                                                        const Spacer(),
                                                        SizedBox(
                                                          width:
                                                              horizontalPadding *
                                                                  0.22,
                                                          child: Text(
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              listUserModel!
                                                                  .data
                                                                  .users[index]
                                                                  .username),
                                                        ),
                                                        const Spacer(),
                                                        TextButton(
                                                            onPressed:
                                                                () async {
                                                              await controller
                                                                  .getUserData(
                                                                      id: listUserModel!
                                                                          .data
                                                                          .users[
                                                                              index]
                                                                          .id);
                                                              // ignore: use_build_context_synchronously
                                                              showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return AlertDialog(
                                                                      title: Text(
                                                                          "12".tr),
                                                                      content: SizedBox(
                                                                          width: horizontalPadding * .7,
                                                                          height: verticalPadding * .8,
                                                                          child: AddAdminScreen(
                                                                            isUpdate:
                                                                                true,
                                                                            userName:
                                                                                userInfoModel!.data.username,
                                                                            name:
                                                                                userInfoModel!.data.name,
                                                                            password:
                                                                                userInfoModel!.data.password,
                                                                            id: userInfoModel!.data.id,
                                                                            permissions:
                                                                                userInfoModel!.data.permissions,
                                                                          )),
                                                                    );
                                                                  });
                                                            },
                                                            child:
                                                                Text('10'.tr)),
                                                        SizedBox(
                                                          width:
                                                              horizontalPadding *
                                                                  .0015,
                                                        ),
                                                        TextButton(
                                                            onPressed: () {
                                                              showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return AlertDialog(
                                                                      title:
                                                                          Column(
                                                                        children: [
                                                                          Text('18'
                                                                              .tr),
                                                                          Text(listUserModel!
                                                                              .data
                                                                              .users[index]
                                                                              .name),
                                                                        ],
                                                                      ),
                                                                      content: Row(
                                                                          children: [
                                                                            TextButton(
                                                                                onPressed: () {
                                                                                  controller.removeUser(id: listUserModel!.data.users[index].id);
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: Text('17'.tr)),
                                                                            TextButton(
                                                                                onPressed: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: Text('19'.tr))
                                                                          ]),
                                                                    );
                                                                  });
                                                            },
                                                            child:
                                                                Text('30'.tr))
                                                      ],
                                                    )),
                                            separatorBuilder:
                                                (context, index) =>
                                                    defaultDivider(),
                                            itemCount:
                                                listUserModel!.data.UsersCount)
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
                                                        fontSize: 25,
                                                        color: Colors.grey),
                                                  )
                                                ]),
                                          ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
    );
  }
}
