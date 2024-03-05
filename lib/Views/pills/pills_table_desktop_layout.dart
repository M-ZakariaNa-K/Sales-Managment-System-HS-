import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:sales_management_system/Core/Components/Report/export_button.dart';
import 'package:sales_management_system/Core/Components/custome_elevated_button.dart';
import 'package:sales_management_system/Core/Components/home/search&profile_Row/search_bar.dart';
import 'package:sales_management_system/Core/Components/pills/pills_table_widget.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class DesktopLayoutPillsPage extends StatefulWidget {
  const DesktopLayoutPillsPage(
    BuildContext context, {
    super.key,
    required this.guid,
    required this.total,
    required this.branchName,
  });
  final String branchName;
  final String guid;
  final dynamic total;
  @override
  State<DesktopLayoutPillsPage> createState() => _DesktopLayoutPillsPageState();
}

class _DesktopLayoutPillsPageState extends State<DesktopLayoutPillsPage> {
  // int numberOfPillsPages = 1;
  // int currentPage = 1;
  // int prevPage = 0;
  // int nextPage = 2;
  // int total = 0;
  // int lastPage = 1;

  DateTime? selectedStartDateRange;
  DateTime? selectedEndDateRange;
  final pdf = pw.Document();

  //NOTE(from ZAKARIA):  dataBetweenTwoDate list will showen when user choose 2 dates
  //we use it in sourse in PagenatedDataTable
  // List<InvoiceModel> dataBetweenTwoDate = [];
  // AllSalesValuesDataModel totalSales =
  //     AllSalesValuesDataModel(spelledTotal: "", total: "0");
  String formattedStartDate = "";
  String formattedEndDate = "";
  // List<InvoiceModel>? currentPillsData; // Add this variable
  // int currentPageIndex = 1; // Add this variable

  //========================================================================================
  String formatDate(DateTime date) {
    // Format the DateTime object into a specific format
    return '${date.year}-${_twoDigits(date.month)}-${_twoDigits(date.day)}';
  }

  String _twoDigits(int n) {
    // Helper function to ensure two digits for month and day
    if (n >= 10) return '$n';
    return '0$n';
  }

  //========================================================================================
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _fetchReportData(currentPage);
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: ThemeColors.secondary,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white.withOpacity(.8),
              border: Border.all(
                width: 2,
                color: Colors.grey,
              ),
            ),
            child: Column(
              children: [
                //SearchBar
                SearchBarWidget(
                  isInvoices: true,
                  guid: widget.guid,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${'34'.tr}: ${widget.branchName}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: ThemeColors.primaryTextColor,
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: CustomeElevatedButton(
                              buttonChild: Text(
                                "Pick a Date".tr,
                                style: const TextStyle(
                                    color: ThemeColors.secondaryTextColor),
                              ),
                              buttonColor: ThemeColors.secondary,
                              onPressed: () async {
                                final DateTimeRange? picked =
                                    await showDateRangePicker(
                                  context: context,
                                  initialDateRange: DateTimeRange(
                                    start: DateTime.now(),
                                    end: DateTime.now()
                                        .add(const Duration(days: 100)),
                                  ),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                  //TO MAKE THE DIALOG SMALLER
                                  builder: (context, child) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 50.0),
                                          child: SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.7,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.45,
                                            child: child,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                if (picked == null) {
                                  //onpressed X
                                  return;
                                }

                                setState(() {
                                  selectedStartDateRange = picked.start;
                                  selectedEndDateRange = picked.end;
                                });

                                //   //NOTE(from ZAKARIA): Here we will call the data from API between the 2 selected Date
                                formattedStartDate =
                                    formatDate(selectedStartDateRange!);
                                formattedEndDate =
                                    formatDate(selectedEndDateRange!);
                                print(formattedStartDate);
                                print(formattedEndDate);
                                // dataBetweenTwoDate =
                                //     await GetPills2DateService(Dio())
                                //         .getPills2DateService(
                                //             startDate: formattedStartDate,
                                //             endDate: formattedEndDate,
                                //             guid:
                                //                 allPillsData["invoices"].guid);
                              },
                            ),
                          ),
                          ExportButton(
                            scaffoldKey: _scaffoldKey,
                            pdfUrl:
                                'http://127.0.0.1:8000/api/invoices/export-pdf?GUID=${widget.guid}&first_date=$formattedStartDate&last_date=$formattedEndDate',
                            excelUrl:
                                'http://127.0.0.1:8000/api/invoices/export?GUID=${widget.guid}&first_date=$formattedStartDate&last_date=$formattedEndDate',
                          )
                        ],
                      )
                    ],
                  ),
                ),
                PillsTableWidget(
                  branchTotal: widget.total,
                  guid: widget.guid,
                ),
                // SizedBox(
                //   width: double.infinity,
                //   child: PaginatedDataTable(
                //     // headingRowColor:
                //     //     MaterialStateColor.resolveWith((states) => Colors.white),
                //     // // header: const Text(
                //     //   'Sales Table',
                //     //   style: TextStyle(fontWeight: FontWeight.bold),
                //     // ),
                //     //here data.length && numOfBranshes should has same value and put it in pieChart
                //     rowsPerPage: 20, // Number of rows per page
                //     columns: [
                //       DataColumn(
                //         label: Expanded(
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               Text(
                //                 '35'.tr,
                //                 style: const TextStyle(
                //                     fontWeight: FontWeight.bold),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //       DataColumn(
                //         label: Expanded(
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               Text(
                //                 '34'.tr,
                //                 style: TextStyle(fontWeight: FontWeight.bold),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //       DataColumn(
                //         label: Expanded(
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               Text(
                //                 'Date'.tr,
                //                 style: const TextStyle(
                //                     fontWeight: FontWeight.bold),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //       DataColumn(
                //         label: Expanded(
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               Text(
                //                 'total'.tr,
                //                 style: const TextStyle(
                //                     fontWeight: FontWeight.bold),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ],
                //     source: PillsDataSource(
                //         context: context,
                //         data: allPillsData["invoices"],
                //         numberOfPillsPages: numberOfPillsPages),

                //     // onRowsPerPageChanged: (rowsPerPage) {
                //     //   // Update the current page index when rows per page changes
                //     //   setState(() {
                //     //     currentPageIndex = 1;
                //     //   });
                //     //   // Call your function to fetch data for the new page
                //     //   _fetchReportData(page: currentPageIndex);
                //     // },
                //     // Add the onPageChanged callback
                //     onPageChanged: (pageIndex) {
                //       // Check if the user is navigating forward or backward
                //       // bool isNext = pageIndex > currentPageIndex;
                //       //اذا الايكون اليسارية فبستدعي التابع مع النيكستبيج
                //       //اذا الايكون اليمينية فبستدعي التابع مع البريف بيج
                //       setState(() {
                //         print(
                //             (pageIndex / numOfClicks) - 19 + (numOfClicks - 1));
                //         _fetchReportData(
                //             (pageIndex / numOfClicks) - 19 + (numOfClicks - 1));
                //         numOfClicks++;
                //       });
                //     },
                //   ),
                // ),
                //Text('${allPillsData["invoices"].total}${"total-price".tr}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
