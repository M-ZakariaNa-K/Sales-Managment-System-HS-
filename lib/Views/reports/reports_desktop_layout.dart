import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_management_system/Core/Components/Report/export_button.dart';
import 'package:sales_management_system/Core/Components/custome_elevated_button.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';
import 'package:sales_management_system/Core/helper/services/Report/GetReport2DateService.dart';
import 'package:sales_management_system/Core/helper/services/home/get_all_branchesServices.dart';
import 'package:sales_management_system/Core/helper/services/home/get_all_sales_value_service.dart';
import 'package:sales_management_system/Models/home/get_all_branches.dart';
import 'package:sales_management_system/Models/home/get_all_sales_value.dart';
import 'package:sales_management_system/Models/reports/GetReport2DateModel.dart';

import '../../Core/Components/Report/report_data_source.dart';

bool isReportDataDefult = true;

class DesktopLayoutReportsPage extends StatefulWidget {
  const DesktopLayoutReportsPage(BuildContext context, {super.key});

  @override
  State<DesktopLayoutReportsPage> createState() =>
      _DesktopLayoutReportsPageState();
}

class _DesktopLayoutReportsPageState extends State<DesktopLayoutReportsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime? selectedStartDateRange;
  DateTime? selectedEndDateRange;
  List<BranchDataModel> defultData = [];
  //NOTE(from ZAKARIA):  dataBetweenTwoDate list will showen when user choose 2 dates
  //we use it in sourse in PagenatedDataTable
  List<ReportDataModel> dataBetweenTwoDate = [];
  AllSalesValuesDataModel totalSales =
      AllSalesValuesDataModel(spelledTotal: "", total: "0");
  late String formattedStartDate;
  late String formattedEndDate;

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
  //<<< Set default two date to export(and they are the start and end of the current mounth)>>>
  //========================================================================================
  void _setDefaultDateRange() {
    // Get the current date
    DateTime now = DateTime.now();

    // Get the start of the current month
    DateTime startOfMonth = DateTime(now.year, now.month, 1);

    // Get the end of the current month by adding one month and subtracting one day
    DateTime endOfMonth = DateTime(now.year, now.month + 1, 0);

    // Format the dates as strings
    formattedStartDate =
        '${startOfMonth.year}-${_twoDigits2(startOfMonth.month)}-${_twoDigits2(startOfMonth.day)}';
    formattedEndDate =
        '${endOfMonth.year}-${_twoDigits2(endOfMonth.month)}-${_twoDigits2(endOfMonth.day)}';
  }

  String _twoDigits2(int n) {
    return n.toString().padLeft(2, '0');
  }

  //========================================================================================
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchReportData();
    _setDefaultDateRange();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // Method to fetch all sales data
  Future<void> _fetchReportData() async {
    List<BranchDataModel> newData =
        await GetAllBranchesService(Dio()).getAllBranchesService();
    //to featch defult totalSales
    List<AllSalesValuesDataModel> totalSalesTemp =
        await AllSalesValuesService(Dio()).getAllSalesValues();
    if (mounted) {
      setState(() {
        defultData = newData;
        totalSales = totalSalesTemp[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: ThemeColors.secondary,
      body: SingleChildScrollView(
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                       "Mounthly Report".tr,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: ThemeColors.primaryTextColor,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                              dataBetweenTwoDate =
                                  await GetReport2DateService(Dio())
                                      .getReport2DateService(
                                          startDate: formattedStartDate,
                                          endDate: formattedEndDate);
                              setState(() {
                                isReportDataDefult = false;
                              });
                            },
                          ),
                        ),
                        ExportButton(
                          isInvoices: false,
                          scaffoldKey: _scaffoldKey,
                          pdfUrl:
                              'http://127.0.0.1:8000/api/branches-Sales/PDFForm?start_date=$formattedStartDate&end_date=$formattedEndDate',
                          excelUrl:
                              'http://127.0.0.1:8000/api/branches-Sales/ExcelForm?start_date=$formattedStartDate&end_date=$formattedEndDate',
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: PaginatedDataTable(
                  //here data.length && numOfBranshes should has same value and put it in pieChart
                  rowsPerPage: 10, // Number of rows per page
                  columns: [
                    _dataColumn('35'.tr),
                    _dataColumn('34'.tr),
                    _dataColumn('37'.tr),
                    _dataColumn('38'.tr),
                  ],
                  source: ReportDataSource(
                      context: context,
                      data: selectedStartDateRange == null ||
                              selectedEndDateRange == null
                          ? defultData
                          : dataBetweenTwoDate),
                ),
              ),
              Text(
                  '${dataBetweenTwoDate.isNotEmpty ? dataBetweenTwoDate[dataBetweenTwoDate.length - 1].total : totalSales.total}${"total-price".tr}'),
              const SizedBox(
                height: 250,
              )
            ],
          ),
        ),
      ),
    );
  }

  _dataColumn(String title) {
    return DataColumn(
      label: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
