import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sales_management_system/Core/Components/home/charts_database_Row/list_of_items.dart';
import 'package:sales_management_system/Core/Components/home/custome_elevated_button.dart';
import 'package:sales_management_system/Core/Components/home/unload_sales_table.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';
import 'package:sales_management_system/Core/helper/services/home/get_database_name_service.dart';
import 'package:sales_management_system/Core/helper/services/home/get_databases_list_service.dart';
import 'package:sales_management_system/Core/helper/services/home/post_update_database_service.dart';
import 'package:sales_management_system/Core/helper/shared/shared.dart';
import 'package:sales_management_system/Models/home/get_database_name_model.dart';
import 'package:sales_management_system/Models/home/get_databases_list_model.dart';

class TotalDatabase extends StatefulWidget {
  const TotalDatabase({super.key});

  @override
  State<TotalDatabase> createState() => _TotalDatabaseState();
}

class _TotalDatabaseState extends State<TotalDatabase> {
  late Future<GetDatabsNameModel> _adminDatabaseFuture;
  late Future<GetDatabsNameModel> _userDatabaseFuture;
  late Future<List<GetDatabasesListDataModel>> _future;
  String? selectedDatabase1;
  String? selectedDatabase2;
  bool _isButtonVisible = false;
  bool _isDisposed = false; // Add this variable

  @override
  void initState() {
    super.initState();
    _adminDatabaseFuture = GetDatabsNameService(Dio())
        .getDatabsNameService(baseUrl: 'databases/get-admin');
    _userDatabaseFuture = GetDatabsNameService(Dio())
        .getDatabsNameService(baseUrl: 'databases/get-users');
    _future = GetDatabasesListService(Dio()).getDatabasesListService();

    // Show the button after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (!_isDisposed) {
        // Check if the widget is disposed before calling setState
        setState(() {
          _isButtonVisible = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _isDisposed = true; // Set _isDisposed to true when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: 370,
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: Wrap(
                children: [
                  //-----------------------------------------1------------------------------------
                  FutureBuilder(
                    future: _adminDatabaseFuture,
                    builder:
                        (context, AsyncSnapshot<GetDatabsNameModel> snapshot) {
                      return _buildDropDown(
                          selectedDatabase1, snapshot.data?.name);
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  //-----------------------------------------2------------------------------------
                  FutureBuilder(
                    future: _userDatabaseFuture,
                    builder:
                        (context, AsyncSnapshot<GetDatabsNameModel> snapshot) {
                      return _buildDropDown(
                          selectedDatabase2, snapshot.data?.name);
                    },
                  ),
                ],
              ),
            ),
          ),

          //------Data(Number of admins,company total sales for this month,the most sold branch)-----
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: ListOfItems(
              textColor: ThemeColors.secondaryTextColor,
            ),
          ),
          //-----------------------------------------4------------------------------------

          // Widget that appears after 3 seconds
          AnimatedOpacity(
            opacity: _isButtonVisible ? 1.0 : 0.0,
            duration: Duration(milliseconds: 500),
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: CustomeElevatedButton(
                buttonColor: ThemeColors.secondary,
                buttonChild: const Text(
                  'تحديث',
                  style: TextStyle(
                    color: ThemeColors.secondaryTextColor,
                  ),
                ),
                onPressed: () {
                  // Update Sales Table Data depend on selectedDatabase
                  if (selectedDatabase1 != null) {
                    PostUpdateDatabaseService(Dio(), selectedDatabase1!)
                        .postUpdateAdminDatabaseService(
                            baseURL: "databases/set-admin");
                  }
                  if (selectedDatabase2 != null) {
                    PostUpdateDatabaseService(Dio(), selectedDatabase2!)
                        .postUpdateAdminDatabaseService(
                            baseURL: "databases/set-users");
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropDown(String? selectedValue, String? hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: FutureBuilder(
        future: _future,
        builder:
            (context, AsyncSnapshot<List<GetDatabasesListDataModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const UnloadedItem(width: 230, height: 49);
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<String> databaseOptions = snapshot.data
                    ?.map((database) => database.databaseName)
                    .toList() ??
                [];
            return SizedBox(
              width: 230,
              child: DropdownButtonFormField<String>(
                elevation: 0,
                hint: Text(
                  hintText ?? "",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                value: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
                items: !isUser
                    ? databaseOptions.map((String database) {
                        return DropdownMenuItem<String>(
                          value: database,
                          child: Text(database),
                        );
                      }).toList()
                    : [],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16.0,
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
