class Report2DatesModel {
    int code;
    String message;
    List<List<ReportDataModel>> data;

    Report2DatesModel({
        required this.code,
        required this.message,
        required this.data,
    });

}

class ReportDataModel {
    String? branch;
    String? number;
    String? guid;
    String spelledTotal;
    dynamic totalSales;
    dynamic total;

    ReportDataModel({
        this.branch,
        this.number,
        this.guid,
        required this.spelledTotal,
        this.totalSales,
        this.total,
    });

}
