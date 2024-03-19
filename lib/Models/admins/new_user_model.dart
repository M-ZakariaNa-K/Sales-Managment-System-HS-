class NewUserModel {
  NewUserModel({
    required this.code,
    required this.message,
    required this.data,
  });
  late final int code;
  late final String message;
  late final List<dynamic> data;
  
  NewUserModel.fromJson(Map<String, dynamic> json){
    code = json['code'];
    message = json['message'];
    data = List.castFrom<dynamic, dynamic>(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['message'] = message;
    _data['data'] = data;
    return _data;
  }
}