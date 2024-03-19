class GetNumOfBranchsModel {
    int code;
    String message;
    int data;

    GetNumOfBranchsModel({
        required this.code,
        required this.message,
        required this.data,
    });

    factory GetNumOfBranchsModel.fromJson(Map<String, dynamic> json) => GetNumOfBranchsModel(
        code: json["code"],
        message: json["message"],
        data: json["data"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data,
    };
}
