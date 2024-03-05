import 'package:flutter/material.dart';
import 'package:sales_management_system/Core/Components/home/charts_database_Row/total_bar_chart.dart';
import 'package:sales_management_system/Core/Components/home/charts_database_Row/total_database.dart';
import 'package:sales_management_system/Core/Components/home/sales_table&image_sliderRow/mobile_sales_items_list.dart';
import 'package:sales_management_system/Core/Components/home/search&profile_Row/search_bar.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: const CustomScrollView(
        slivers: [
          //======1=======
          SliverToBoxAdapter(
            // ignore: missing_required_param
            child: SearchBarWidget(),
          ),
          //======2=======
          SliverToBoxAdapter(
            child: TotalDatabase(),
          ),

          //======3=======
          SliverToBoxAdapter(
            child: TotalBarChart(),
          ),
          //======4=======
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: MobileSalesItemsList(),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}
