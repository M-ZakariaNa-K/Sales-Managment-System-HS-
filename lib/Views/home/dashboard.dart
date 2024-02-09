import 'package:flutter/material.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';
import 'package:sales_management_system/Views/home/home.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;
  final Color _selectedColor = ThemeColors.primary;
  final List<Widget> _pages = [
    const HomePage(),
    PageTwo(),
    PageThree(),
    PageFour(),
    PageFive(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Left Bar
          Container(
            width: 300,
            color: ThemeColors.secondary,
            child: ListView(
              children: [
                Image.asset('images/Logo2.png'),
                //=================================2=======================
                ListTile(
                  title: Text(
                    'Home page',
                    style: TextStyle(
                      color: _selectedIndex == 0
                          ? ThemeColors.primary
                          : ThemeColors.secondaryTextColor,
                    ),
                  ),
                  tileColor:
                      _selectedIndex == 0 ? _selectedColor : Colors.transparent,
                  leading: Icon(
                    Icons.home_work_outlined,
                    color: _selectedIndex == 0
                        ? ThemeColors.primary
                        : ThemeColors.secondaryTextColor,
                  ),
                  selected: _selectedIndex == 0,
                  onTap: () => _onItemTapped(0),
                ),
                //=================================3=======================
                ListTile(
                  title: Text(
                    'Admins',
                    style: TextStyle(
                      color: _selectedIndex == 1
                          ? ThemeColors.primary
                          : ThemeColors.secondaryTextColor,
                    ),
                  ),
                  tileColor:
                      _selectedIndex == 1 ? _selectedColor : Colors.transparent,
                  leading: Image.asset(
                    "images/administrator.png",
                    width: 25,
                    height: 25,
                    color: _selectedIndex == 1
                        ? ThemeColors.primary
                        : ThemeColors.secondaryTextColor,
                  ),
                  selected: _selectedIndex == 1,
                  onTap: () => _onItemTapped(1),
                ),
                //========================4=====================
                ListTile(
                  title: Text(
                    'Report',
                    style: TextStyle(
                      color: _selectedIndex == 2
                          ? ThemeColors.primary
                          : ThemeColors.secondaryTextColor,
                    ),
                  ),
                  tileColor:
                      _selectedIndex == 2 ? _selectedColor : Colors.transparent,
                  leading: Icon(
                    Icons.picture_as_pdf,
                    color: _selectedIndex == 2
                        ? ThemeColors.primary
                        : ThemeColors.secondaryTextColor,
                  ),
                  selected: _selectedIndex == 2,
                  selectedTileColor: _selectedColor,
                  onTap: () => _onItemTapped(2),
                ),
                //========================5=====================
                ListTile(
                  title: Text(
                    'Settings',
                    style: TextStyle(
                      color: _selectedIndex == 3
                          ? ThemeColors.primary
                          : ThemeColors.secondaryTextColor,
                    ),
                  ),
                  tileColor:
                      _selectedIndex == 3 ? _selectedColor : Colors.transparent,
                  leading: Icon(
                    Icons.home_work_outlined,
                    color: _selectedIndex == 3
                        ? ThemeColors.primary
                        : ThemeColors.secondaryTextColor,
                  ),
                  selected: _selectedIndex == 3,
                  onTap: () => _onItemTapped(3),
                ),
                //========================6=====================
                ListTile(
                  title: Text(
                    'Log out',
                    style: TextStyle(
                      color: _selectedIndex == 4
                          ? ThemeColors.primary
                          : ThemeColors.secondaryTextColor,
                    ),
                  ),
                  tileColor:
                      _selectedIndex == 2 ? _selectedColor : Colors.transparent,
                  leading: Icon(
                    Icons.login_rounded,
                    color: _selectedIndex == 4
                        ? ThemeColors.primary
                        : ThemeColors.secondaryTextColor,
                  ),
                  selected: _selectedIndex == 4,
                  selectedColor: _selectedColor,
                  onTap: () => _onItemTapped(4),
                )
              ],
            ),
          ),
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
    return Center(
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
