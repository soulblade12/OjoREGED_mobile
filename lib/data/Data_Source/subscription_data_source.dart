import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ojoregedapp/config.dart';


class SubscriptionDataSource{
  static Future<String> getAllSubscribe() async {
    final url = Uri.parse('${Config.apiURL}${Config.subscribeAPI}');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return(response.body);

    } else {
      throw Exception('Failed to load subscriptions');
    }
  }
  }

