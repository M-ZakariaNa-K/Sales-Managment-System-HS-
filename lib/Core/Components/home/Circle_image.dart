import 'package:flutter/material.dart';

class CircleImageWidget extends StatelessWidget {
  const CircleImageWidget({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(100)),
      child: Container(
        width: 30,
        height: 30,
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
