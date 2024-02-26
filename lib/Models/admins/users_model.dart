
class ListUserModel {
  ListUserModel({
    required this.code,
    required this.message,
    required this.data,
  });
  late final int code;
  late final String message;
  late final Data data;
  
  ListUserModel.fromJson(Map<String, dynamic> json){
    code = json['code'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.UsersCount,
    required this.users,
  });
  late final int UsersCount;
  late final List<Users> users;
  
  Data.fromJson(Map<String, dynamic> json){
    UsersCount = json['Users_Count'];
    users = List.from(json['Users']).map((e)=>Users.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Users_Count'] = UsersCount;
    _data['Users'] = users.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Users {
  Users({
    required this.id,
    required this.name,
    required this.username,
  });
  late final int id;
  late final String name;
  late final String username;
  
  Users.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['username'] = username;
    return _data;
  }
}