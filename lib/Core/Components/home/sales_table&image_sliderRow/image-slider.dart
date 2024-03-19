// ignore_for_file: file_names

import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';

class ImageSliders extends StatefulWidget {
  const ImageSliders({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<ImageSliders> {
  @override
  Widget build(BuildContext context) {
    return AnotherCarousel(
      images: const [
        AssetImage(
          "images/Slideimage1.jpg",
        ),
        AssetImage("images/Slideimage3.jpg"),
        AssetImage("images/Slideimage2.jpg"),
      ],
      dotSize: 6,
      indicatorBgPadding: 5.0,
      boxFit: BoxFit.fill,
    );
  }
}
