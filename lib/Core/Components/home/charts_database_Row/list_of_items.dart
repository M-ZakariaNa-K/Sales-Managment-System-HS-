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
  const ListOfItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runAlignment: WrapAlignment.center,
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        FutureBuilder<List<AllSalesValuesDataModel>>(
          future: AllSalesValuesService(Dio()).getAllSalesValues(),
          builder: (context, snapshot) {
            return _buildListItem(
              context,
              snapshot,
              title: "52".tr,
              icon: Icons.insert_chart_outlined_outlined,
              subtitle: snapshot.hasData ? snapshot.data![0].total : "null",
            );
          },
        ),
        FutureBuilder<GetGreatestBranchValueDataModel>(
          future: GetGreatestBranchValueService(Dio())
              .getGreatestBranchValueService(),
          builder: (context, snapshot) {
            return _buildListItem(
              context, snapshot,
              title:
                  "${"51".tr} : ${snapshot.hasData ? snapshot.data!.branch : ""}",
              // "51".tr,
              icon: Icons.area_chart_outlined,
              subtitle: snapshot.hasData ? snapshot.data!.totalSales : "",
            );
          },
        ),
        FutureBuilder<GetNumOfBranchsModel>(
          future: GetNumOfBranchsService(Dio()).getNumOfBranchsService(),
          builder: (context, snapshot) {
            return _buildListItem(
              context,
              snapshot,
              title: "50".tr,
              icon: Icons.list_alt,
              subtitle: snapshot.hasData ? "${snapshot.data!.data}" : "",
            );
          },
        ),
      ],
    );
  }

  Widget _buildListItem<T>(
    BuildContext context,
    AsyncSnapshot<T> snapshot, {
    required String title,
    required IconData icon,
    required String subtitle,
  }) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const UnloadedItem(
        width: double.infinity,
        height: 67,
      );
    } else if (snapshot.hasError) {
      return const Center(
        child: Text('Something went wrong. Please try again...'),
      );
    } else {
      // ignore: missing_required_param
      return CostumeListTile(
        title: title,
        subtitle: subtitle,
        icon: icon,
      );
    }
  }
}
