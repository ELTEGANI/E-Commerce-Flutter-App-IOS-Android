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

  Future<Response> login(String email,String password,String phone) async{
    return await apiClient.postData(AppConstants.LOGIN_URI,{"email":email,"password":password,
    "phone":phone});
  }

  Future<String> getUserToken()async{
    return await sharedPreferences.getString(AppConstants.TOKEN)??"None";
  }

  bool userLoggedIn(){
    return  sharedPreferences.containsKey(AppConstants.TOKEN);
  }

  Future<bool> saveUserToken(String token) async{
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN,token);
  }

  Future<void> saveUserNumberAndPassword(String number,String password)async{
     try{
       await sharedPreferences.setString(AppConstants.PHONE,number);
       await sharedPreferences.setString(AppConstants.PASSWORD,password);
     }catch(e){
      throw e;
     }
  }

}