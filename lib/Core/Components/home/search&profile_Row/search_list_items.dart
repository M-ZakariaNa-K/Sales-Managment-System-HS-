import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';
import 'package:sales_management_system/Core/helper/services/home/get_search_data_service.dart';
import 'package:sales_management_system/Models/home/get_search_data_model.dart';
import 'package:sales_management_system/Views/pills/pills.dart';

class SearchListItems extends StatefulWidget {
  const SearchListItems({super.key, required this.searchController});
  final TextEditingController searchController;
  @override
  State<SearchListItems> createState() => _SearchListItemsState();
}

class _SearchListItemsState extends State<SearchListItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 300, // Adjust the height as needed
      child: FutureBuilder<GetSearchDataModel>(
        future: SearchAppService(Dio())
            .getsearchapp(query: widget.searchController.text),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.5, 0.5),
                      blurRadius: 10,
                    )
                  ]),
              child: const Center(
                child: CupertinoActivityIndicator(
                  color: ThemeColors.primary,
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.5, 0.5),
                        blurRadius: 10,
                      )
                    ]),
                child: Center(
                  child: Text('Something went wrong. Please try again...'.tr),
                ));
          } else if (snapshot.hasData) {
            final nameBranches = snapshot.data!.nameBranches;
            final numberBranches = snapshot.data!.numberBranches;
            final itemCount = nameBranches.length + numberBranches.length;
            if (nameBranches.isEmpty && numberBranches.isEmpty) {
              return Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.5, 0.5),
                          blurRadius: 10,
                        )
                      ]),
                  child: const Center(
                      child: Text("لم يتم العثور على الفرع المطلوب")));
            } else {
              return Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.5, 0.5),
                        blurRadius: 10,
                      )
                    ]),
                child: ListView.builder(
                  itemCount: itemCount,
                  itemBuilder: (context, index) {
                    if (index < nameBranches.length) {
                      return Column(
                        children: [
                          ListTile(
                            onTap: () {
                              // Handle onTap for numberBranches
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                //Here should has the Id of branch i pressed
                                return PillsPage(
                                  context,
                                  total: nameBranches[index].totalSales,
                                  guid: nameBranches[index].guid,
                                  branchName: nameBranches[index].name,
                                );
                              }));
                            },
                            title: Text(
                              nameBranches[index].name,
                              style: const TextStyle(
                                color: Color(0xff003A71),
                              ),
                            ),
                            subtitle: Text(
                              nameBranches[index].number,
                            ),
                            leading: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              child: Container(
                                width: 40,
                                height: 40,
                                child: Image.asset(
                                  'images/Logo2.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const Divider(
                            height: 0,
                            color: ThemeColors.primary,
                            endIndent: 20,
                            indent: 20,
                            thickness: 0.5,
                          )
                        ],
                      );
                    } else {
                      final numberIndex = index - nameBranches.length;
                      return Column(
                        children: [
                          ListTile(
                            onTap: () {
                              // Handle onTap for numberBranches
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                //Here should has the Id of branch i pressed
                                return PillsPage(
                                  context,
                                  total: nameBranches[index].totalSales,
                                  guid: numberBranches[index].guid,
                                  branchName: nameBranches[index].name,
                                );
                              }));
                            },
                            title: Text(
                              numberBranches[numberIndex].name,
                              style: const TextStyle(
                                color:ThemeColors.primary,
                              ),
                            ),
                            subtitle: Text(
                              numberBranches[numberIndex].number,
                            ),
                            leading: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              child: SizedBox(
                                width: 40,
                                height: 40,
                                child: Image.asset(
                                  'images/Logo2.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const Divider(
                            height: 0,
                            color: ThemeColors.primary,
                            endIndent: 20,
                            indent: 20,
                            thickness: 0.5,
                          )
                        ],
                      );
                    }
                  },
                ),
              );
            }
          } else {
            return Text("39".tr);
          }
        },
      ),
    );
  }
}
