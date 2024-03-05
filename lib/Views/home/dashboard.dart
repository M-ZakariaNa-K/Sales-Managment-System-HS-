import 'package:flutter/material.dart';
import 'package:sales_management_system/Core/Components/home/dashhboard/appbar_building.dart';
import 'package:sales_management_system/Core/Components/home/dashhboard/custome_drawer.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';
import 'package:sales_management_system/Views/admins/admins.dart';
import 'package:sales_management_system/Views/home/home.dart';
import 'package:sales_management_system/Views/pills/pills.dart';
import 'package:sales_management_system/Views/reports/report.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DashboardPageState createState() => _DashboardPageState();
}
class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;
  final Color _selectedColor = ThemeColors.primary;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final List<Widget> _pages = [
    const HomePage(),
    const AdminsPage(),
    ReportsPage(),
    ReportsPage(),
  ];
  bool isDisktopDevice = false;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.sizeOf(context).width > 900) {
      isDisktopDevice = true;
    } else {
      isDisktopDevice = false;
    }
    return Scaffold(
      key: scaffoldKey,
      drawer: DrawerWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
        selectedColor: _selectedColor,
      ),
      appBar: AppBarBuilding(context, scaffoldKey),
      body: Row(
        children: [
          // Left Bar
          isDisktopDevice
              ? DrawerWidget(
                  selectedIndex: _selectedIndex,
                  onItemTapped: _onItemTapped,
                  selectedColor: _selectedColor,
                )
              : const SizedBox(),
          // Page Content
          Expanded(
            child:_pages[_selectedIndex],
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
