// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class InvoicesSearchModel {
  int code;
  String message;
  InvoicesSearchDataModel data;

  InvoicesSearchModel({
    required this.code,
    required this.message,
    required this.data,
  });
}

class InvoicesSearchDataModel {
  List<InvoicefiveSearchDataModel> invoices;

  InvoicesSearchDataModel({
    required this.invoices,
  });
}

class InvoicefiveSearchDataModel {
  String guid;
  String number;
  String total;
  String spelledTotal;
  String date;
  String branch;

  InvoicefiveSearchDataModel({
    required this.guid,
    required this.number,
    required this.total,
    required this.spelledTotal,
    required this.date,
    required this.branch,
  });

  InvoicefiveSearchDataModel copyWith({
    String? guid,
    String? number,
    String? total,
    String? spelledTotal,
    String? date,
    String? branch,
  }) {
    return InvoicefiveSearchDataModel(
      guid: guid ?? this.guid,
      number: number ?? this.number,
      total: total ?? this.total,
      spelledTotal: spelledTotal ?? this.spelledTotal,
      date: date ?? this.date,
      branch: branch ?? this.branch,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'guid': guid,
      'number': number,
      'total': total,
      'spelledTotal': spelledTotal,
      'date': date,
      'branch': branch,
    };
  }

  factory InvoicefiveSearchDataModel.fromJson(Map<String, dynamic> map) {
    return InvoicefiveSearchDataModel(
      guid: map['guid'] as String,
      number: map['number'] as String,
      total: map['total'] as String,
      spelledTotal: map['spelledTotal'] as String,
      date: map['Date'] as String,
      branch: map['branch'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  // factory InvoiceSearchDataModel.fromJson(String source) =>
  //     InvoiceSearchDataModel.fromMap(json.decode(source));
  @override
  bool operator ==(covariant InvoicefiveSearchDataModel other) {
    if (identical(this, other)) return true;

    return other.guid == guid &&
        other.number == number &&
        other.total == total &&
        other.spelledTotal == spelledTotal &&
        other.date == date &&
        other.branch == branch;
  }

  @override
  int get hashCode {
    return guid.hashCode ^
        number.hashCode ^
        total.hashCode ^
        spelledTotal.hashCode ^
        date.hashCode ^
        branch.hashCode;
  }
}
