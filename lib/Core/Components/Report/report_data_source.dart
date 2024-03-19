import 'package:flutter/material.dart';
import 'package:sales_management_system/Views/reports/reports_desktop_layout.dart';

class ReportDataSource extends DataTableSource {
  BuildContext context;
  ReportDataSource({required this.context, @required this.data});
  final List<dynamic>? data;
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: SizedBox(
                  width: 300,
                  child: Text(
                    rowData.spelledTotal!,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      DataCell(Center(child: Text("${rowData.totalSales!}"))),
    ]);
  }

  @override
  int get rowCount => isReportDataDefult ? data!.length : data!.length - 1;
  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
