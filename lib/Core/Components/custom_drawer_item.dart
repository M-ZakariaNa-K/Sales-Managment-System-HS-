// import 'package:flutter/material.dart';
// import 'package:sales_management_system/Core/Constants/theme.dart';

// class DrawerItem extends StatelessWidget {
//   final String title;
//   final IconData icon;
//   final int index;
//   final int selectedIndex;
//   final Function(int) onItemTapped;
//   final Color selectedColor;

//   const DrawerItem({super.key, 
//     required this.title,
//     required this.icon,
//     required this.index,
//     required this.selectedIndex,
//     required this.onItemTapped,
//     required this.selectedColor,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       decoration: BoxDecoration(
//         color: selectedIndex == index && selectedIndex != 4
//             ? ThemeColors.primary
//             : ThemeColors.secondary,
//       ),
//       child: ListTile(
//         title: FittedBox(
//           fit: BoxFit.scaleDown,
//           child: Text(
//             title,
//             style: TextStyle(
//               color: index == 4
//                   ? ThemeColors.primary
//                   : ThemeColors.secondaryTextColor,
//             ),
//           ),
//         ),
//         tileColor: selectedIndex == index ? selectedColor : Colors.transparent,
//         leading: Icon(
//           icon,
//           color:
//               index == 4 ? ThemeColors.primary : ThemeColors.secondaryTextColor,
//         ),
//         selected: selectedIndex == index,
//         onTap: () => onItemTapped(index),
//       ),
//     );
//   }
// }