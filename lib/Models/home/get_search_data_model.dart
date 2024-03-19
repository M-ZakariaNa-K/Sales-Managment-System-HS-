// class GetSearchModel {
//     int code;
//     String message;
//     GetSearchDataModel data;

//     GetSearchModel({
//         required this.code,
//         required this.message,
//         required this.data,
//     });

//     factory GetSearchModel.fromJson(Map<String, dynamic> json) => GetSearchModel(
//         code: json["code"],
//         message: json["message"],
//         data: GetSearchDataModel.fromJson(json["data"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "code": code,
//         "message": message,
//         "data": data.toJson(),
//     };
// }

// class GetSearchDataModel {
//     List<dynamic> nameResults;
//     List<dynamic> numberResults;

//     GetSearchDataModel({
//         required this.nameResults,
//         required this.numberResults,
//     });

//     factory GetSearchDataModel.fromJson(Map<String, dynamic> json) => GetSearchDataModel(
//         nameResults: List<NameResult>.from(json["Name results"].map((x) => NameResult.fromJson(x))),
//         numberResults: List<dynamic>.from(json["Number results"].map((x) => x)),
//     );

//     Map<String, dynamic> toJson() => {
//         "Name results": List<dynamic>.from(nameResults.map((x) => x.toJson())),
//         "Number results": List<dynamic>.from(numberResults.map((x) => x)),
//     };
// }

// class NameResult {
// String name;
// String number;
// String guid;
// dynamic totalSales;

//     NameResult({
//         required this.name,
//         required this.number,
//         required this.guid,
//         required this.totalSales,
//     });

//     factory NameResult.fromJson(Map<String, dynamic> json) => NameResult(
//         name: json["name"],
//         number: json["number"],
//         guid: json["GUID"],
//         totalSales: json["total sales"],
//     );

//     Map<String, dynamic> toJson() => {
//         "name": name,
//         "number": number,
//         "GUID": guid,
//         "total sales": totalSales,
//     };
// }
class GetSearchDataModel {
  List<BranchByName> nameBranches;
  List<BranchByNumber> numberBranches;

  GetSearchDataModel({
    required this.nameBranches,
    required this.numberBranches,
  });

  factory GetSearchDataModel.fromJson(Map<String, dynamic> json) =>
      GetSearchDataModel(
        nameBranches: List<BranchByName>.from(
            json["medicines"].map((x) => BranchByName.fromJson(x))),
        numberBranches: List<BranchByNumber>.from(
            json["categories"].map((x) => BranchByNumber.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "medicines": List<dynamic>.from(nameBranches.map((x) => x.toJson())),
        "categories": List<dynamic>.from(numberBranches.map((x) => x.toJson())),
      };
}

class BranchByNumber {
  String name;
  String number;
  String guid;
  dynamic totalSales;

  BranchByNumber({
    required this.name,
    required this.number,
    required this.guid,
    required this.totalSales,
  });

  factory BranchByNumber.fromJson(Map<String, dynamic> json) => BranchByNumber(
        name: json["name"],
        number: json["number"],
        guid: json["GUID"],
        totalSales: json["total sales"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "number": number,
        "GUID": guid,
        "total sales": totalSales,
      };
}

class BranchByName {
  String name;
  String number;
  String guid;
  dynamic totalSales;
  BranchByName({
    required this.name,
    required this.number,
    required this.guid,
    required this.totalSales,
  });

  factory BranchByName.fromJson(Map<String, dynamic> json) => BranchByName(
        name: json["name"],
        number: json["number"],
        guid: json["GUID"],
        totalSales: json["total sales"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "number": number,
        "GUID": guid,
        "total sales": totalSales,
      };
}
