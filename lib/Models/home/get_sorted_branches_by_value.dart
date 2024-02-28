class GetSortedBranchesByValueModel {
    int code;
    String message;
    List<Datum> data;

    GetSortedBranchesByValueModel({
        required this.code,
        required this.message,
        required this.data,
    });

    factory GetSortedBranchesByValueModel.fromJson(Map<String, dynamic> json) => GetSortedBranchesByValueModel(
        code: json["code"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String branch;
    String number;
    String guid;
    String spelledTotal;
    String totalSales;

    Datum({
        required this.branch,
        required this.number,
        required this.guid,
        required this.spelledTotal,
        required this.totalSales,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        branch: json["branch"],
        number: json["number"],
        guid: json["GUID"],
        spelledTotal: json["spelled_total"],
        totalSales: json["total_Sales"],
    );

    Map<String, dynamic> toJson() => {
        "branch": branch,
        "number": number,
        "GUID": guid,
        "spelled_total": spelledTotal,
        "total_Sales": totalSales,
    };
}
