import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';
import 'package:sales_management_system/Core/helper/services/pills/invoices_list_service.dart';
import 'package:flutter/services.dart';

class PillsTableWidget extends StatefulWidget {
  const PillsTableWidget({
    Key? key,
    required this.guid,
    required this.branchTotal,
  }) : super(key: key);

  final String guid;
  final dynamic branchTotal;

  @override
  State<PillsTableWidget> createState() => _PillsTableWidgetState();
}

class _PillsTableWidgetState extends State<PillsTableWidget> {
  Map<String, dynamic> allPillsData = {};
  int numberOfPillsPages = 1;
  int? currentPage;
  int? prevPage;
  int? nextPage;
  int total = 0;
  TextEditingController pagController = TextEditingController();
  @override
  void initState() {
    super.initState();
    if (widget.branchTotal != 0) _fetchReportData(currentPage1: 1);
  }

  Future<void> _fetchReportData({dynamic currentPage1}) async {
    Map<String, dynamic> newData =
        await GetInvoiceListService(Dio()).fetchInvoices(
      guid: widget.guid,
      page: currentPage1,
    );

    setState(() {
      // pagController.text = currentPage != null ? currentPage.toString() : "1";
      pagController.text = currentPage1.toString();
      allPillsData = newData;
      numberOfPillsPages = allPillsData["pagination"][0].lastPage;
      currentPage = allPillsData["pagination"][0].currentPage;
      prevPage = allPillsData["pagination"][0].prevPage;
      nextPage = allPillsData["pagination"][0].nextPage;
      total = allPillsData["pagination"][0].total;
    });
  }

  @override
  Widget build(BuildContext context) {
    return allPillsData.isNotEmpty
        ? SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  //1=================================================
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Table(
                      border: const TableBorder(
                        horizontalInside:
                            BorderSide(width: .5, color: Colors.grey),
                      ),
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: [
                        TableRow(
                          decoration:
                              const BoxDecoration(color: Colors.transparent),
                          children: [
                            TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Center(
                                    child: Text(
                                  "35".tr,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            ),
                            TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Center(
                                    child: Text(
                                  "Date".tr,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            ),
                            TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Center(
                                    child: Text(
                                  "total".tr,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            ),
                          ],
                        ),
                        ...List.generate(
                          allPillsData["invoices"].length,
                          (index) => TableRow(
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                            children: [
                              //cell1
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Center(
                                      child: Text(
                                    "${allPillsData["invoices"][index].number}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  )),
                                ),
                              ),

                              //cell2
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Center(
                                      child: Text(
                                    "${allPillsData["invoices"][index].date}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  )),
                                ),
                              ),
                              //cell3
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Center(
                                      child: Text(
                                    "${allPillsData["invoices"][index].total}",
                                       textDirection: TextDirection.ltr,
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //2=================================================
                        TableRow(
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                            children: [
                              IconButton(
                                  onPressed: prevPage != 0
                                      ? () {
                                          _fetchReportData(
                                              currentPage1: prevPage);
                                        }
                                      : () {},
                                  icon: Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    color: prevPage != 0
                                        ? ThemeColors.primary
                                        : Colors.grey,
                                  )),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 15),
                                      width: 80,
                                      height: 45,
                                      child: TextField(
                                        controller: pagController,
                                        onChanged: (value) {
                                          if (double.parse(value) <=
                                              numberOfPillsPages) {
                                            _fetchReportData(
                                                currentPage1:
                                                    double.parse(value));
                                          } else {
                                            _fetchReportData(
                                                currentPage1:
                                                    numberOfPillsPages);
                                          }
                                        },
                                        keyboardType: TextInputType
                                            .number, // to set the keyboard type to numeric
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.allow(RegExp(
                                              r'[0-9]')), // Allow only numbers
                                        ],
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Text(" / $numberOfPillsPages"),
                                  ],
                                ),
                              ),
                              IconButton(
                                  onPressed: pagController.text !=
                                          numberOfPillsPages.toString()
                                      ? () {
                                          _fetchReportData(
                                              currentPage1: nextPage);
                                        }
                                      : () {},
                                  icon: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: pagController.text !=
                                            numberOfPillsPages.toString()
                                        // nextPage != numberOfPillsPages + 1
                                        ? ThemeColors.primary
                                        : Colors.grey,
                                  ))
                            ])
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : SizedBox(
            height: MediaQuery.of(context).size.height / 1.2,
            child: Center(
              child: Text(
              "There Is No invoices in this branch.".tr,
                style: const TextStyle(
                  color: ThemeColors.primary,
                  fontSize: 18,
                ),
              ),
            ),
          );
  }
}