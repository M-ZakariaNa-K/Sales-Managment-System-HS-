class GetDatabasesListModel {
  int code;
  String message;
  List<GetDatabasesListDataModel> data;

  GetDatabasesListModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory GetDatabasesListModel.fromJson(Map<String, dynamic> json) =>
      GetDatabasesListModel(
        code: json["code"],
        message: json["message"],
        data: List<GetDatabasesListDataModel>.from(
            json["data"].map((x) => GetDatabasesListDataModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class GetDatabasesListDataModel {
  String databaseName;

  GetDatabasesListDataModel({
    required this.databaseName,
  });

  factory GetDatabasesListDataModel.fromJson(Map<String, dynamic> json) =>
      GetDatabasesListDataModel(
        databaseName: json["database_name"],
      );

  Map<String, dynamic> toJson() => {
        "database_name": databaseName,
      };
}
