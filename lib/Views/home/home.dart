import 'package:flutter/material.dart';
import 'package:sales_management_system/Core/Components/home_body.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ThemeColors.secondary,
      body: Padding(padding: EdgeInsets.all(10), child: HomeViewBody()),
    );
  }
}
