import 'package:flutter/material.dart';

import '../../../data/Repository/User_repository.dart';
import '../../../domain/entity/customer_profile_entity.dart';

class CustomerProfileProvider with ChangeNotifier {
  CustomerProfileEntity? _customerProfile;

  CustomerProfileEntity? get customerProfile => _customerProfile;

  Future<void> fetchCustomerProfile() async {
    try {
      _customerProfile = await UserFunctionalityRepository.getAllCustomerProfile();

      notifyListeners();
    } catch (e) {
      print('Error fetching customer profile: $e');
      throw Exception('Failed to fetch customer profile');
    }
  }
}
