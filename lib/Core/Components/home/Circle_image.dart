import 'package:flutter/material.dart';

class CircleImageWidget extends StatelessWidget {
  const CircleImageWidget({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(1000)),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(1000)),
          // border: Border.all(color: Colors.black, width: 1),
        ),
        width: 40,
        height: 40,
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
