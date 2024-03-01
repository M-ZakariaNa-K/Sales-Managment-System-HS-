import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:sales_management_system/Core/Components/custome_elevated_button.dart';
import 'package:sales_management_system/Core/Components/home/sales_table&image_sliderRow/mobile_sales_item.dart';
import 'package:sales_management_system/Core/Components/home/unload_sales_table.dart';

import 'package:sales_management_system/Core/Constants/theme.dart';
import 'package:sales_management_system/Core/helper/services/home/get_all_branchesServices.dart';
import 'package:sales_management_system/Models/home/get_all_branches.dart';

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

  @override
  Widget build(BuildContext context) {
    final MediaQueryData = MediaQuery.of(context);
    final horizontalPadding = MediaQueryData.size.width;
    final verticalPadding = MediaQueryData.size.height;
    final BranchDataModel branch;
    final int index;

    return Scaffold(
      backgroundColor: ThemeColors.secondary,
      body: Padding(
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
                  width: horizontalPadding * .9,
                  height: verticalPadding * .1,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(children: [
                      const Text(
                        "التقرير الشهري",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          width: horizontalPadding * .001,
                          child: CustomeElevatedButton(
                            buttonChild: const Text('Export'),
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
                        ),
                      ),
                      CustomeElevatedButton(
                        buttonChild: const Text(
                          'Pick a date',
                          style:
                              TextStyle(color: ThemeColors.secondaryTextColor),
                        ),
                        buttonColor: ThemeColors.secondary,
                        onPressed: () async {
                          final DateTimeRange? picked =
                              await showDateRangePicker(
                            context: context,
                            initialDateRange: DateTimeRange(
                              start: DateTime.now(),
                              end:
                                  DateTime.now().add(const Duration(days: 100)),
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
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: FutureBuilder(
                    future:
                        GetAllBranchesService(Dio()).getAllBranchesService(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // While data is loading, return a loading indicator or any other placeholder widget
                        return UnloadedItem(
                          width: MediaQuery.of(context).size.width,
                          height: 250,
                        );
                      } else if (snapshot.hasError) {
                        // If there is an error, display an error message
                        return Text('Error: ${snapshot.error}');
                      } else {
                        // If data is successfully fetched, build the list of MobileSalesItem widgets
                        List<BranchDataModel> data = snapshot.data!;
                        BranchDataModel b1 = BranchDataModel(
                            branch: '34'.tr,
                            number: '35'.tr,
                            guid: '36'.tr,
                            spelledTotal: '37'.tr,
                            totalSales: '38'.tr);
                        return ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: MobileSalesItem(
                                  branch: data[index], index: index),
                            );
                          },
                        );
                        //     ListView(
                        //         children: List.generate(
                        //   data.length,
                        //   (index) => MobileSalesItem(branch: data[index], index: index),
                        // ));
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
