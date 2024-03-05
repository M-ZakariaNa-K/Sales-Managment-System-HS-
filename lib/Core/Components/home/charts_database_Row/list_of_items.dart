import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_management_system/Core/Components/home/charts_database_Row/costume_listtile.dart';
import 'package:sales_management_system/Core/Components/home/unload_sales_table.dart';
import 'package:sales_management_system/Core/helper/services/home/get_all_sales_value_service.dart';
import 'package:sales_management_system/Core/helper/services/home/get_greatest_branch_value_service.dart';
import 'package:sales_management_system/Core/helper/services/home/get_num_of_branches_Service.dart';
import 'package:sales_management_system/Models/home/get_all_sales_value.dart';
import 'package:sales_management_system/Models/home/get_greatest_branch_value.dart';
import 'package:sales_management_system/Models/home/get_num_of_branchs.dart';

class ListOfItems extends StatelessWidget {
  const ListOfItems({super.key,});
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runAlignment: WrapAlignment.center,
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        //======================================================================================
        FutureBuilder(
          future: AllSalesValuesService(Dio()).getAllSalesValues(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const UnloadedItem(
                width: double.infinity,
                height: 67,
              );
            } else if (snapshot.hasError) {
              print('Error: ${snapshot.error}');
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              List<AllSalesValuesDataModel> data = snapshot.data!;
              return
                  // data.isNotEmpty
                  //     ?
                  CostumeListTile(
                title: "52".tr,
                subtitle: data.isNotEmpty ? data[0].total : "null",
                icon: Icons.insert_chart_outlined_outlined,
              );
              // : Text("no data");
            } else {
              return Center(child: Text('48'.tr));
            }
          },
        ),
        //======================================================================
        FutureBuilder(
            future: GetGreatestBranchValueService(Dio())
                .getGreatestBranchValueService(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const UnloadedItem(
                  width: double.infinity,
                  height: 67,
                );
              } else if (snapshot.hasError) {
                print('Error: ${snapshot.error}');
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (snapshot.hasData) {
                GetGreatestBranchValueDataModel data = snapshot.data!;
                return CostumeListTile(
                  title: "51".tr,
                  subtitle: "${data.branch} / ${data.totalSales}",
                  icon: Icons.area_chart_outlined,
                );
              } else {
                return Center(child: Text('48'.tr));
              }
            }),
        //======================================================================
        FutureBuilder(
            future: GetNumOfBranchsService(Dio()).getNumOfBranchsService(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const UnloadedItem(
                  width: double.infinity,
                  height: 67,
                );
              } else if (snapshot.hasError) {
                print('Error: ${snapshot.error}');
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (snapshot.hasData) {
                GetNumOfBranchsModel data = snapshot.data!;
                return CostumeListTile(
                  title: "50".tr,
                  subtitle: "${data.data}",
                  icon: Icons.list_alt,
                );
              } else {
                return Center(child: Text('51'.tr));
              }
            }),
      ],
    );
  }
}
