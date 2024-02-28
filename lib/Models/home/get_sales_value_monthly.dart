class SalesValueMonthlyModel {
  int code;
  String message;
  List<SalesInMonthModel> data;

  SalesValueMonthlyModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory SalesValueMonthlyModel.fromJson(Map<String, dynamic> json) =>
      SalesValueMonthlyModel(
        code: json["code"],
        message: json["message"],
        data: List<SalesInMonthModel>.from(
            json["data"].map((x) => SalesInMonthModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class SalesInMonthModel {
  int month;
  dynamic total;

  SalesInMonthModel({
    required this.month,
    required this.total,
  });

  factory SalesInMonthModel.fromJson(Map<String, dynamic> json) =>
      SalesInMonthModel(
        month: json["month"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "month": month,
        "total": total,
      };
}
