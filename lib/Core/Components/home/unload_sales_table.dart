import 'package:flutter/material.dart';

class UnloadedItem extends StatelessWidget {
  const UnloadedItem({super.key, @required this.width, @required this.height});
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xff656565).withOpacity(.5),
        borderRadius: BorderRadius.circular(5),
      ),
      width: width,
      height: height,
    );
  }
}
