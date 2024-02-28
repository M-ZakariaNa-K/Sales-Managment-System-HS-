import 'package:flutter/material.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final int index;
  final int selectedIndex;
  final Function(int) onItemTapped;
  final Color selectedColor;

  const DrawerItem({
    required this.title,
    required this.icon,
    required this.index,
    required this.selectedIndex,
    required this.onItemTapped,
    required this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300), // Duration of the animation
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: selectedIndex == index && selectedIndex != 4
              ? ThemeColors.primary
              : ThemeColors.secondary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
        child: ListTile(
          title: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              title,
              style: TextStyle(
                color: index == 4
                    ? ThemeColors.primary
                    : ThemeColors.secondaryTextColor,
              ),
            ),
          ),
          tileColor:
              selectedIndex == index ? selectedColor : Colors.transparent,
          leading: Icon(
            icon,
            color: index == 4
                ? ThemeColors.primary
                : ThemeColors.secondaryTextColor,
          ),
          selected: selectedIndex == index,
        ),
      ),
    );
  }
}
