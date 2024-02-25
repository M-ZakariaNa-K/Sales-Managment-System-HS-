// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:sales_management_system/Core/helper/services/home/get_all_branchesServices.dart';
// import 'package:sales_management_system/Models/home/get_all_branches.dart';

// class SearchBarWidget extends StatefulWidget {
//   const SearchBarWidget({Key? key}) : super(key: key);

//   @override
//   State<SearchBarWidget> createState() => _SearchBarWidgetState();
// }

// class _SearchBarWidgetState extends State<SearchBarWidget> {
//   TextEditingController _searchController = TextEditingController();
//   List<dynamic> _searchResults = [];
//   List<BranchDataModel> _allBranches = []; // Store all branches data

//   @override
//   void initState() {
//     super.initState();
//     _fetchAllBranches();
//   }

//   // Function to fetch all branches data
//   void _fetchAllBranches() async {
//     try {
//       final response =
//           await GetAllBranchesService(Dio()).getAllBranchesService();
//       if (response != null) {
//         setState(() {
//           _allBranches = response;
//         });
//       }
//     } catch (e) {
//       print('Error fetching branches: $e');
//     }
//   }

//   void _filterBranches(String value) {
//     // Print the search input value and the total number of branches before filtering
//     print('Search value: $value');
//     print('Total branches before filtering: ${_allBranches.length}');

//     setState(() {
//       // Filter the branches based on the search input value
//       _searchResults = _allBranches
//           .where((branch) =>
//               branch.branch!.toLowerCase().contains(value.trim().toLowerCase()))
//           .toList();

//       // Print the filtered branches and the total number of filtered branches
//       print('Filtered branches: $_searchResults');
//       print('Total filtered branches: ${_searchResults.length}');
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
//       child: Column(
//         children: [
//           Container(
//             height: 50,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(30.0),
//             ),
//             child: TextField(
//               onTap: () {
//                 if (_allBranches.isEmpty) {
//                   _fetchAllBranches(); // Fetch branches data when clicked
//                 }
//               },
//               controller: _searchController,
//               onChanged: _filterBranches,
//               decoration: InputDecoration(
//                 hintText: 'Search...',
//                 hintStyle: const TextStyle(
//                   color: Color(0xffAFAFAF),
//                 ),
//                 contentPadding: const EdgeInsets.all(8.0),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(
//                     color: Color(0xffAFAFAF),
//                   ),
//                   borderRadius: BorderRadius.circular(30.0),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(
//                     color: Color.fromRGBO(200, 29, 36, 1),
//                   ),
//                   borderRadius: BorderRadius.circular(5.0),
//                 ),
//                 prefixIcon: const Padding(
//                   padding: EdgeInsets.all(10),
//                   child: Icon(
//                     Icons.search,
//                     color: Color(0xffAFAFAF),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           if (_searchController.text.isNotEmpty)
//             SizedBox(
//               height: 200, // Adjust the height as needed
//               child: ListView.builder(
//                 itemCount: _allBranches.length,
//                 itemBuilder: (context, index) {
//                   // Customize the appearance of each suggestion item
//                   return Container(
//                     color: Colors.amber,
//                     child: ListTile(
//                       title: Text("${_allBranches.length}"),
//                       subtitle: Text(_allBranches[0].branch!),
//                       onTap: () {
//                         // Handle the tap on the suggestion
//                         // You can navigate to another screen or perform any action here
//                       },
//                     ),
//                   );
//                 },
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sales_management_system/Core/helper/services/home/get_all_branchesServices.dart';
import 'package:sales_management_system/Models/home/get_all_branches.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  TextEditingController _searchController = TextEditingController();
  bool isClicked = false;
  List<dynamic> _searchResults = [];
  List<BranchDataModel> _allBranches = []; // Store all branches data

  @override
  void initState() {
    super.initState();
    _fetchAllBranches();
  }

  // Function to fetch all branches data
  void _fetchAllBranches() async {
    try {
      final response =
          await GetAllBranchesService(Dio()).getAllBranchesService();
      if (response != null) {
        setState(() {
          _allBranches = response;
        });
      }
    } catch (e) {
      print('Error fetching branches: $e');
    }
  }

  void _filterBranches(String value) {
    // Print the search input value and the total number of branches before filtering
    print('Search value: $value');
    print('Total branches before filtering: ${_allBranches.length}');

    setState(() {
      // Filter the branches based on the search input value
      _searchResults = _allBranches
          .where((branch) =>
              branch.branch!.toLowerCase().contains(value.trim().toLowerCase()))
          .toList();

      // Print the filtered branches and the total number of filtered branches
      print('Filtered branches: $_searchResults');
      print('Total filtered branches: ${_searchResults.length}');
    });
  }

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
              onTap: () {
                setState(() {
                  isClicked = true;
                });

                if (_allBranches.isEmpty) {
                  _fetchAllBranches(); // Fetch branches data when clicked
                }
              },
              controller: _searchController,
              onChanged: _filterBranches,
              decoration: InputDecoration(
                hintText: 'Search...',
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
          if (_searchController.text.isNotEmpty)
            SizedBox(
              height: 200, // Adjust the height as needed
              child: ListView.builder(
                itemCount: _allBranches.length,
                itemBuilder: (context, index) {
                  // Customize the appearance of each suggestion item
                  return Container(
                    color: Colors.amber,
                    child: ListTile(
                      title: Text("${_allBranches.length}"),
                      subtitle: Text(_allBranches[0].branch!),
                      onTap: () {
                        // Handle the tap on the suggestion
                        // You can navigate to another screen or perform any action here
                      },
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
