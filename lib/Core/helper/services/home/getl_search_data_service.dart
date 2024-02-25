import 'package:dio/dio.dart';
import 'package:sales_management_system/Core/helper/services/getTest.dart';
import 'package:sales_management_system/Core/helper/shared/shared.dart';
import 'package:sales_management_system/Models/home/get_search_data_model.dart';

class GetSearchDataService {
  final Dio dio;
  final String value;
  GetSearchDataService(this.dio,this.value);

  Future<GetSearchDataModel> getSearchDataService() async {
    try {
      Response response = await DioHelper().getData(
        baseURL: "branches-Sales/Search-For",
        token: tokenVar,
        body: {
    "param" : value
}
      );
    
      // Check if the response status code is 200 (OK)
      if (response.statusCode == 200) {
        // Parse the JSON response data
        Map<String, dynamic> data = response.data;
   List<dynamic> names = data['data']['Name results'] as List<dynamic>;
    List<dynamic> numbers = data['data']['Number results'] as List<dynamic>;
  
        List<GetSearchDataModel> nameList =
            names.map((json) => GetSearchDataModel.fromJson(json)).toList();
        List<GetSearchDataModel> numberList =
            numbers.map((json) => GetSearchDataModel.fromJson(json)).toList();
        // for (var item in data["data"]) {
        //   GetSearchDataModel a = GetSearchDataModel(
        //     nameResults: [],
        //     numberResults: [],
        //   );
        //   dataList.add(a);
        // }
        return GetSearchDataModel(nameResults: nameList,numberResults: numberList);
      } else {
        // Handle the case where the response status code is not 200
        print('Failed to get data. Status code: ${response.statusCode}');
        return GetSearchDataModel(nameResults: [],numberResults: []);
      }
    } catch (e) {
      // Handle any errors that occur during the API call
      print('Error fetching data: $e');
              return GetSearchDataModel(nameResults: [],numberResults: []);

    }
  }
}
