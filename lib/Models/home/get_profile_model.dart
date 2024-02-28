class GetProfileModel {
  int code;
  String message;
  GetProfileDataModel data;

  GetProfileModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory GetProfileModel.fromJson(Map<String, dynamic> json) =>
      GetProfileModel(
        code: json["code"],
        message: json["message"],
        data: GetProfileDataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class GetProfileDataModel {
  int id;
  String name;
  String username;
  String password;
  List<dynamic> permissions;

  GetProfileDataModel({
    required this.id,
    required this.name,
    required this.username,
    required this.password,
    required this.permissions,
  });

  factory GetProfileDataModel.fromJson(Map<String, dynamic> json) =>
      GetProfileDataModel(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        password: json["password"],
        permissions: List<String>.from(json["permissions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "password": password,
        "permissions": List<dynamic>.from(permissions.map((x) => x)),
      };
}
