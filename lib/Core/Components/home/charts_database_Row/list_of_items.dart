import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sales_management_system/Core/Components/home/charts_database_Row/costume_listtile.dart';
import 'package:sales_management_system/Core/Components/home/charts_database_Row/total_database.dart';
import 'package:sales_management_system/Core/Components/home/unload_sales_table.dart';
import 'package:sales_management_system/Core/helper/services/home/get_all_sales_value_service.dart';
import 'package:sales_management_system/Core/helper/services/home/get_greatest_branch_value_service.dart';
import 'package:sales_management_system/Core/helper/services/home/get_num_of_branches_Service.dart';
import 'package:sales_management_system/Core/helper/shared/shared.dart';
import 'package:sales_management_system/Models/home/get_all_sales_value.dart';
import 'package:sales_management_system/Models/home/get_greatest_branch_value.dart';
import 'package:sales_management_system/Models/home/get_num_of_branchs.dart';

class ListOfItems extends StatelessWidget {
  const ListOfItems({super.key, required this.textColor});
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Wrap(
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
                List<AllSalesValuesDataModel>? data = snapshot.data;
                return CostumeListTile(
                  title: "إجمالي المبيعات",
                  subtitle: data![0].total,
                  icon: Icons.insert_chart_outlined_outlined,
                );
              } else {
                return const Center(child: Text('No data available'));
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
                    title: "الفرع الأكثر بيعاً",
                    subtitle: "${data.branch} / ${data.totalSales}",
                    icon: Icons.area_chart_outlined,
                  );
                } else {
                  return const Center(child: Text('No data available'));
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
                    title: "إجمالي الفروع",
                    subtitle: "${data.data}",
                    icon: Icons.list_alt,
                  );
                } else {
                  return const Center(child: Text('No data available'));
                }
              }),
        ],
      ),
    );
  }
}
