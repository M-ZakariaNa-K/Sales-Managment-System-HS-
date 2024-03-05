import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_management_system/Core/Components/home/custome_elevated_button.dart';
import 'package:sales_management_system/Core/Components/home/unload_sales_table.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';
import 'package:sales_management_system/Core/helper/services/home/get_all_branchesServices.dart';
import 'package:sales_management_system/Core/helper/services/home/get_all_branches_sorted_by_valueService.dart';
import 'package:sales_management_system/Models/home/get_all_branches.dart';
import 'package:sales_management_system/Views/pills/pills.dart';

String publicGuidVar = "";

class SalesTable extends StatefulWidget {
  const SalesTable({Key? key}) : super(key: key);

  @override
  State<SalesTable> createState() => _SalesTableState();
}

class _SalesTableState extends State<SalesTable> {
  List<BranchDataModel> data = [];
  bool isAllPressed = true;
  bool isNewPressed = false;
  bool isTableLoading = true;

  @override
  void initState() {
    super.initState();
    // Fetch all sales data by default
    _fetchAllSalesData();
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    super.dispose();
  }

  // Method to fetch all sales data
  Future<void> _fetchAllSalesData() async {
    List<BranchDataModel> newData =
        await GetAllBranchesService(Dio()).getAllBranchesService();
    if (mounted) {
      setState(() {
        data = newData;
        isTableLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return !isTableLoading
        ? Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: ThemeColors.secondary.withOpacity(.4),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                width: 2,
                color: Colors.grey,
              ),
            ),
            width: MediaQuery.of(context).size.width * 0.63,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '2'.tr,
                        style:const TextStyle(
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
                                "46".tr,
                                style: const TextStyle(color: Colors.white),
                              ),
                              buttonColor: isAllPressed
                                  ? ThemeColors.secondary
                                  : ThemeColors.secondary.withOpacity(.3),
                              onPressed: () async {
                                // Fetch all sales data
                                _fetchAllSalesData();
                                if (mounted) {
                                  setState(() {
                                    isAllPressed = true;
                                    isNewPressed = false;
                                  });
                                }
                              },
                            ),
                          ),
                          CustomeElevatedButton(
                            buttonChild: Text(
                              "45".tr,
                              style: const TextStyle(color: Colors.white),
                            ),
                            buttonColor: isNewPressed
                                ? ThemeColors.secondary
                                : ThemeColors.secondary.withOpacity(.3),
                            onPressed: () async {
                              // Fetch sorted sales data
                              List<BranchDataModel> newData =
                                  await GetAllBranchesSortedByValueService(
                                          Dio())
                                      .getAllBranchesService();
                              if (mounted) {
                                setState(() {
                                  data = newData;
                                  isAllPressed = false;
                                  isNewPressed = true;
                                });
                              }
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
                    rowsPerPage: 10, // Number of rows per page
                    columns: [
                      DataColumn(
                        label: Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '35'.tr,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
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
                                '34'.tr,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
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
                                '37'.tr,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
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
                                '38'.tr,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
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
                                '44'.tr,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                    source: SalesDataSource(context: context, data: data),
                  ),
                ),
              ],
            ),
          )
        : UnloadedItem(
            width: MediaQuery.of(context).size.width * 0.63,
            height: MediaQuery.of(context).size.height * 0.71,
          );
  }
}

class SalesDataSource extends DataTableSource {
  BuildContext context;
  SalesDataSource({required this.context, @required this.data});
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
      DataCell(Center(
        child: ElevatedButton(
          onPressed: () {
            publicGuidVar = rowData.guid!;
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PillsPage(
                                          total:rowData.totalSales,

                  context,
                  guid: rowData.guid!,
                  branchName: rowData.branch!,
                ),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: ThemeColors.secondary
                .withOpacity(1), // Set background color to red
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3), // Set border radius
            ),
          ),
          child: Text(
            '43'.tr,
            style:
                const TextStyle(color: Colors.white), // Set text color to white
          ),
        ),
      )),
    ]);
  }

  @override
  int get rowCount => data?.length ?? 0;
  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
