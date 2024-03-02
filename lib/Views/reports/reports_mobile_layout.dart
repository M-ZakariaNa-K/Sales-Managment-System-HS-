import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:sales_management_system/Core/Components/Report/export_button.dart';
import 'package:sales_management_system/Core/Components/custome_elevated_button.dart';
import 'package:sales_management_system/Core/Components/home/sales_table&image_sliderRow/mobile_sales_item.dart';
import 'package:sales_management_system/Core/Components/home/unload_sales_table.dart';

import 'package:sales_management_system/Core/Constants/theme.dart';
import 'package:sales_management_system/Core/helper/services/Report/GetReport2DateService.dart';
import 'package:sales_management_system/Core/helper/services/home/get_all_branchesServices.dart';
import 'package:sales_management_system/Core/helper/services/home/get_all_sales_value_service.dart';
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
  DateTime? selectedStartDateRange;
  DateTime? selectedEndDateRange;
  final pdf = pw.Document();
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
                          // width: horizontalPadding * .9,
                          // height: verticalPadding * .1,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(children: [
                              const Text(
                                "التقرير الشهري",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              const Spacer(flex: 1),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: CustomeElevatedButton(
                                  buttonChild: const Text(
                                    'Pick a date',
                                    style: TextStyle(
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
                                    );
                                    if (picked != null &&
                                        // ignore: unrelated_type_equality_checks
                                        picked != selectedStartDateRange) {
                                      setState(() {
                                        selectedStartDateRange = picked.start;
                                        selectedEndDateRange = picked.end;
                                      });
                                    }
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
                                startDate: formattedStartDate,
                                endDate: formattedEndDate,
                              ),
                            ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: selectedStartDateRange == null ||
                                    selectedEndDateRange == null
                                ? defultData.length
                                : dataBetweenTwoDate.length - 1,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: MobileSalesItem(
                                  branch: selectedStartDateRange == null ||
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

//  selectedStartDateRange == null ||
//                               selectedEndDateRange == null
//                           ? defultData,
