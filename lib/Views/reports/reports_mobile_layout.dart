import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:sales_management_system/Core/Components/components.dart';

import 'package:sales_management_system/Core/Components/custome_elevated_button.dart';
import 'package:sales_management_system/Core/Components/home/Circle_image.dart';
import 'package:sales_management_system/Core/Components/home/sales_table&image_sliderRow/mobile_sales_items_list.dart';
import 'package:sales_management_system/Core/Components/widget.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';
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
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.8),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  width: horizontalPadding * .9,
                  height: verticalPadding * .1,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(children: [
                      Text("التقرير الشهري"),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton(
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
                            child: Text('Export')),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton(
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
                            child: Text('Pick a date')),
                      ),
                    ]),
                  ),
                ),
                Container(
                  decoration:
                      BoxDecoration(color: Colors.white.withOpacity(.8)),
                  width: horizontalPadding * .9,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      children: [
                        Text("الفرع"),
                        Spacer(),
                        Text("السعر الإجمالي"),
                        Spacer(),
                        Text('Code'),
                        Spacer(),
                        Text('الشهر')
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.8),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      )),
                  width: horizontalPadding * .9,
                  height: verticalPadding * .5,
                  child: ListView.builder(
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        width: horizontalPadding * .7,
                        height: verticalPadding * .1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('اسم الفرع'),
                              Spacer(),
                              Text('السعر الإجمالي'),
                              Spacer(),
                              Text('الرمز'),
                              Spacer(),
                              Text('الشهر'),
                            ]),
                      ),
                    ),
                    itemCount: 5,
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
