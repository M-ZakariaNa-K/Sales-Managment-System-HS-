import 'package:sales_management_system/Core/Components/widget.dart';
import 'package:sales_management_system/Views/pills/pdfservice.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pdf/widgets.dart' as pw;

class PillsPage extends StatefulWidget {
  const PillsPage({super.key});

  @override
  State<PillsPage> createState() => _PillsPageState();
}

class _PillsPageState extends State<PillsPage> {
  // ignore: prefer_typing_uninitialized_variables
  var selectedStartDateRange;

  // ignore: prefer_typing_uninitialized_variables
  var selectedEndDateRange;
  final DataTableSource dataSource = MyData();
  final pdf = pw.Document();
  MyData? data1;

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final MediaQueryData = MediaQuery.of(context);
    final horizontalPadding = MediaQueryData.size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 20,
            left: horizontalPadding * 0.2,
            child: Text(
              'Sales Table',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      color: Colors.black,
                      height: horizontalPadding * .4,
                      width: horizontalPadding * .5,
                      child: Column(
                        children: [
                          Container(
                              child: Image.asset(
                            'images/u.jpg',
                                
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)
                          ),
                          ),
                          PaginatedDataTable(
                            source: dataSource,
                            columns: const [
                              DataColumn(label: Text('Number')),
                              DataColumn(label: Text('Code')),
                              DataColumn(label: Text('Branch')),
                              DataColumn(label: Text('Total')),
                            ],
                            columnSpacing: 200,
                            rowsPerPage: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    child: Row(
                      children: [
                        TextButton(
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
                                picked != selectedStartDateRange) {
                              setState(() {
                                selectedStartDateRange = picked.start;
                                selectedEndDateRange = picked.end;
                              });
                            }
                          },
                          child: Text(
                            selectedStartDateRange == null
                                ? 'PickDate'
                                : '${DateFormat('yyyy-MM-dd').format(selectedStartDateRange)} / ${DateFormat('yyyy-MM-dd').format(selectedEndDateRange)}',
                            style: const TextStyle(
                                fontSize: 20, color: Colors.black),
                          ),
                        ),
                        IconButton(
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
                                                    onPressed: () {
                                                      PdfService()
                                                          .printCustomersPdf(
                                                              data.cast<
                                                                  DataCell>());
                                                    },
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
                            icon: const Icon(
                              Icons.save,
                              color: Colors.black,
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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

class MyData extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(data[index]['Number'].toString())),
      DataCell(Text(data[index]['Code'].toString())),
      DataCell(Text(data[index]['Branch'].toString())),
      DataCell(Text(data[index]['Total'].toString())),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => pills.length;

  @override
  int get selectedRowCount => 0;
}
