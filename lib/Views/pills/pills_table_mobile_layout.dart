// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:sales_management_system/Core/Components/Report/export_button.dart';
// import 'package:sales_management_system/Core/Components/custome_elevated_button.dart';
// import 'package:sales_management_system/Core/Components/home/search&profile_Row/search_bar.dart';
// import 'package:sales_management_system/Core/Components/pills/pills_table_widget.dart';
// import 'package:sales_management_system/Core/Constants/theme.dart';

// final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

// class MobileLayoutPillsPage extends StatefulWidget {
//   const MobileLayoutPillsPage(
//     BuildContext context, {
//     super.key,
//     required this.guid,
//     required this.branchName,
//     required this.total,
//   });
//   final String branchName;
//   final String guid;
//   final dynamic total;
//   @override
//   State<MobileLayoutPillsPage> createState() => _MobileLayoutPillsPageState();
// }

// class _MobileLayoutPillsPageState extends State<MobileLayoutPillsPage> {
//   DateTime? selectedStartDateRange;
//   DateTime? selectedEndDateRange;
//   final pdf = pw.Document();
//   String formattedStartDate = "";
//   String formattedEndDate = "";
//   String formatDate(DateTime date) {
//     // Format the DateTime object into a specific format
//     return '${date.year}-${_twoDigits(date.month)}-${_twoDigits(date.day)}';
//   }

//   String _twoDigits(int n) {
//     // Helper function to ensure two digits for month and day
//     if (n >= 10) return '$n';
//     return '0$n';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       backgroundColor: ThemeColors.secondary,
//       body: SingleChildScrollView(
//         child: Center(
//           child: Container(
//             padding: const EdgeInsets.all(10),
//             margin: const EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: Colors.white.withOpacity(.8),
//               border: Border.all(
//                 width: 2,
//                 color: Colors.grey,
//               ),
//             ),
//             child: Column(
//               children: [
//                 //SearchBar
//                 SearchBarWidget(
//                   isInvoices: true,
//                   guid: widget.guid,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 20.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         '${'34'.tr}: ${widget.branchName}',
//                         style: const TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: ThemeColors.primaryTextColor,
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           Padding(
//                             padding:
//                                 const EdgeInsets.symmetric(horizontal: 10.0),
//                             child: CustomeElevatedButton(
//                               buttonChild: Text(
//                                 "Pick a Date".tr,
//                                 style: const TextStyle(
//                                     color: ThemeColors.secondaryTextColor),
//                               ),
//                               buttonColor: ThemeColors.secondary,
//                               onPressed: () async {
//                                 final DateTimeRange? picked =
//                                     await showDateRangePicker(
//                                   context: context,
//                                   initialDateRange: DateTimeRange(
//                                     start: DateTime.now(),
//                                     end: DateTime.now()
//                                         .add(const Duration(days: 100)),
//                                   ),
//                                   firstDate: DateTime(2000),
//                                   lastDate: DateTime(2100),
//                                   //TO MAKE THE DIALOG SMALLER
//                                   builder: (context, child) {
//                                     return Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: <Widget>[
//                                         Padding(
//                                           padding:
//                                               const EdgeInsets.only(top: 50.0),
//                                           child: SizedBox(
//                                             height: MediaQuery.of(context)
//                                                     .size
//                                                     .height *
//                                                 0.7,
//                                             width: MediaQuery.of(context)
//                                                     .size
//                                                     .width *
//                                                 0.45,
//                                             child: child,
//                                           ),
//                                         ),
//                                       ],
//                                     );
//                                   },
//                                 );
//                                 if (picked == null) {
//                                   //onpressed X
//                                   return;
//                                 }

//                                 setState(() {
//                                   selectedStartDateRange = picked.start;
//                                   selectedEndDateRange = picked.end;
//                                 });

//                                 //   //NOTE(from ZAKARIA): Here we will call the data from API between the 2 selected Date
//                                 formattedStartDate =
//                                     formatDate(selectedStartDateRange!);
//                                 formattedEndDate =
//                                     formatDate(selectedEndDateRange!);
//                               },
//                             ),
//                           ),
//                           ExportButton(
//                             scaffoldKey: _scaffoldKey,
//                             pdfUrl:
//                                 'http://127.0.0.1:8000/api/invoices/export-pdf?GUID=${widget.guid}&first_date=$formattedStartDate&last_date=$formattedEndDate',
//                             excelUrl:
//                                 'http://127.0.0.1:8000/api/invoices/export?GUID=${widget.guid}&first_date=$formattedStartDate&last_date=$formattedEndDate',
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//                 PillsTableWidget(
//                   branchTotal: widget.total,
//                   guid: widget.guid,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
