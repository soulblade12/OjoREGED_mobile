import 'dart:convert';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:http/http.dart' as http;
import 'package:api_cache_manager/api_cache_manager.dart';
import '../entity/Login_response_entity.dart';


class sharedLogin{
  static Future<bool> isLoggedIn() async {
    var isKeyExist = await APICacheManager().isAPICacheKeyExist("login_details");
    return isKeyExist;
  }

  static Future<LoginResponse?> LoginDetails() async{
    var isKeyExist = await APICacheManager().isAPICacheKeyExist("login_details");
    If (isKeyExist) async {
      var cachedata = await APICacheManager().getCacheData("login_details");
      return loginResponseFromJson(cachedata.syncData);
    }
  }


  static Future<void> setLoginDetails(LoginResponse model) async{
    APICacheDBModel cacheDBModel = APICacheDBModel(
        key: "login_details",
        syncData: jsonEncode(model.toJson()));
    await APICacheManager().addCacheData(cacheDBModel);
  }
}