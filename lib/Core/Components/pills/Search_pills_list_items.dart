import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_management_system/Controllers/lang/lang_controller.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';
import 'package:sales_management_system/Core/helper/services/pills/invoices_search_service.dart';

class SearchPillsListItems extends StatelessWidget {
  const SearchPillsListItems({
    Key? key,
    required this.searchController,
    required this.guid,
  }) : super(key: key);
  final TextEditingController searchController;
  final String guid;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 300, // Adjust the height as needed
      child: FutureBuilder(
        future: PillsSearchService(Dio())
            .getsearchapp(query: searchController.text, guid: guid),
        builder: (context, snapshot) {
          //printsnapshot);
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
            //print'Error: ${snapshot.error}');
            //printguid);
            //printsearchController.text);
            return Center(
              child: Text('Something went wrong. Please try again...'.tr),
            );
          } else if (snapshot.hasData) {
            final invoicesList = snapshot.data!.invoices;
            if (invoicesList.isEmpty) {
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
                  child:
                      Center(child: Text("There is no related invoices".tr)));
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
                  itemCount: invoicesList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
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
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${"34".tr}: ${invoicesList[index].number}",
                                    style: const TextStyle(
                                      color: ThemeColors.primary,
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "${"total".tr}: ",
                                      ),
                                      Text(
                                        invoicesList[index].total,
                                        textDirection: TextDirection.ltr,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "${"Date".tr}: ${invoicesList[index].date}",
                                  ),
                                ],
                              ),
                            ],
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
