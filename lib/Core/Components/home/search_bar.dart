import 'package:flutter/material.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.2),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: TextField(
          decoration: InputDecoration(
              hintText: 'Search...',
              hintStyle: const TextStyle(
                color: Color(0xffAFAFAF),
              ),
              contentPadding: const EdgeInsets.all(8.0),
//Start Border of TextFild
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Color(
                        0xffAFAFAF)), // Set your desired border color here
                borderRadius: BorderRadius.circular(5.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Color.fromRGBO(
                        200, 29, 36, 1)), // Set your desired border color here
                borderRadius: BorderRadius.circular(5.0),
              ),
//End Border of TextFild
              prefixIcon: Container(
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  "images/search.png",
                  color: const Color(0xffAFAFAF),
                  width: 30,
                ),
              )),
        ),
      ),
    );
  }
}
