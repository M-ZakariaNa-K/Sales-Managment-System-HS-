// ignore: file_names
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sales_management_system/Core/Components/home/sales_table&image_sliderRow/image-slider.dart';
import 'package:sales_management_system/Core/Components/home/sales_table&image_sliderRow/sales_table.dart';

class SalesTableImageSliderRow extends StatelessWidget {
   SalesTableImageSliderRow({super.key});

  bool isSlideShown = true;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width <= 1200) {
      isSlideShown = false;
    } else {
      isSlideShown = true;
    }
    return isSlideShown
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding:  EdgeInsets.only(left: 20.0, bottom: 20),
                child: SalesTable(),
              ),
              //===============================================================
              Expanded(
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 2,
                        color: Colors.grey,
                      ),
                    ),
                    child: const ImageSliders()),
              )
            ],
          )
        : const Padding(
            padding:  EdgeInsets.only(bottom: 20),
            child: SalesTable(),
          );
  }
}
