import 'package:e_commerace/data/api/api.dart';
import 'package:e_commerace/models/signup_body_model.dart';
import 'package:e_commerace/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({
    required this.apiClient,
    required this.sharedPreferences
});
  Future<Response> registeration(SignUpBody signUpBody) async{
    return await apiClient.postData(AppConstants.REGISTERATION_URI, signUpBody.toJson());
  }

  saveUserToken(String token) async{
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN,token);
  }
}