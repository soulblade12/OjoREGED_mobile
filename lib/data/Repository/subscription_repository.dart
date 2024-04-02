import 'dart:convert';

import 'package:ojoregedapp/data/Data_Source/subscription_data_source.dart';

import '../../domain/entity/Subscription_entity.dart';

class SubscriptionRepository{

  static Future<List<SubscriptionEntity>> fetchSubscriptions() async {
    try {
      // Fetch data from the data source
      final String responseBody = await SubscriptionDataSource.getAllSubscribe();
      // Decode JSON string to List<dynamic>
      final List<dynamic> jsonData = jsonDecode(responseBody);
      // Map List<dynamic> to List<SubscriptionEntity>
      final List<SubscriptionEntity> subscriptions = jsonData
          .map((data) => SubscriptionEntity.fromJson(data))
          .toList();

      return subscriptions;
    } catch (e) {
      // Handle exceptions
      throw Exception('Failed to load subscriptions: $e');
    }
  }
  }
