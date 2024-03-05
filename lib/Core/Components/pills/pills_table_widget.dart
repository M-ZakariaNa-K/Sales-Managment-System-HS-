import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';
import 'package:sales_management_system/Core/helper/services/pills/invoices_list_service.dart';

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
  int lastPage = 1;
  bool isLoading = false; // Add a loading indicator flag
  TextEditingController pagController = TextEditingController();
  @override
  void initState() {
    super.initState();
    if (widget.branchTotal != 0) _fetchReportData(currentPage1: 1);
  }

  Future<void> _fetchReportData({dynamic currentPage1}) async {
    setState(() {
      isLoading = true;
    });

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
      isLoading = false; // Set loading to false after data is fetched
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
                              const BoxDecoration(color: Colors.transparent
                                  //ThemeColors.secondaryTextColor,
                                  ),
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
                              // color: ThemeColors.secondaryTextColor,
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
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  )),
                                ),
                              ),
                              // GestureDetector(
                              //   onTap: () {
                              //     Get.to(OldOrderDetailsDash(
                              //       orderId: 1,
                              //     ));
                              //   },
                            ],
                          ),
                        ),
                        TableRow(
                            decoration: const BoxDecoration(
                              // color: ThemeColors.secondaryTextColor,
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
                                            .number, // Set the keyboard type to numeric
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Text(" / ${numberOfPillsPages}"),
                                  ],
                                ),
                              ),
                              //Text("${currentPage} - ${numberOfPillsPages}"),
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

                  //2=================================================
                  // Row(
                  //   children: [
                  //     IconButton(
                  //         onPressed: prevPage != 0
                  //             ? () {
                  //                 _fetchReportData(currentPage1: prevPage);
                  //               }
                  //             : () {},
                  //         icon: Icon(
                  //           Icons.arrow_back_ios_new_rounded,
                  //           color: prevPage != 0
                  //               ? ThemeColors.primary
                  //               : Colors.grey,
                  //         )),
                  //     Text("${currentPage} - ${numberOfPillsPages}"),
                  //     IconButton(
                  //         onPressed: nextPage != null
                  //             ? () {
                  //                 _fetchReportData(currentPage1: nextPage);
                  //               }
                  //             : () {},
                  //         icon: Icon(
                  //           Icons.arrow_forward_ios_rounded,
                  //           color: nextPage != null
                  //               ? ThemeColors.primary
                  //               : Colors.grey,
                  //         )),
                  //   ],
                  // )
                ],
              ),
            ),
          )
        : SizedBox(
            height: MediaQuery.of(context).size.height / 1.2,
            child: Center(
              child: Text(
                "There Is No invoices In This Branch.".tr,
                style: const TextStyle(
                  color: Color(0xff003A71),
                  fontSize: 18,
                ),
              ),
            ),
          );
    //  Stack(
    //   children: [
    //     SizedBox(
    //       width: double.infinity,
    //       child: PaginatedDataTable(
    //         rowsPerPage: 20,
    //         columns: [
    //           DataColumn(
    //               label: Expanded(
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 Center(child: Text('35'.tr)),
    //               ],
    //             ),
    //           )),
    //           // DataColumn(label: Center(child: Text('34'.tr))),
    //           DataColumn(
    //               label: Expanded(
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 Center(child: Text('Date'.tr)),
    //               ],
    //             ),
    //           )),
    //           DataColumn(
    //               label: Expanded(
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 Center(child: Text('total'.tr)),
    //               ],
    //             ),
    //           )),
    //         ],
    //         source: PillsDataSource(
    //           context: context,
    //           data: !isLoading ? allPillsData["invoices"] : [],
    //           numberOfPillsPages: numberOfPillsPages,
    //         ),
    //         onPageChanged: (pageIndex) {
    //           setState(() {
    //             _fetchReportData(currentPage1: nextPage);
    //           });
    //         },
    //       ),
    //     ),
    //     if (isLoading) // Show loading indicator if isLoading is true
    //       const Center(
    //         child: CircularProgressIndicator(),
    //       ),
    //   ],
    // );
  }
}

// class PillsDataSource extends DataTableSource {
//   BuildContext context;
//   PillsDataSource(
//       {required this.context,
//       @required this.data,
//       required this.numberOfPillsPages});
//   final List<InvoiceModel>? data;
//   final int numberOfPillsPages;
//   @override
//   DataRow? getRow(
//     int index,
//   ) {
//     if (index >= data!.length) {
//       return null;
//     }
//     final rowData = data![index];
//     return DataRow(cells: [
//       DataCell(Center(child: Text(rowData.number))),
//       // DataCell(Center(child: Text(rowData.branch))),
//       DataCell(
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Center(
//               child: SizedBox(
//                 width: 300,
//                 child: Text(
//                   rowData.date,
//                   textAlign: TextAlign.center,
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 2,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       DataCell(Center(child: Text("${rowData.total}"))),
//     ]);
//   }

//   @override
//   int get rowCount => numberOfPillsPages;
//   @override
//   bool get isRowCountApproximate => false;

//   @override
//   int get selectedRowCount => 0;
// }
