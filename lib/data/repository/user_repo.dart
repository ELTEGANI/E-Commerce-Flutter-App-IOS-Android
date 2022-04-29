import 'package:e_commerace/data/api/api.dart';
import 'package:e_commerace/utils/app_constants.dart';
import 'package:get/get.dart';

class UserRepo{
  final ApiClient apiClient;
  UserRepo({required this.apiClient});

  Future <Response> getUserInfo()async{
    return await apiClient.getData(AppConstants.USER_INFO);
  }

}