import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sales_management_system/Core/Components/home/sales_table&image_sliderRow/mobile_sales_item.dart';
import 'package:sales_management_system/Core/Components/home/unload_sales_table.dart';
import 'package:sales_management_system/Core/helper/services/home/get_all_branchesServices.dart';
import 'package:sales_management_system/Models/home/get_all_branches.dart';

class MobileSalesItemsList extends StatelessWidget {
  const MobileSalesItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetAllBranchesService(Dio()).getAllBranchesService(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While data is loading, return a loading indicator or any other placeholder widget
          return UnloadedItem(
            width: MediaQuery.of(context).size.width * 0.4,
            height: 250,
          );
        } else if (snapshot.hasError) {
          // If there is an error, display an error message
          return Text('Error: ${snapshot.error}');
        } else {
          // If data is successfully fetched, build the list of MobileSalesItem widgets
          List<BranchDataModel> data = snapshot.data!;
          return ListView.builder(
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: MobileSalesItem(branch: data[index], index: index),
              );
            },
          );
        }
      },
    );
  }
}


//NOTE:  Here where u should call (MobileSalesItems)  and give it the (data list which come frome API)
// and the index