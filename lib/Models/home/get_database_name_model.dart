class GetAllDatabsNameModel {
    int code;
    String message;
    GetDatabsNameModel data;

    GetAllDatabsNameModel({
        required this.code,
        required this.message,
        required this.data,
    });

    factory GetAllDatabsNameModel.fromJson(Map<String, dynamic> json) => GetAllDatabsNameModel(
        code: json["code"],
        message: json["message"],
        data: GetDatabsNameModel.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
    };
}

class GetDatabsNameModel {
    String name;

    GetDatabsNameModel({
        required this.name,
    });

    factory GetDatabsNameModel.fromJson(Map<String, dynamic> json) => GetDatabsNameModel(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}
