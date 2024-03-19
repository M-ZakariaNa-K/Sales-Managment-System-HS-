class GetGreatestBranchValueModel {
    int code;
    String message;
    GetGreatestBranchValueDataModel data;

    GetGreatestBranchValueModel({
        required this.code,
        required this.message,
        required this.data,
    });

    factory GetGreatestBranchValueModel.fromJson(Map<String, dynamic> json) => GetGreatestBranchValueModel(
        code: json["code"],
        message: json["message"],
        data: GetGreatestBranchValueDataModel.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
    };
}

class GetGreatestBranchValueDataModel {
    String branch;
    String number;
    String guid;
    String spelledTotal;
    String totalSales;

    GetGreatestBranchValueDataModel({
        required this.branch,
        required this.number,
        required this.guid,
        required this.spelledTotal,
        required this.totalSales,
    });

    factory GetGreatestBranchValueDataModel.fromJson(Map<String, dynamic> json) => GetGreatestBranchValueDataModel(
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
