import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ojoregedapp/config.dart';
import 'package:ojoregedapp/domain/entity/Login_response_entity.dart';
import 'package:ojoregedapp/domain/use_case/shared_login.dart';


import '../domain/entity/Login_request_entity.dart';

class UserDataSource{


 static Future<bool> login(Login login) async {
   Map<String,String> requestHeader = {
     'Content-Type': 'application/json',
   };
    var url = Uri.http(Config.apiURL,Config.loginAPI);
    var response = await http.post(
        url,
        headers: requestHeader,
        body: jsonEncode(login.toJson()),
      );

    if(response.statusCode == 200)
    {
      await sharedLogin.setLoginDetails(loginResponseFromJson(response.body));
      return true;
    }
    else
    {
      return false;
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