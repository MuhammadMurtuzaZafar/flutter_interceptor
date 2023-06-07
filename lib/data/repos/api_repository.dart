import 'package:dio/dio.dart';

import '../../network/client/api_client.dart';
import '../../network/rest_constant.dart';
import '../../ui/entity/user_entity.dart';
import 'entities/user_entity_response.dart';

class ApiRepository{

  static final ApiRepository _converter=ApiRepository._internal();

  ApiRepository._internal();

  factory ApiRepository (){
    return _converter;
  }

 Future<UserEntity?> getUser() async{

    try
    {
      Response response= await ApiClient().dio().get(RestConstant.kGetUserProfile);
       return UserEntity.fromMap(response.data);
    }
    catch(e)
    {
      return null;
    }

 }
}