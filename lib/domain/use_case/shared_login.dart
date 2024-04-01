import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../entity/Login_response_entity.dart';


class sharedLogin{
  static Future<void> saveToken(String responseBody) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('jwt_token', responseBody);
  }
  static Future<void> saveTokenID(int responseBody) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('jwt_token_id', responseBody);
  }
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('jwt_token');
  }
  static Future<int?> getTokenID() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('jwt_token_id');
  }

}