import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_management_system/Core/Components/Report/export_button.dart';
import 'package:sales_management_system/Core/Components/custome_elevated_button.dart';
import 'package:sales_management_system/Core/Components/home/sales_table&image_sliderRow/mobile_sales_item.dart';
import 'package:sales_management_system/Core/Components/home/unload_sales_table.dart';

import 'package:sales_management_system/Core/Constants/theme.dart';
import 'package:sales_management_system/Core/helper/services/Report/GetReport2DateService.dart';
import 'package:sales_management_system/Core/helper/services/home/get_all_branchesServices.dart';
import 'package:sales_management_system/Core/helper/services/home/get_all_sales_value_service.dart';
import 'package:sales_management_system/Core/helper/shared/shared.dart';
import 'package:sales_management_system/Models/home/get_all_branches.dart';
import 'package:sales_management_system/Models/home/get_all_sales_value.dart';
import 'package:sales_management_system/Models/reports/GetReport2DateModel.dart';
import 'package:sales_management_system/Views/reports/reports_desktop_layout.dart';

class MobileLayoutReportsPage extends StatefulWidget {
  const MobileLayoutReportsPage(BuildContext context, {super.key});

  @override
  State<MobileLayoutReportsPage> createState() =>
      _MobileLayoutReportsPageState();
}

class _MobileLayoutReportsPageState extends State<MobileLayoutReportsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isDataBetween2DateLoading = false;
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
      body: defultData.isEmpty
          ? const Center(
              // Show a loading indicator while data is being fetched
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15))),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(children: [
                              Text(
                                "Mounthly Report".tr,
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              const Spacer(flex: 1),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: CustomeElevatedButton(
                                  buttonChild: Text(
                                    'Pick a Date'.tr,
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
                                              padding: const EdgeInsets.only(
                                                  top: 50.0),
                                              child: SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.7,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.8,
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
                                    isDataBetween2DateLoading = true;
                                    dataBetweenTwoDate =
                                        await GetReport2DateService(Dio())
                                            .getReport2DateService(
                                                startDate: formattedStartDate,
                                                endDate: formattedEndDate);
                                    setState(() {
                                      isReportDataDefult = false;
                                      isDataBetween2DateLoading = false;
                                    });
                                  },
                                ),
                              ),
                              ExportButton(
                                isInvoices: false,
                                pdfUrl:
                                    '$zakBasicUrl/branches-Sales/PDFForm?start_date=$formattedStartDate&end_date=$formattedEndDate',
                                excelUrl:
                                    '$zakBasicUrl/branches-Sales/ExcelForm?start_date=$formattedStartDate&end_date=$formattedEndDate',
                                scaffoldKey: _scaffoldKey,
                              ),
                            ]),
                          ),
                        ),
                        isDataBetween2DateLoading
                            ? Center(
                                child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: UnloadedItem(
                                  width: MediaQuery.of(context).size.width,
                                  height: 220,
                                ),
                              ))
                            : Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: selectedStartDateRange == null ||
                                          selectedEndDateRange == null
                                      ? defultData.length
                                      :
                                      //Cause when i choose 2 date, dataBetweenTwoDate.length become 0 while the data are coming from API
                                      dataBetweenTwoDate.isEmpty
                                          ? dataBetweenTwoDate.length
                                          : dataBetweenTwoDate.length - 1,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0),
                                      child: MobileSalesItem(
                                        branch:
                                            selectedStartDateRange == null ||
                                                    selectedEndDateRange == null
                                                ? defultData[index]
                                                : dataBetweenTwoDate[index],
                                        index: index,
                                      ),
                                    );
                                  },
                                ),
                              ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                              '${dataBetweenTwoDate.isNotEmpty ? dataBetweenTwoDate[dataBetweenTwoDate.length - 1].total : totalSales.total}${"total-price".tr}'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
