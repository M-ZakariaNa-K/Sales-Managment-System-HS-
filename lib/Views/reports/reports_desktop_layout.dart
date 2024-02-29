import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:sales_management_system/Core/Components/custome_elevated_button.dart';
import 'package:sales_management_system/Core/Components/widget.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';
import 'package:sales_management_system/Core/helper/services/home/get_all_branchesServices.dart';
import 'package:sales_management_system/Models/home/get_all_branches.dart';

class DesktopLayoutReportsPage extends StatefulWidget {
  const DesktopLayoutReportsPage(BuildContext context, {super.key});

  @override
  State<DesktopLayoutReportsPage> createState() =>
      _DesktopLayoutReportsPageState();
}

class _DesktopLayoutReportsPageState extends State<DesktopLayoutReportsPage> {
  DateTime? selectedStartDateRange;
  DateTime? selectedEndDateRange;
  final pdf = pw.Document();
  List<BranchDataModel> defultData = [];
  //NOTE(from ZAKARIA):  dataBetweenTwoDate list will showen when user choose 2 dates
  //we use it in sourse in PagenatedDataTable
  // List<BranchDataBetweenTwoDateModel> dataBetweenTwoDate=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchReportData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // Method to fetch all sales data
  Future<void> _fetchReportData() async {
    List<BranchDataModel> newData =
        await GetAllBranchesService(Dio()).getAllBranchesService();
    if (mounted) {
      setState(() {
        defultData = newData;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData = MediaQuery.of(context);
    final horizontalPadding = MediaQueryData.size.width;
    final verticalPadding = MediaQueryData.size.height;

    return Scaffold(
      backgroundColor: ThemeColors.secondary,
      body: Center(
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
          // width: horizontalPadding * 0.63,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'تقرير الفرع',
                      style: TextStyle(
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
                            buttonChild: const Text(
                              "Pick a Date",
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
                              onDateSaved() {
                                //NOTE(from ZAKARIA): Here we will call the data from API between the 2 selected Date
                              }
                              if (picked != null &&
                                  // ignore: unrelated_type_equality_checks
                                  picked != selectedStartDateRange) {
                                setState(() {
                                  selectedStartDateRange = picked.start;
                                  selectedEndDateRange = picked.end;
                                });
                              }
                            },
                          ),
                        ),
                        CustomeElevatedButton(
                          buttonChild: const Text(
                            "Export",
                            style: TextStyle(
                                color: ThemeColors.secondaryTextColor),
                          ),
                          buttonColor: ThemeColors.secondary,
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: const Text('Save As?'),
                                      content: Row(
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              TextButton(
                                                onPressed: () {},
                                                child: Image.asset(
                                                  'images/excel.png',
                                                  height: 150,
                                                  width: 150,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              TextButton(
                                                  onPressed: () {},
                                                  child: Image.asset(
                                                    'images/pdf.png',
                                                    height: 150,
                                                    width: 150,
                                                  )),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ));
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: PaginatedDataTable(
                  // headingRowColor:
                  //     MaterialStateColor.resolveWith((states) => Colors.white),
                  // // header: const Text(
                  //   'Sales Table',
                  //   style: TextStyle(fontWeight: FontWeight.bold),
                  // ),
                  //here data.length && numOfBranshes should has same value and put it in pieChart
                  rowsPerPage: 10, // Number of rows per page
                  columns: const [
                    DataColumn(
                      label: Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'الرقم',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'التاريخ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'الإجمالي كتابةً',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'الإجمالي رقماً',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  source: ReportDataSource(
                      context: context,
                      data: selectedStartDateRange == null ||
                              selectedEndDateRange == null
                          ? defultData
                          : []),
                ),
              ),
              const Text('السعر الاجمالي'),
            ],
          ),
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> data = List.generate(200, (index) {
  pillsIndex = index;
  return {
    "Number": "${pills[1].number}",
    "Code": "${pills[1].code}",
    "Branch": "${pills[1].branch}",
    "Total": "${pills[1].total}",
  };
});

class ReportDataSource extends DataTableSource {
  BuildContext context;
  ReportDataSource({required this.context, @required this.data});
  final List<BranchDataModel>? data;
  @override
  DataRow? getRow(
    int index,
  ) {
    // Implement logic to get data for each row based on index
    // Return DataRow widget with appropriate data
    // Check if index is within bounds of data
    if (index >= data!.length) {
      return null;
    }
    final rowData = data![index];

    return DataRow(cells: [
      DataCell(Center(child: Text(rowData.number!))),
      DataCell(Center(child: Text(rowData.branch!))),
      DataCell(
        Center(
          child: SizedBox(
            width: 300,
            child: Text(
              rowData.spelledTotal!,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ),
      ),
      DataCell(Center(child: Text("${rowData.totalSales!}"))),
    ]);
  }

  @override
  int get rowCount => data?.length ?? 0;
  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
