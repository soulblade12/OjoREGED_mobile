import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ojoregedapp/config.dart';
import 'package:ojoregedapp/domain/entity/Subscription_entity.dart';
import 'package:ojoregedapp/domain/use_case/shared_login.dart';



class userFunctionalityDataSource{
  static Future<String> getAllCustomerHistory() async {
    int? token = await sharedLogin.getTokenID();
    String? tokenJWT = await sharedLogin.getToken();
    final url = Uri.parse('https://app.actualsolusi.com/bsi/OjoREGED/api/Customer/orders/$token');
    final response = await http.get(
        url,
      headers: {
        'Authorization': 'Bearer $tokenJWT',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      // print(response.body);
      return(response.body);

    } else {
      throw Exception('Failed to load user data');
    }
  }
}