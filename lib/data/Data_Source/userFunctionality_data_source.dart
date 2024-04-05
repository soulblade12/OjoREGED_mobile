import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ojoregedapp/config.dart';
import 'package:ojoregedapp/domain/entity/add_booking_entity.dart';
import 'package:ojoregedapp/domain/entity/address_user_entity.dart';
import 'package:ojoregedapp/domain/entity/update_subscribe_entity.dart';
import 'package:ojoregedapp/domain/entity/update_user_entity.dart';
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

  static Future<String> getcustomerprofile() async {
    int? token = await sharedLogin.getTokenID();
    String? tokenJWT = await sharedLogin.getToken();
    final url = Uri.parse('https://app.actualsolusi.com/bsi/OjoREGED/api/Customer/$token');
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

  static Future<bool> register_address(AddressEntity address) async {
    String? tokenJWT = await sharedLogin.getToken();

      var response = await http.post(
        Uri.parse("${Config.apiURL}${Config.addressAPI}"),
        headers: {
          'Authorization': 'Bearer $tokenJWT',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(address.toJson()),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed to register');
      }
    }

  static Future<bool> update_subscription(UpdateSubscribeEntity subs) async {
    String? tokenJWT = await sharedLogin.getToken();

    var response = await http.post(
      Uri.parse("${Config.apiURL}${Config.updatesubscribeAPI}"),
      headers: {
        'Authorization': 'Bearer $tokenJWT',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(subs.toJson()),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to register');
    }
  }

  static Future<bool> update_profile(UpdateUserEntity user) async {
    int? token = await sharedLogin.getTokenID();
    String? tokenJWT = await sharedLogin.getToken();
    print(user.firstName);
    var response = await http.put(
      Uri.parse("https://app.actualsolusi.com/bsi/OjoREGED/api/Customer/$token"),
      headers: {
        'Authorization': 'Bearer $tokenJWT',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(user.toJson()),
    );
    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to update profile');
    }
  }

  static Future<bool> add_booking(AddBookingEntity book) async {
    String? tokenJWT = await sharedLogin.getToken();

    var response = await http.post(
      Uri.parse("${Config.apiURL}${Config.addbookingAPI}"),
      headers: {
        'Authorization': 'Bearer $tokenJWT',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(book.toJson()),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to register');
    }
  }

  static Future<String> get_all_employee() async {
    final url = Uri.parse('https://app.actualsolusi.com/bsi/OjoREGED/api/Employee/GetAllEmployee');
    final response = await http.get(
      url,
      headers: {
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
