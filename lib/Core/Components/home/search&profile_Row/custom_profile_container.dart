// CustomProfileContainer
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_management_system/Core/Components/home/unload_sales_table.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';
import 'package:sales_management_system/Core/helper/services/home/get_profile_service.dart';
import 'package:sales_management_system/Models/home/get_profile_model.dart';

class CustomProfileContainer extends StatelessWidget {
  const CustomProfileContainer({Key? key, required this.textColor})
      : super(key: key);
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: GetprofileService(Dio()).getprofileService(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.0),
              child: UnloadedItem(
                width: 170,
                height: 50,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Something went wrong. Please try again...'.tr),
            );
          } else if (snapshot.hasData) {
            GetProfileDataModel data = snapshot.data!;
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: ThemeColors.secondary.withOpacity(.4),
                  border: Border.all(color: ThemeColors.secondary, width: 2),
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        AssetImage("images/profile.png"), // Change image path
                  ),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.name,
                        style: TextStyle(
                          color: textColor, // Change text color if needed
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        data.username,
                        style: TextStyle(
                          color: textColor, // Change text color if needed
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return Text("41".tr);
          }
        });
  }
}
