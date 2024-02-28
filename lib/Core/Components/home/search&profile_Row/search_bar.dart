import 'package:flutter/material.dart';
import 'package:sales_management_system/Core/Components/home/search&profile_Row/search_list_items.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

bool isSearching1 = false;

class _SearchBarWidgetState extends State<SearchBarWidget> {
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: TextField(
              controller: searchController,
              onChanged: _performSearch,
              decoration: InputDecoration(
                hintText: 'ابحث هنا...',
                hintStyle: const TextStyle(
                  color: Color(0xffAFAFAF),
                ),
                contentPadding: const EdgeInsets.all(8.0),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xffAFAFAF),
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(200, 29, 36, 1),
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.search,
                    color: Color(0xffAFAFAF),
                  ),
                ),
              ),
            ),
          ),
          isSearching
              ? SearchListItems(
                  searchController: searchController,
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  void _performSearch(String value) async {
    setState(() {
      isSearching = true;
      isSearching1 = isSearching;
      if (searchController.text.isEmpty) {
        isSearching = false;
      }
    });
  }
}
