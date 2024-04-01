import 'package:flutter/material.dart';
import 'package:ojoregedapp/domain/entity/Subscription_entity.dart';
import 'package:ojoregedapp/data/Repository/subscription_repository.dart';

class Profile_Page extends StatefulWidget {
  @override
  _Profile_Page createState() => _Profile_Page();
}

class _Profile_Page extends State<Profile_Page> {
  late List<SubscriptionEntity> subscriptions = [];

  @override
  void initState() {
    super.initState();
    _fetchSubscriptions();
  }

  Future<void> _fetchSubscriptions() async {
    try {
      subscriptions = (await SubscriptionRepository.fetchSubscriptions()).cast<SubscriptionEntity>();
      setState(() {});
    } catch (e) {
      print('Error fetching subscriptions: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: subscriptions.isEmpty
          ? Center(child: CircularProgressIndicator())
          : SizedBox(
        height: 220,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: subscriptions.length,
          itemBuilder: (context, index) {
            final subscription = subscriptions[index];
            return _buildSubscriptionCard(subscription);
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
            // Handle Home Page navigation
              break;
            case 1:
            // Handle Profile Page navigation
              break;
            case 2:
            // Handle Settings Page navigation
              break;
          }
        },
      ),
    );
  }

  Widget _buildSubscriptionCard(SubscriptionEntity subscription) {
    return Column(
      children: [
        SizedBox(
          width: 160,
          height: 100,
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subscription.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Price: \$${subscription.price}',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
