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
  const ExportButton(
      {Key? key,
      required this.pdfUrl,
      required this.excelUrl,
      @required this.scaffoldKey})
      : super(key: key);

  final String excelUrl;
  final String pdfUrl;
  final dynamic scaffoldKey;
  Future<void> _downloadExcel(BuildContext context, String apiExcelEndpoint,
      String apiPdfEndpoint) async {
    try {
      // Show a loading indicator while downloading
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 2),
          backgroundColor: ThemeColors.primary,
          content: Row(
            children: [
              const CircularProgressIndicator(
                color: ThemeColors.secondary,
              ),
              const SizedBox(width: 10),
              Text("Downloading Excel file...".tr),
            ],
          ),
        ),
      );

      String apiEndpoint = excelUrl;

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
      // Show a loading indicator while downloading
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 2),
          backgroundColor: ThemeColors.primary,
          content: Row(
            children: [
              const CircularProgressIndicator(
                color: ThemeColors.secondary,
              ),
              const SizedBox(width: 10),
              Text("Downloading PDF file...".tr),
            ],
          ),
        ),
      );

      String apiEndpoint = pdfUrl;

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
      print('Error downloading Pdf file: $error');
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
        buttonChild:Text(
          "Export".tr,
          style:const  TextStyle(color: ThemeColors.secondaryTextColor),
        ),
        buttonColor: !isUser ? ThemeColors.secondary : Colors.grey,
        onPressed: !isUser
            ? () {
                showDialog(
                    context: scaffoldKey?.currentContext,
                    builder: (context) => AlertDialog(
                          title: Text('Save As?'.tr),
                          content: Row(
                            children: [
                              TextButton(
                                onPressed: () => _downloadExcel(
                                  context,
                                  excelUrl,
                                  pdfUrl,
                                ),
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
