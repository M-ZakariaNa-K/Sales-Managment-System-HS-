// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
class InvoicesListModel {
  int code;
  String message;
  Data data;

  InvoicesListModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory InvoicesListModel.fromJson(String source) =>
      InvoicesListModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory InvoicesListModel.fromMap(Map<String, dynamic> map) {
    return InvoicesListModel(
      code: map['code'] as int,
      message: map['message'] as String,
      data: Data.fromMap(map['data'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'message': message,
      'data': data.toMap(),
    };
  }

  @override
  String toString() =>
      'InvoicesListModel(code: $code, message: $message, data: $data)';
}

class Data {
  List<InvoiceModel> invoices;
  PaginationModel pagination;

  Data({
    required this.invoices,
    required this.pagination,
  });

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      invoices: List<InvoiceModel>.from(
          map['invoices'].map((x) => InvoiceModel.fromMap(x))),
      pagination:
          PaginationModel.fromMap(map['pagination'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'invoices': invoices.map((x) => x.toMap()).toList(),
      'pagination': pagination.toMap(),
    };
  }
}

class InvoiceModel {
  String guid;
  String number;
  String total;
  String spelledTotal;
  String date;
  String branch; // Changed to String from enum
  String rowNumber;

  InvoiceModel({
    required this.guid,
    required this.number,
    required this.total,
    required this.spelledTotal,
    required this.date,
    required this.branch,
    required this.rowNumber,
  });

  factory InvoiceModel.fromMap(dynamic map) {
    return InvoiceModel(
      guid: map['GUID'] as String,
      number: map['Number'] as String,
      total: map['Total'] as String,
      spelledTotal: map['spelled_total'] as String,
      date: map['Date'],
      branch: map['Branch'] as String, // Changed to String
      rowNumber: map['RowNumber'] as String,
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
      'rowNumber': rowNumber,
    };
  }

  InvoiceModel copyWith({
    String? guid,
    String? number,
    String? total,
    String? spelledTotal,
    String? date,
    String? branch,
    String? rowNumber,
  }) {
    return InvoiceModel(
      guid: guid ?? this.guid,
      number: number ?? this.number,
      total: total ?? this.total,
      spelledTotal: spelledTotal ?? this.spelledTotal,
      date: date ?? this.date,
      branch: branch ?? this.branch,
      rowNumber: rowNumber ?? this.rowNumber,
    );
  }

  String toJson() => json.encode(toMap());

  factory InvoiceModel.fromJson(String source) =>
      InvoiceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'InvoiceModel(guid: $guid, number: $number, total: $total, spelledTotal: $spelledTotal, date: $date, branch: $branch, rowNumber: $rowNumber)';
  }

  @override
  bool operator ==(covariant InvoiceModel other) {
    if (identical(this, other)) return true;

    return other.guid == guid &&
        other.number == number &&
        other.total == total &&
        other.spelledTotal == spelledTotal &&
        other.date == date &&
        other.branch == branch &&
        other.rowNumber == rowNumber;
  }

  @override
  int get hashCode {
    return guid.hashCode ^
        number.hashCode ^
        total.hashCode ^
        spelledTotal.hashCode ^
        date.hashCode ^
        branch.hashCode ^
        rowNumber.hashCode;
  }
}

class PaginationModel {
  int currentPage;
  int total;
  int lastPage;
  int? nextPage;
  int? prevPage;

  PaginationModel({
    required this.currentPage,
    required this.total,
    required this.lastPage,
    required this.nextPage,
    required this.prevPage,
  });

  factory PaginationModel.fromMap(Map<String, dynamic> map) {
    return PaginationModel(
      currentPage: map['current_page'] as int,
      total: map['total'] as int,
      lastPage: map['last_page'] as int,
      nextPage: map['next_page'],
      prevPage: map['prev_page'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'current_page': currentPage,
      'total': total,
      'last_page': lastPage,
      'next_page': nextPage,
      'prev_page': prevPage,
    };
  }
}
