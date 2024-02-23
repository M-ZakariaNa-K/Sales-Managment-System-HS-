import 'package:flutter/material.dart';
import 'package:sales_management_system/Core/Components/home/dashhboard/appbar_building.dart';
import 'package:sales_management_system/Core/Components/home/dashhboard/custome_drawer.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';
import 'package:sales_management_system/Views/home/home.dart';

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
    PageTwo(),
    PageThree(),
    PageFour(),
    PageFive(),
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
              : const Text(""),
          // Page Content
          Expanded(
            child: _pages[_selectedIndex],
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

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Page One Content',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class PageFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Page One Content',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class PageFive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Page One Content',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Page Two Content',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class PageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Page Three Content',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}



/*

LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return _buildDrawerLayout();
          } else {
            return _buildWideLayout();
          }
        },
      ),
    );
  }
  
 */