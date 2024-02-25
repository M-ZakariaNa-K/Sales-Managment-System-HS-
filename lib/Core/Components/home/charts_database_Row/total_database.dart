import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sales_management_system/Core/Components/home/charts_database_Row/list_of_items.dart';
import 'package:sales_management_system/Core/Components/home/custome_elevated_button.dart';
import 'package:sales_management_system/Core/Components/home/unload_sales_table.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';
import 'package:sales_management_system/Core/helper/services/home/get_databases_list_service.dart';
import 'package:sales_management_system/Core/helper/services/home/post_update_database_service.dart';
import 'package:sales_management_system/Models/home/get_databases_list_model.dart';

class TotalDatabase extends StatefulWidget {
  const TotalDatabase({super.key});

  @override
  State<TotalDatabase> createState() => _TotalDatabaseState();
}

class _TotalDatabaseState extends State<TotalDatabase> {
  final TextEditingController databaseTextFildController =
      TextEditingController();
  String? selectedDatabase1;
  String? selectedDatabase2;
  late Timer _timer;
  bool _isButtonVisible = false;

  @override
  void initState() {
    super.initState();
    // Show the button after 3 seconds
    _timer = Timer(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _isButtonVisible = true;
        });
      }
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _timer.cancel();
    super.dispose();
  }

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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: Wrap(
                children: [
                  //-----------------------------------------1------------------------------------
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: SizedBox(
                      width: 230,
                      child: FutureBuilder(
                          future: GetDatabasesListService(Dio())
                              .getDatabasesListService(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const UnloadedItem(
                                width: 230,
                                height: 49,
                              );
                            } else if (snapshot.hasError) {
                              print('Error: ${snapshot.error}');
                              return Center(
                                child: Text('Error: ${snapshot.error}'),
                              );
                            } else if (snapshot.hasData) {
                              List<GetDatabasesListDataModel> data =
                                  snapshot.data!;
                              List<String> databaseOptions = data
                                  .map((database) => database.databaseName)
                                  .toList();
                              return DropdownButtonFormField<String>(
                                elevation: 0,
                                hint: Text(
                                  selectedDatabase1 != null
                                      ? '$selectedDatabase1'
                                      : "Admin's Database...",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                value: selectedDatabase1,
                                onChanged: (value) {
                                  setState(() {
                                    selectedDatabase1 = value;
                                  });
                                },
                                items: databaseOptions.map((String database) {
                                  return DropdownMenuItem<String>(
                                    value: database,
                                    child: Text(database),
                                  );
                                }).toList(),
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 12.0,
                                    horizontal: 16.0,
                                  ),
                                ),
                              );
                            } else {
                              return const Center(
                                  child: Text('No data available'));
                            }
                          }),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  //-----------------------------------------2------------------------------------
                  SizedBox(
                    width: 230,
                    child: FutureBuilder(
                        future: GetDatabasesListService(Dio())
                            .getDatabasesListService(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const UnloadedItem(
                              width: 230,
                              height: 49,
                            );
                          } else if (snapshot.hasError) {
                            print('Error: ${snapshot.error}');
                            return Center(
                              child: Text('Error: ${snapshot.error}'),
                            );
                          } else if (snapshot.hasData) {
                            List<GetDatabasesListDataModel> data =
                                snapshot.data!;
                            List<String> databaseOptions = data
                                .map((database) => database.databaseName)
                                .toList();
                            return DropdownButtonFormField<String>(
                              elevation: 0,
                              hint: Text(
                                selectedDatabase2 != null
                                    ? '$selectedDatabase2'
                                    : "User's Database...",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              value: selectedDatabase2,
                              onChanged: (value) {
                                setState(() {
                                  selectedDatabase2 = value;
                                });
                              },
                              items: databaseOptions.map((String database) {
                                return DropdownMenuItem<String>(
                                  value: database,
                                  child: Text(database),
                                );
                              }).toList(),
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 12.0,
                                  horizontal: 16.0,
                                ),
                              ),
                            );
                          } else {
                            return const Center(
                                child: Text('No data available'));
                          }
                        }),
                  ),
                  //-----------------------------------------3------------------------------------
                ],
              ),
            ),
          ),

          //------Data(Number of admins,company total sales for this mounth,the most sold branch)-----
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
                  'Submit',
                  style: TextStyle(
                    color: ThemeColors.secondaryTextColor,
                  ),
                ),
                onPressed: () {
                  //Update Sales Table Data depend on selectedDatabase
                  PostUpdateDatabaseService(Dio(), selectedDatabase1!)
                      .postUpdateAdminDatabaseService(
                          baseURL: "databases/set-admin");
                  PostUpdateDatabaseService(Dio(), selectedDatabase2)
                      .postUpdateAdminDatabaseService(
                          baseURL: "databases/set-users");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
