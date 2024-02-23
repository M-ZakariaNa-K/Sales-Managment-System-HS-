import 'package:flutter/material.dart';
import 'package:sales_management_system/Core/Components/home/charts_database_Row/list_of_items.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';

class TotalDatabase extends StatefulWidget {
  const TotalDatabase({super.key});

  @override
  State<TotalDatabase> createState() => _TotalDatabaseState();
}

class _TotalDatabaseState extends State<TotalDatabase> {
  final TextEditingController databaseTextFildController =
      TextEditingController();
  List<String> databaseOptions = [
    'Option 1',
    'Option 2',
    'Option 3'
  ]; // Sample database options
  List<String> optionOptions = [
    'Option A',
    'Option B',
    'Option C'
  ]; // Sample option options

  String? selectedDatabase;
  String? selectedOption;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 320, // Set your minimum height here
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 2,
          color: Colors.grey,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // const Text(
          //   'Database',
          //   style: TextStyle(
          //     fontSize: 20,
          //     color: ThemeColors.primaryTextColor,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          // //------to choose database-----
          // Padding(
          //   padding: const EdgeInsets.only(bottom: 10.0),
          //   child: Row(
          //     children: [
          //       Expanded(
          //           child: TextField(
          //         controller: databaseTextFildController,
          //         onSubmitted: (value) {
          //           setState(() {});
          //         },
          //         style: const TextStyle(color: ThemeColors.primaryTextColor),
          //         decoration: const InputDecoration(
          //           hintText: 'Choose Database...',
          //           hintStyle: TextStyle(
          //             color: Colors.grey,
          //           ),
          //           enabledBorder: OutlineInputBorder(
          //             borderSide: BorderSide(
          //               color: Colors.grey,
          //             ),
          //           ),
          //           focusedBorder: OutlineInputBorder(
          //             borderSide: BorderSide(
          //               color: ThemeColors.primaryTextColor,
          //             ),
          //           ),
          //           contentPadding: EdgeInsets.symmetric(
          //             vertical: 15.0, // Adjust vertical padding
          //             horizontal: 10.0, // Adjust horizontal padding
          //           ),
          //           isDense: true,
          //         ),
          //       )),
          //       Padding(
          //         padding: const EdgeInsets.only(left: 20),
          //         child: ElevatedButton(
          //           style: ElevatedButton.styleFrom(
          //             alignment: Alignment.center,
          //             backgroundColor: ThemeColors.secondary,
          //             shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(3),
          //             ),
          //             fixedSize: const Size(60, 45),
          //           ),
          //           onPressed: () {},
          //           child: const Icon(
          //             Icons.send,
          //             size: 18,
          //             color: ThemeColors.secondaryTextColor,
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
           
          Row(
            children: [

            ],
          ),
          SizedBox(
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title for the first dropdown
              
                // Title for the second dropdown
                Text(
                  'Choose Option',
                  style: TextStyle(
                    fontSize: 16,
                    color: ThemeColors.primaryTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                // Second Dropdown
                DropdownButtonFormField<String>(
                  value: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value;
                    });
                  },
                  items: optionOptions.map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 16.0,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // ElevatedButton(
                //   onPressed: () {
                //     // Handle button press here
                //   },
                //   child: Text('Submit'),
                // ),
              ],
            ),
          ),

          //------Data(Number of admins,company total sales for this mounth,the most sold branch)-----
          const ListOfItems(
            textColor: ThemeColors.secondaryTextColor,
          ),
        ],
      ),
    );
  }
}
