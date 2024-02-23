// CustomProfileContainer
import 'package:flutter/material.dart';

class CustomProfileContainer extends StatelessWidget {
  const CustomProfileContainer({Key? key, required this.textColor}) : super(key: key);
final Color textColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Add functionality for tapping the profile container if needed
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.transparent, // Change color if needed
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage("images/profile.png"), // Change image path
            ),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "zakaria al nabulsi",
                  style: TextStyle(
                    color: textColor, // Change text color if needed
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "+963 969830277",
                  style: TextStyle(
                    color: textColor, // Change text color if needed
                    fontSize: 9,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
