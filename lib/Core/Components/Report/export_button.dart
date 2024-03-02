// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:html' as html;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sales_management_system/Core/Components/home/custome_elevated_button.dart';
import 'package:sales_management_system/Core/Components/widget.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';
import 'package:sales_management_system/Core/helper/shared/shared.dart';

class ExportButton extends StatelessWidget {
  const ExportButton({
    Key? key,
    required this.startDate,
    required this.endDate,
  }) : super(key: key);
  final String startDate;
  final String endDate;
  Future<void> _downloadExcel(BuildContext context) async {
    try {
      // Replace 'YOUR_API_ENDPOINT' with your actual API endpoint

      String apiEndpoint =
          'http://127.0.0.1:8000/api/branches-Sales/ExcelForm?start_date=$startDate&end_date=$endDate';

      // Make a GET request using Dio

      var response = await Dio().get(
        apiEndpoint,
        options: Options(
          responseType: ResponseType.bytes,
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      ); // Convert the response data to bytes
      List<int> bytes = response.data;

      // Create a blob from the bytes
      final blob = html.Blob([bytes]);

      // Create a download URL for the blob
      final url = html.Url.createObjectUrlFromBlob(blob);

      // Create a link element and click it to trigger the download
      final anchor = html.AnchorElement(href: url)
        ..setAttribute("download", "report.xlsx")
        ..click();

      // Revoke the URL to release memory
      html.Url.revokeObjectUrl(url);
    } catch (error) {
      print('Error downloading Excel file: $error');
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: ThemeColors.primary,
          content: Text('Error downloading Excel file. Please try again later.',
              style: TextStyle(color: ThemeColors.secondaryTextColor)),
        ),
      );
    }
  }

  Future<void> _downloadPdf(BuildContext context) async {
    try {
      // Replace 'YOUR_API_ENDPOINT' with your actual API endpoint

      String apiEndpoint =
          'http://127.0.0.1:8000/api/branches-Sales/PDFForm?start_date=$startDate&end_date=$endDate';

      // Make a GET request using Dio

      var response = await Dio().get(
        apiEndpoint,
        options: Options(
          responseType: ResponseType.bytes,
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      ); // Convert the response data to bytes
      List<int> bytes = response.data;

      // Create a blob from the bytes
      final blob = html.Blob([bytes]);

      // Create a download URL for the blob
      final url = html.Url.createObjectUrlFromBlob(blob);

      // Create a link element and click it to trigger the download
      final anchor = html.AnchorElement(href: url)
        ..setAttribute("download", "report.pdf")
        ..click();

      // Revoke the URL to release memory
      html.Url.revokeObjectUrl(url);
    } catch (error) {
      print('Error downloading Excel file: $error');
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: ThemeColors.primary,
          content: Text(
            'Error downloading pdf file. Please try again later.',
            style: TextStyle(color: ThemeColors.secondaryTextColor),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomeElevatedButton(
        buttonChild: const Text(
          "Export",
          style: TextStyle(color: ThemeColors.secondaryTextColor),
        ),
        buttonColor: !isUser ? ThemeColors.secondary : Colors.grey,
        onPressed: !isUser
            ? () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text('Save As?'.tr),
                          content: Row(
                            children: [
                              TextButton(
                                onPressed: () => _downloadExcel(context),
                                child: Image.asset(
                                  'images/excel.png',
                                  height: 90,
                                  width: 90,
                                ),
                              ),
                              TextButton(
                                  onPressed: () => _downloadPdf(context),
                                  child: Image.asset(
                                    'images/pdf.png',
                                    height: 100,
                                    width: 100,
                                  )),
                            ],
                          ),
                        ));
              }
            : () {});
  }
}
