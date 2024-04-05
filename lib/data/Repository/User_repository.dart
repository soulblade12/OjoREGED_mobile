import 'dart:convert';

import 'package:ojoregedapp/data/Data_Source/userFunctionality_data_source.dart';
import '../../domain/entity/customer_profile_entity.dart';
import '../../domain/entity/employee_data_entity.dart';
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

  static Future<CustomerProfileEntity> getAllCustomerProfile() async {
    try {
      String userData = await userFunctionalityDataSource.getcustomerprofile(); // Assuming the correct function name
      var jsonData = jsonDecode(userData);
      return CustomerProfileEntity.fromJson(jsonData);
    } catch (e) {
      print('Error fetching user functionality data: $e');
      throw Exception('Failed to load user functionality data');
    }
  }

  static Future<List<EmployeeDataEntity>> getAllEmployee() async {
    try {
      String employeedata = await userFunctionalityDataSource.get_all_employee();
      var jsondata = jsonDecode(employeedata);
      List<EmployeeDataEntity> listEmp = jsondata.map((data) => EmployeeDataEntity.fromJson(data)).toList();
      return listEmp;
    } catch (e){
      print('Error fetching employee functionality data: $e');
      throw Exception('Failed to load employee functionality data');
    }
  }
}
