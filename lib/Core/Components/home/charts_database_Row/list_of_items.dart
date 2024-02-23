import 'package:flutter/material.dart';
import 'package:sales_management_system/Core/Components/home/charts_database_Row/costume_listtile.dart';

class ListOfItems extends StatelessWidget {
  const ListOfItems({super.key, required this.textColor});
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Wrap(
        runAlignment: WrapAlignment.center,
        spacing: 10,
        runSpacing: 10,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          CostumeListTile(
            title: "23",
            subtitle: "admin",
            icon: Icons.insert_chart_outlined_outlined,
          ),
          CostumeListTile(
            title: "100.000",
            subtitle: "Sales",
            icon: Icons.area_chart_outlined,
          ),
          CostumeListTile(
            title: "3233",
            subtitle: "Mohajeren",
            icon: Icons.format_list_numbered_rounded,
          ),
        ],
      ),
    );
  }
}
