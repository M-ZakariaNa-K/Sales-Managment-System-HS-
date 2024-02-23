import 'package:flutter/material.dart';
import 'package:sales_management_system/Core/Components/components.dart';
import 'package:sales_management_system/Core/Components/widget.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';
import 'package:sales_management_system/Views/admins/addAdmins.dart';

class AdminsPage extends StatelessWidget {
  const AdminsPage({super.key});

  @override
  Widget build(BuildContext context) {
    users.add(5);
    users.add(5);
    users.add(5);
    users.add(5);
    users.add(5);
    users.add(5);
    users.add(5);

    final MediaQueryData = MediaQuery.of(context);
    final horizontalPadding = MediaQueryData.size.width;
    final verticalPadding = MediaQueryData.size.height;
    return Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 100.0, right: 455),
          child: FloatingActionButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Container(
                            width: horizontalPadding * .3,
                            height: verticalPadding * .7,
                            child: AddAdminScreen()),
                      );
                    });
              },
              backgroundColor: ThemeColors.primary,
              child: Icon(
                Icons.add,
                color: Colors.white,
              )),
        ),
        backgroundColor: ThemeColors.secondary,
        body: Center(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(25)),
            width: horizontalPadding * 0.5,
            height: verticalPadding * 0.8,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: users.isNotEmpty
                  ? ListView.separated(
                      itemBuilder: (context, index) => Container(
                          height: 60,
                          child: Row(
                            children: [
                              CircleAvatar(
                                child: Icon(Icons.person),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text('Admin Name'),
                              SizedBox(
                                width: 20,
                              ),
                              Text('Admin number'),
                              SizedBox(
                                width: 20,
                              ),
                              Text('Last Active'),
                              SizedBox(
                                width: 20,
                              ),
                              Text('Admin birthday'),
                              SizedBox(
                                width: 20,
                              ),
                              Spacer(),
                              TextButton(onPressed: () {}, child: Text('Edit')),
                              SizedBox(
                                width: horizontalPadding * .0015,
                              ),
                              TextButton(
                                  onPressed: () {}, child: Text('Remove'))
                            ],
                          )),
                      separatorBuilder: (context, index) => defaultDivider(),
                      itemCount: users.length)
                  : const Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person_add,
                              size: 45,
                              color: Colors.grey,
                            ),
                            Text(
                              'There is no Admin yet',
                              style:
                                  TextStyle(fontSize: 45, color: Colors.grey),
                            )
                          ]),
                    ),
            ),
          ),
        ));
  }
}
