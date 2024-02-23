import 'package:flutter/material.dart';
import 'package:sales_management_system/Core/Components/home/custome_elevated_button.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';

class SalesTable extends StatelessWidget {
  const SalesTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
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
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Sales Table',
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
                          "All",
                          style:
                              TextStyle(color: ThemeColors.secondaryTextColor),
                        ),
                        buttonColor: ThemeColors.secondary,
                        onPressed: () {
                          //HERE U SHOULD LINK WITH API
                        },
                      ),
                    ),
                    CustomeElevatedButton(
                      buttonChild: const Text(
                        "New",
                        style: TextStyle(color: ThemeColors.secondaryTextColor),
                      ),
                      buttonColor: ThemeColors.secondary,
                      onPressed: () {
                        //HERE U SHOULD LINK WITH API
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
                          'الفرع',
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
                DataColumn(
                  label: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'التفاصيل',
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
        ],
      ),
    );
  }
}

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
                child: Text(
                  'ثمانية وعشرون مليار وأربعة مائة وثمانية وعشرون مليون وخمسة مائة وثلاثة وسبعون ألف وثلاثة مائة وأربعة وخمسون فاصل أربعة إثنان خمسة',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ),
          ),
          DataCell(Center(child: Text('28428573354.424999'))),
          DataCell(Center(
            child: ElevatedButton(
              onPressed: () {
                // Handle button press for details
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ThemeColors.secondary
                    .withOpacity(1), // Set background color to red
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3), // Set border radius
                ),
              ),
              child: const Text(
                'رؤية التفاصيل...',
                style:
                    TextStyle(color: Colors.white), // Set text color to white
              ),
            ),
          )),
        ]);
  }

  @override
  int get rowCount => 50; // Total number of rows

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}

  
      // DataTable(
          //   columns: const [
          //     DataColumn(label: Text("Id")),
          //     DataColumn(label: Text("Name")),
          //     DataColumn(label: Text("Email")),
          //     DataColumn(label: Text("Address")),
          //     DataColumn(label: Text("Birthday")),
          //   ],
          //   rows: customersList
          //       .map((customer) => DataRow(cells: [
          //             DataCell(Text(customer.id)),
          //             DataCell(Text(customer.name)),
          //             DataCell(Text(customer.email)),
          //             DataCell(Text(customer.address)),
          //             DataCell(Text(customer.birthday)),
          //           ]))
          //       .toList(),
          // ),