import 'package:flutter/material.dart';
import 'package:sales_management_system/Core/Components/home/Circle_image.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';

class MobileSalesItem extends StatelessWidget {
  const MobileSalesItem({super.key});
  // final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: ThemeColors.secondary,
          ),
          color: ThemeColors.secondary.withOpacity(.3)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        // 1 //----------------------
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(1000)),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(2000)),
                    border: Border.all(color: ThemeColors.secondary, width: 2),
                  ),
                  width: 40,
                  height: 40,
                  child: const Text(
                    "1",
                    style: TextStyle(
                      color: ThemeColors.secondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ThemeColors.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(20), // Set border radius
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "التفاصيل",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          // 2 //----------------------
          Divider(
            thickness: 1,
            height: 20,
            color: ThemeColors.secondary,
          ),
          // 3 //----------------------
          ListTile(
            leading: CircleImageWidget(
              image: "images/Profile.png",
            ),
            title: Text("اسم الفرع"),
            subtitle: Text("الرقم: 04"),
          ),
          // // 4 //----------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "الإجمالي كتابةً",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 200,
                child: Text(
                  "ثمانية وعشرون مليار وأربعة مائة وثمانية وعشرون مليون وخمسة مائة وثلاثة وسبعون ألف وثلاثة مائة وأربعة وخمسون فاصل أربعة إثنان خمسة",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          // // 5 //----------------------
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "الإجمالي رقماً",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("28428573354.424999"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
