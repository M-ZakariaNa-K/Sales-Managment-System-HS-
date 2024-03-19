// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AdaptivLayout extends StatelessWidget {
  const AdaptivLayout({
    Key? key,
    required this.mobileLayout,
    required this.tabletLayout,
    required this.disktopLayout,
  }) : super(key: key);
  final WidgetBuilder mobileLayout, tabletLayout, disktopLayout;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      //constraints
      //بتعطيني ال عرض تبع الاب وليس عرض السكرين
      if (MediaQuery.of(context).size.width < 600) {
        return mobileLayout(context);
      } else if (MediaQuery.of(context).size.width <= 900) {
        return tabletLayout(context);
      } else {
        return disktopLayout(context);
      }
    });
  }
}
