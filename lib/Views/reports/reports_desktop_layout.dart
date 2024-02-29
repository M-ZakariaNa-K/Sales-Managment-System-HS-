import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:sales_management_system/Core/Components/custome_elevated_button.dart';
import 'package:sales_management_system/Core/Components/widget.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';

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
                  source: SalesDataSource(),
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

class SalesDataSource extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    // Implement logic to get data for each row based on index
    // Return DataRow widget with appropriate data
    return DataRow(
        color: MaterialStateColor.resolveWith((states) {
          // Define color based on MaterialState
          return Colors.white; // Default color
        }),
        cells: [
          DataCell(Center(child: Text(04.toString()))),
          const DataCell(Center(child: Text('زبلطاني محل '))),
          DataCell(
            Center(
              child: Container(
                width: 300,
                child: const Text(
                  'ثمانية وعشرون مليار وأربعة مائة وثمانية وعشرون مليون وخمسة مائة وثلاثة وسبعون ألف وثلاثة مائة وأربعة وخمسون فاصل أربعة إثنان خمسة',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ),
          ),
          const DataCell(Center(child: Text('28428573354.424999'))),
        ]);
  }

  @override
  int get rowCount => 50; // Total number of rows

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
