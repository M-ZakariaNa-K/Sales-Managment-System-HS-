import 'package:sales_management_system/Models/admins/new_user_model.dart';
import 'package:sales_management_system/Models/admins/users_model.dart';
import 'package:sales_management_system/Models/auth/userModel.dart';
import 'package:sales_management_system/Models/pills/pills.dart';

List<int> users = [];
List<PillsModel> pills = [];
int pillsIndex = 0;
String token = '';
UserModel? userModel;
NewUserModel? newUserModel;
ListUserModel? listUserModel;
bool isDataLoading = false;
bool isLoadingFaild = false;
