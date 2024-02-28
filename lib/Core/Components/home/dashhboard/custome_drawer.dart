import 'package:flutter/material.dart';
import 'package:sales_management_system/Core/Components/home/dashhboard/custome_drawer_item.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';

class DrawerWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  final Color selectedColor;

  const DrawerWidget({
    required this.selectedIndex,
    required this.onItemTapped,
    required this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      color: ThemeColors.secondary,
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            width: 170,
            height: 170,
            child: Image.asset(
              'images/Logo2.png',
              width: 50,
            ),
          ),
          DrawerItem(
            title: 'الصفحة الرئيسية',
            icon: Icons.home_work_outlined,
            index: 0,
            selectedIndex: selectedIndex,
            onItemTapped: onItemTapped,
            selectedColor: selectedColor,
          ),
          DrawerItem(
            title: 'المستخدمين',
            icon: Icons.person_2_outlined,
            index: 1,
            selectedIndex: selectedIndex,
            onItemTapped: onItemTapped,
            selectedColor: selectedColor,
          ),
          DrawerItem(
            title: 'التقارير',
            icon: Icons.picture_as_pdf_outlined,
            index: 2,
            selectedIndex: selectedIndex,
            onItemTapped: onItemTapped,
            selectedColor: selectedColor,
          ),
          DrawerItem(
            title: 'تسجيل الخروج',
            icon: Icons.logout,
            index: 4,
            selectedIndex: selectedIndex,
            onItemTapped: (value) {},
            selectedColor: selectedColor,
          ),
        ],
      ),
    );
  }
}
