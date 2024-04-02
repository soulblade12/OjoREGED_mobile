import 'dart:convert';

import 'package:ojoregedapp/data/Data_Source/userFunctionality_data_source.dart';
import '../../domain/entity/user_transaction_history.dart';

class UserFunctionalityRepository {
  static Future<List<CustomerHistoryEntity>> getAllCustomerHistory() async {
    try {
      String userData = await userFunctionalityDataSource.getAllCustomerHistory();
      List<dynamic> jsonList =  jsonDecode(userData);
      List<CustomerHistoryEntity> userTransactions = jsonList
          .map((data) => CustomerHistoryEntity.fromJson(data))
          .toList();
      return userTransactions;
    } catch (e) {
      print('Error fetching user functionality data: $e');
      throw Exception('Failed to load user functionality data');
    }
  }
}
