// ignore: file_names
import 'package:flutter/material.dart';
import 'package:sales_management_system/Core/Components/home/search&profile_Row/custom_profile_container.dart';
import 'package:sales_management_system/Core/Components/home/search&profile_Row/search_bar.dart';

class SearchProfileRow extends StatelessWidget {
  const SearchProfileRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: SearchBarWidget()),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: CustomProfileContainer(
            textColor: Colors.black,
          ),
        ),
      ],
    );
  }
}
