class AllSalesValuesModel {
    int code;
    String message;
    List<AllSalesValuesDataModel> data;

    AllSalesValuesModel({
        required this.code,
        required this.message,
        required this.data,
    });

    factory AllSalesValuesModel.fromJson(Map<String, dynamic> json) => AllSalesValuesModel(
        code: json["code"],
        message: json["message"],
        data: List<AllSalesValuesDataModel>.from(json["data"].map((x) => AllSalesValuesDataModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class AllSalesValuesDataModel {
    String spelledTotal;
    String total;

    AllSalesValuesDataModel({
        required this.spelledTotal,
        required this.total,
    });

    factory AllSalesValuesDataModel.fromJson(Map<String, dynamic> json) => AllSalesValuesDataModel(
        spelledTotal: json["spelled_total"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "spelled_total": spelledTotal,
        "total": total,
    };
}
