import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ojoregedapp/config.dart';
import 'package:ojoregedapp/domain/entity/Login_response_entity.dart';
import 'package:ojoregedapp/domain/use_case/shared_login.dart';


import '../../domain/entity/Login_request_entity.dart';

class UserDataSource{


 static Future<LoginResponse> login(Login login) async {
   Map<String,String> requestHeader = {
     'Content-Type': 'application/json',
   };
    // var url = Uri.http(Config.apiURL,Config.loginAPI);
    var response = await http.post(
        // url,
        Uri.parse("${Config.apiURL}${Config.loginAPI}"),
        headers: requestHeader,
        body: jsonEncode(login.toJson()),
      );


   if (response.statusCode == 200) {
     final loginResponse = loginResponseFromJson(response.body);
     await sharedLogin.saveTokenID(loginResponse.customerId);
     await sharedLogin.saveToken(loginResponse.token);
     return loginResponse;
   } else {
     throw Exception('Failed to login');
   }
        // headers: <String, String>{
        //   'Content-Type': 'application/json; charset=UTF-8',
        // },
        // body: jsonEncode(<String, dynamic>{
        //   'id': message['id'],
        //   'from': message['nama'],
        //   'text': message['Pesan'],
        // }
        // ));
    // return response.body;
  }
}