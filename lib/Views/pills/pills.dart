import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:sales_management_system/Core/Components/custome_elevated_button.dart';
import 'package:sales_management_system/Core/Components/widget.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';
import 'package:sales_management_system/Views/reports/report.dart';

class PillsPage extends StatefulWidget {
  const PillsPage({super.key});

  @override
  State<PillsPage> createState() => _PillsPageState();
}

class _PillsPageState extends State<PillsPage> {
  DateTime? selectedStartDateRange;
  DateTime? selectedEndDateRange;
  final pdf = pw.Document();

  @override
  Widget build(BuildContext context) {
    final MediaQueryData = MediaQuery.of(context);
    final horizontalPadding = MediaQueryData.size.width;
    final verticalPadding = MediaQueryData.size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: ThemeColors.secondary,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              width: 2,
              color: Colors.grey,
            ),
          ),
          width: horizontalPadding * 0.63,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'مبيعات الفرع ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: ThemeColors.primaryTextColor,
                      ),
                    ),
                    Row(
                      children: [
                        Text("شهر:"),
                        SizedBox(width: 20),
                        CustomeElevatedButton(
                          buttonChild: const Text(
                            "Export",
                            style: TextStyle(
                                color: ThemeColors.secondaryTextColor),
                          ),
                          buttonColor: ThemeColors.secondary,
                          onPressed: () {
                            Get.to(ReportsPage());
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
                  headingRowColor:
                      MaterialStateColor.resolveWith((states) => Colors.white),
                  // header: const Text(
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
              Text('السعر الاجمالي'),
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
          DataCell(Center(child: Text('زبلطاني محل '))),
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
          DataCell(Center(child: Text('28428573354.424999'))),
        ]);
  }

  @override
  int get rowCount => 50; // Total number of rows

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
