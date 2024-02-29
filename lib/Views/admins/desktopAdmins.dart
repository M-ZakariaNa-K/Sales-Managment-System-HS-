import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:sales_management_system/Controllers/admins/admin_controller.dart';
import 'package:sales_management_system/Core/Components/components.dart';
import 'package:sales_management_system/Core/Components/widget.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';
import 'package:sales_management_system/Views/admins/addAdmins.dart';

class AdminsDisktopLayout extends StatelessWidget {
  bool isAddAdmin = false;
  bool isEditAdmin = false;

  AdminsDisktopLayout(BuildContext context);
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
          color: Colors.white.withOpacity(.8),
        ),
        child: SingleChildScrollView(
          child: GetBuilder<AdminController>(
              init: AdminController(),
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
                            height: verticalPadding * 0.08,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(children: [
                                const Text(
                                  'جدول المستخدمين',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w300),
                                ),
                                const Spacer(),
                                IconButton(
                                  icon:
                                      const Icon(Icons.person_add_alt_rounded),
                                  onPressed: () {
                                    isAddAdmin = true;
                                    isEditAdmin = !isEditAdmin;
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
                                                width: 30,
                                              ),
                                              Container(
                                                width: horizontalPadding *
                                                    0.5 *
                                                    0.15,
                                                child: Text(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    listUserModel!.data
                                                        .users[index].name
                                                        ),
                                              ),
                                              const SizedBox(
                                                width: 30,
                                              ),
                                              Container(
                                                width: horizontalPadding *
                                                    0.5 *
                                                    0.15,
                                                child: const Text(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    "listUserModel!.data.users[index].id.toString()"),
                                              ),
                                              const SizedBox(
                                                width: 30,
                                              ),
                                              Container(
                                                width: horizontalPadding *
                                                    0.5 *
                                                    0.15,
                                                child: Text(
                                                    "listUserModel!.data.users[index].username"),
                                              ),
                                              const Spacer(),
                                              Container(
                                                width: horizontalPadding *
                                                    0.5 *
                                                    0.15,
                                                child: TextButton(
                                                    onPressed: () {
                                                      isAddAdmin = !isAddAdmin;
                                                      controller.update();
                                                    },
                                                    child: const Text('تعديل')),
                                              ),
                                              SizedBox(
                                                width:
                                                    horizontalPadding * .0015,
                                              ),
                                              Container(
                                                child: TextButton(
                                                    onPressed: () {
                                                      showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return AlertDialog(
                                                              title: Column(
                                                                children: [
                                                                  const Text(
                                                                      'هل انت متأكد من إزالة المستخدم'),
                                                                  Text(
                                                                      "listUserModel!.data.users[index].name"),
                                                                ],
                                                              ),
                                                              content: Row(
                                                                  children: [
                                                                    TextButton(
                                                                        onPressed:
                                                                            () {
                                                                          controller
                                                                              .removeUser();
                                                                        },
                                                                        child: const Text(
                                                                            'تأكيد')),
                                                                    TextButton(
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        child: const Text(
                                                                            'تراجع'))
                                                                  ]),
                                                            );
                                                          });
                                                    },
                                                    child: const Text('حذف')),
                                              )
                                            ],
                                          )),
                                      separatorBuilder: (context, index) =>
                                          defaultDivider(),
                                      itemCount:
                                          /*listUserModel!.data.users.length*/ users
                                              .length)
                                  : const Center(
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.person_add,
                                              size: 45,
                                              color: Colors.grey,
                                            ),
                                            Text(
                                              'لم تقم بإضافة مستخدمين بعد',
                                              style: TextStyle(
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
                                    ? const Row(children: [
                                        Text(
                                          'تسجيل مستخدم جديد',
                                          style: TextStyle(
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
                              width: horizontalPadding * .3,
                              height: verticalPadding * .8,
                              duration: const Duration(milliseconds: 300),
                              child: isAddAdmin
                                  ? AddAdminScreen(isUpdate: false)
                                  : const Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              textAlign: TextAlign.center,
                                              locale: Locale('en'),
                                              "لإضافة مستخدم جديد إضغط على الرمز",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Icon(
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
