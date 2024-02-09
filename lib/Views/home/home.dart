import 'package:flutter/material.dart';
import 'package:sales_management_system/Core/Components/home/Circle_image.dart';
import 'package:sales_management_system/Core/Components/home/search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
      ),
      child: Scaffold(
        body: Column(
          children: [
            //=============1===============
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Expanded(child: SearchBarWidget()),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: const Row(children: [
                    CircleImageWidget(
                      image: "assets/images/Logo.png",
                    ),
                    CircleImageWidget(
                      image: "assets/images/settings.png",
                    ),
                    CircleImageWidget(
                      image: "assets/images/Logo2.png",
                    ),
                    Column(
                      children: [
                        Text("zakaria al nabulsi"),
                        //NOTE(ZAK): the number from login
                        Text("+963 969830277"),
                      ],
                    )
                  ]),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
