class UserModel {
  int? code;
  String? message;
  Data? data;

  UserModel({this.code, this.message, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? userId;
  String? token;
  bool? isAdmin;
  bool? hasPdf;
  bool? hasExcel;

  Data({this.userId, this.token, this.isAdmin, this.hasPdf, this.hasExcel});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user id'];
    token = json['token'];
    isAdmin = json['is admin'];
    hasPdf = json['has pdf'];
    hasExcel = json['has excel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user id'] = this.userId;
    data['token'] = this.token;
    data['is admin'] = this.isAdmin;
    data['has pdf'] = this.hasPdf;
    data['has excel'] = this.hasExcel;
    return data;
  }
}