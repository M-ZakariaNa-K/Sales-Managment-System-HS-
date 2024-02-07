import 'package:flutter/material.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    PageOne(),
    PageTwo(),
    PageThree(),
    PageFour(),
    PageFive(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Left Bar Example'),
      ),
      body: Row(
        children: [
          // Left Bar
          Container(
            width: 200,
            color: ThemeColors.primary,
            child: ListView(
              children: [
                ListTile(
                  title: const Text('Dashboard'),
                  leading: Icon(Icons.home_work_outlined),
                  selected: _selectedIndex == 0,
                  onTap: () => _onItemTapped(0),
                ),
                ListTile(
                  title: const Text('Admins'),
                  leading: Image.asset(
                    "assets/images/administrator.png",
                    width: 20,
                    height: 20,
                    color: ThemeColors.secondary,
                  ),
                  selected: _selectedIndex == 1,
                  onTap: () => _onItemTapped(1),
                ),
                ListTile(
                  title: const Text('Report'),
                  leading: Icon(Icons.home_work_outlined),
                  selected: _selectedIndex == 2,
                  onTap: () => _onItemTapped(2),
                ),
                ListTile(
                  title: const Text('Settings'),
                  leading: Icon(Icons.home_work_outlined),
                  selected: _selectedIndex == 3,
                  onTap: () => _onItemTapped(2),
                ),
                ListTile(
                  title: const Text('Log out'),
                  leading: Icon(Icons.home_work_outlined),
                  selected: _selectedIndex == 4,
                  onTap: () => _onItemTapped(2),
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
