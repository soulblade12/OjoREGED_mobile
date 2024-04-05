import 'package:flutter/material.dart';

import 'package:ojoregedapp/data/Repository/subscription_repository.dart';

import '../../../data/Repository/User_repository.dart';

class DashboardProvider extends ChangeNotifier{
    var subscribes_plan = [];
    var get_order = [];
    var emp_data = [];
    String _selectedSize = '';

    String get selectedSize => _selectedSize;

    void setSelectedSize(String size) {
      _selectedSize = size;
      notifyListeners();
    }

    int _selectedIndex = 0;

    int get selectedIndex => _selectedIndex;

    void updateSelectedIndex(int newIndex) {
      _selectedIndex = newIndex;
      notifyListeners();
    }

    Future<void> getArticles() async {
      try {
        subscribes_plan = await SubscriptionRepository.fetchSubscriptions();
        notifyListeners();
      } catch (e) {
        print('Error fetching subscriptions: $e');
      }
    }

    Future<void> getallorder() async {
      try {
        get_order = await UserFunctionalityRepository.getAllCustomerHistory();
        notifyListeners();
      } catch (e) {
        print('Error fetching customer: $e');
      }
    }

    Future<void> getallemployee() async {
      try{
        emp_data = await UserFunctionalityRepository.getAllEmployee();
        notifyListeners();
      } catch (e){
        print('Error fetching employee: $e');
      }
    }
  }