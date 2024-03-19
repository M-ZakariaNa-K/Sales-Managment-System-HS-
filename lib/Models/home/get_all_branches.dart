class GetAllBranchesModel {
  int code;
  String message;
  BranchDataModel data;

  GetAllBranchesModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory GetAllBranchesModel.fromJson(Map<String, dynamic> json) =>
      GetAllBranchesModel(
        code: json["code"],
        message: json["message"],
        data: BranchDataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class BranchDataModel {
  String? branch;
  String? number;
  String? guid;
  String? spelledTotal;
  dynamic totalSales;

  BranchDataModel({
    required this.branch,
    required this.number,
    required this.guid,
    required this.spelledTotal,
    required this.totalSales,
  });

  factory BranchDataModel.fromJson(Map<String, dynamic> json) =>
      BranchDataModel(
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
