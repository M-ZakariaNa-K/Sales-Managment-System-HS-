import 'package:flutter/material.dart';
import 'package:sales_management_system/Core/Components/home/charts_database_Row/charts_database_Row.dart';
import 'package:sales_management_system/Core/Components/home/sales_table&image_sliderRow/sales_table&image_sliderRow.dart';
import 'package:sales_management_system/Core/Components/home/search&profile_Row/search&profile_Row.dart';

class DisktopLayout extends StatefulWidget {
  const DisktopLayout({super.key});

  @override
  State<DisktopLayout> createState() => _DisktopLayoutState();
}

class _DisktopLayoutState extends State<DisktopLayout> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              // 1 //==========================================================================
              const SearchProfileRow(),
              // 2 //==========================================================================
              const ChartsDatabaseRow(),
              // 3 //=========================Sales Table========================================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: SalesTableImageSliderRow(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
