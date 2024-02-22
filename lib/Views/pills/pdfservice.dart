import 'dart:convert';
import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class PdfService {
  Future<void> printCustomersPdf(List<DataCell> data) async {
    //Create a new PDF document
    PdfDocument document = PdfDocument();
    PdfGrid grid = PdfGrid();

    //Define number of columns in table
    grid.columns.add(count: 4);
    //Add header to the grid
    grid.headers.add(1);
    //Add the rows to the grid
    PdfGridRow header = grid.headers[0];
    header.cells[0].value = "Number";
    header.cells[1].value = "Code";
    header.cells[2].value = "Branch";
    header.cells[3].value = "Total";
    //Add header style
    header.style = PdfGridCellStyle(
      backgroundBrush: PdfBrushes.lightGray,
      textBrush: PdfBrushes.black,
      font: PdfStandardFont(PdfFontFamily.timesRoman, 12),
    );

    //Add rows to grid
    for (final pills in data) {
      PdfGridRow row = grid.rows.add();
      row.cells[0].value = 'pills.';
    row.cells[1].value = 'pills[1]';
    row.cells[2].value =' pills.email';
    row.cells[3].value = 'pills.address';
    }
    //Add rows style
    grid.style = PdfGridStyle(
      cellPadding: PdfPaddings(left: 10, right: 3, top: 4, bottom: 5),
      backgroundBrush: PdfBrushes.white,
      textBrush: PdfBrushes.black,
      font: PdfStandardFont(PdfFontFamily.timesRoman, 12),
    );

    //Draw the grid
    grid.draw(
        page: document.pages.add(), bounds: const Rect.fromLTWH(0, 0, 0, 0));
    List<int> bytes = await document.save();

    //Download document
    AnchorElement(
        href:
            "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}")
      ..setAttribute("download", "report.pdf")
      ..click();

    //Dispose the document
    document.dispose();
  }
}
