import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:sales_management_system/Controllers/admins/admin_controller.dart';
import 'package:sales_management_system/Core/Components/components.dart';
import 'package:sales_management_system/Core/Components/widget.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';
import 'package:sales_management_system/Views/admins/addAdmins.dart';

class AdminsDisktopLayout extends StatefulWidget {
  AdminsDisktopLayout(BuildContext context, {super.key});

  @override
  State<AdminsDisktopLayout> createState() => _AdminsDisktopLayoutState();
}

class _AdminsDisktopLayoutState extends State<AdminsDisktopLayout> {
  bool isAddAdmin = false;
  int userIndex = 0;
  bool isEditAdmin = false;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData = MediaQuery.of(context);
    final horizontalPadding = MediaQueryData.size.width;
    final verticalPadding = MediaQueryData.size.height;
    return Scaffold(
      backgroundColor: ThemeColors.secondary,
      body: Container(
        margin: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: SingleChildScrollView(
          child: GetBuilder<AdminController>(
              init: AdminController()..getUserList(),
              builder: (AdminController controller) => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25))),
                            width: horizontalPadding * 0.5,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(children: [
                                Text(
                                  '7'.tr,
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w300),
                                ),
                                const Spacer(),
                                IconButton(
                                    icon: const Icon(
                                        Icons.person_add_alt_rounded),
                                    onPressed: () {
                                      if (isDataLoading) {
                                        return null;
                                      }
                                      isAddAdmin = true;
                                      isEditAdmin = false;
                                      controller.update();
                                    }),
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
                                                    Text("Unavailable Data"),
                                                    ElevatedButton(
                                                        onPressed: () {
                                                          controller
                                                              .getUserList();
                                                          controller.update();
                                                        },
                                                        child:
                                                            Text("Try Again")),
                                                  ],
                                                )
                                              ]),
                                        )
                                      : listUserModel!.data.users.isNotEmpty
                                          ? ListView.separated(
                                              itemBuilder: (context, index) {
                                                userIndex = index;
                                                return SizedBox(
                                                    height: 60,
                                                    child: Row(
                                                      children: [
                                                        const CircleAvatar(
                                                          child: Icon(
                                                              Icons.person),
                                                        ),
                                                        const SizedBox(
                                                          width: 30,
                                                        ),
                                                        Container(
                                                          width:
                                                              horizontalPadding *
                                                                  0.5 *
                                                                  0.15,
                                                          child: Text(
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 1,
                                                              listUserModel!
                                                                  .data
                                                                  .users[index]
                                                                  .name),
                                                        ),
                                                        const SizedBox(
                                                          width: 30,
                                                        ),
                                                        Container(
                                                          width:
                                                              horizontalPadding *
                                                                  0.5 *
                                                                  0.15,
                                                          child: Text(
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              listUserModel!
                                                                  .data
                                                                  .users[index]
                                                                  .id
                                                                  .toString()),
                                                        ),
                                                        const SizedBox(
                                                          width: 30,
                                                        ),
                                                        Container(
                                                          width:
                                                              horizontalPadding *
                                                                  0.5 *
                                                                  0.15,
                                                          child: Text(
                                                              listUserModel!
                                                                  .data
                                                                  .users[index]
                                                                  .username),
                                                        ),
                                                        const Spacer(),
                                                        Container(
                                                          width:
                                                              horizontalPadding *
                                                                  0.5 *
                                                                  0.15,
                                                          child: TextButton(
                                                              onPressed: () {
                                                                isAddAdmin =
                                                                    false;
                                                                isEditAdmin =
                                                                    true;
                                                                controller
                                                                    .update();
                                                              },
                                                              child: Text(
                                                                  '10'.tr)),
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              horizontalPadding *
                                                                  .0015,
                                                        ),
                                                        Container(
                                                          child: TextButton(
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
                                                                            Text('18'.tr),
                                                                            Text(listUserModel!.data.users[index].name),
                                                                          ],
                                                                        ),
                                                                        content:
                                                                            Row(children: [
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
                                                              child: Text(
                                                                  '30'.tr)),
                                                        )
                                                      ],
                                                    ));
                                              },
                                              separatorBuilder:
                                                  (context, index) =>
                                                      defaultDivider(),
                                              itemCount: listUserModel!
                                                  .data.UsersCount)
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
                            width: horizontalPadding * .3,
                            height: verticalPadding * .08,
                            duration: const Duration(milliseconds: 300),
                            child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: isAddAdmin
                                    ? Row(children: [
                                        Text(
                                          '8'.tr,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
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
                              width: horizontalPadding * .3,
                              height: verticalPadding * .8,
                              duration: const Duration(milliseconds: 300),
                              child: isAddAdmin
                                  ? AddAdminScreen(
                                      isUpdate: false,
                                    )
                                  : isEditAdmin
                                      ? AddAdminScreen(
                                          isUpdate: true,
                                          userName: listUserModel!
                                              .data.users[userIndex].username,
                                          name: listUserModel!
                                              .data.users[userIndex].name,
                                        )
                                      : Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  textAlign: TextAlign.center,
                                                  "14".tr,
                                                  style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              const Icon(
                                                Icons.person_add_alt_1_rounded,
                                                color: Colors.grey,
                                              ),
                                            ],
                                          ),
                                        )),
                        ],
                      )
                    ],
                  )),
        ),
      ),
    );
  }
}
