class UserInfoModel {
  UserInfoModel({
    required this.code,
    required this.message,
    required this.data,
  });
  late final int code;
  late final String message;
  late final UserDataModel data;
  
  UserInfoModel.fromJson(Map<String, dynamic> json){
    code = json['code'];
    message = json['message'];
    data = UserDataModel.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class UserDataModel {
  UserDataModel({
    required this.id,
    required this.name,
    required this.username,
    required this.password,
    required this.permissions,
  });
  late final int id;
  late final String name;
  late final String username;
  late final String password;
  late final List<String> permissions;
  
  UserDataModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    username = json['username'];
    password = json['password'];
    permissions = List.castFrom<dynamic, String>(json['permissions']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['username'] = username;
    _data['password'] = password;
    _data['permissions'] = permissions;
    return _data;
  }
}