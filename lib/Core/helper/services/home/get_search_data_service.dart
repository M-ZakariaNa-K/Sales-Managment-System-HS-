import 'package:dio/dio.dart';
import 'package:sales_management_system/Core/Components/widget.dart';
import 'package:sales_management_system/Core/helper/services/getTest.dart';
import 'package:sales_management_system/Models/home/get_search_data_model.dart';

class SearchAppService {
  SearchAppService(this.dio);
  final Dio dio;

  Future<GetSearchDataModel> getsearchapp({required String query}) async {
    // Add connectTimeout and receiveTimeout to handle timeouts
    dio.options.connectTimeout = const Duration(seconds: 30); // 30 seconds
    dio.options.receiveTimeout = const Duration(seconds: 20); // 20 seconds

    try {
      Response response = await DioHelper().getData(
          path: "branches-Sales/Search-For?param=$query", token: token);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;
        List<dynamic> names = data['data']['Name results'] as List<dynamic>;
        List<dynamic> numbers = data['data']['Number results'] as List<dynamic>;

        List<BranchByName> nameBranchesList =
            names.map((json) => BranchByName.fromJson(json)).toList();
        List<BranchByNumber> numberBranchesList =
            numbers.map((json) => BranchByNumber.fromJson(json)).toList();
        return GetSearchDataModel(
          nameBranches: nameBranchesList,
          numberBranches: numberBranchesList,
        );
      } else if (response.statusCode == 429) {
        throw Exception('Too many requests. Please try again later.');
      } else {
        throw Exception(
            'Failed to fetch data. Status code: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 429) {
        throw Exception('Too many requests. Please try again');
      } else {
        throw Exception('Error fetching data. Please try again');
      }
    }
  }
}
