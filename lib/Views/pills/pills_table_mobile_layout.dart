import 'package:flutter/material.dart';

import 'package:sales_management_system/Core/Constants/theme.dart';
import 'package:sales_management_system/Models/home/get_all_branches.dart';

class MobileLayoutPillsTable extends StatefulWidget {
  const MobileLayoutPillsTable(BuildContext context, {super.key});

  @override
  State<MobileLayoutPillsTable> createState() =>
      _MobileLayoutPillsTableState();
}

class _MobileLayoutPillsTableState extends State<MobileLayoutPillsTable> {
  
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
                      const Text("التقرير الشهري"),
                      const Spacer(),
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
                            child: const Text('Export')),
                      ),
                    ]),
                  ),
                ),
                Container(
                  decoration:
                      BoxDecoration(color: Colors.white.withOpacity(.8)),
                  width: horizontalPadding * .9,
                  child: const Padding(
                    padding:  EdgeInsets.all(18.0),
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
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      )),
                  width: horizontalPadding * .9,
                  height: verticalPadding * .5,
                  child: ListView.builder(
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: horizontalPadding * .7,
                        height: verticalPadding * .1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Row(
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
