import 'package:flutter/material.dart';
import 'package:sales_management_system/Core/Components/home/search&profile_Row/custom_profile_container.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';

// AppBarBuilding function
AppBar? AppBarBuilding(
    BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) {
  return MediaQuery.of(context).size.width <= 900
      ? AppBar(
          backgroundColor: ThemeColors.secondary,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              scaffoldKey.currentState!.openDrawer();
            },
            child: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 10),
              child: CustomProfileContainer(
                textColor: Colors.white,
              ),
            ),
          ],
        )
      : null;
}
