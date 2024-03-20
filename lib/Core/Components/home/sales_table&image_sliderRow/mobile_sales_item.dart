import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_management_system/Core/Components/home/Circle_image.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';
import 'package:sales_management_system/Views/home/dashboard.dart';

class MobileSalesItem extends StatelessWidget {
  const MobileSalesItem({super.key, required this.branch, required this.index});
  final dynamic branch;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: ThemeColors.secondary,
          ),
          color: ThemeColors.secondary.withOpacity(.3)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        // 1 //----------------------
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(1000)),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(2000)),
                    border: Border.all(color: ThemeColors.secondary, width: 2),
                  ),
                  width: 40,
                  height: 40,
                  child: Text(
                    "${index + 1}",
                    style: const TextStyle(
                      color: ThemeColors.secondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ThemeColors.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(20), // Set border radius
                  ),
                ),
                onPressed: () {
           
                  publicisPillsPage = true;
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DashboardPage(
                        guid: branch.guid,
                        total: branch.totalSales,
                        branchName: branch.branch,
                      ),
                      // PillsPage(
                      //   total: branch.totalSales,
                      //   guid: branch.guid,
                      //   branchName: branch.branch,
                      // ),
                    ),
                  );
                },
                child: Text(
                  "44".tr,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          // 2 //----------------------
          const Divider(
            thickness: 1,
            height: 20,
            color: ThemeColors.secondary,
          ),
          // 3 //----------------------
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const CircleImageWidget(
              image: "images/Profile.png",
            ),
            title: Text(branch.branch!),
            subtitle: Text("${branch.number}"),
          ),
          // // 4 //----------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "37".tr,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 200,
                child: Text(
                  branch.spelledTotal!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          // // 5 //----------------------
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "38".tr,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("${branch.totalSales}"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
