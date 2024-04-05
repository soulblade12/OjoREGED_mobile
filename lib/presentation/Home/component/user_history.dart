import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:ojoregedapp/presentation/Home/provider/dashboard_provider.dart'; // Import your DashboardProvider

class userHistory extends StatelessWidget {
  const userHistory({Key? key});

  @override
  Widget build(BuildContext context) {
    final dashboardProvider = Provider.of<DashboardProvider>(context);
    dashboardProvider.getallorder(); // Call the method to fetch data

    return Scaffold(

      body: Consumer<DashboardProvider>(
        builder: (context, provider, _) {
          if (provider.get_order.isEmpty) {
            return Center(child: Lottie.asset('assets/misc/datanotfound.json'));
          } else {
            return ListView.builder(
              itemCount: provider.get_order.length,
              itemBuilder: (context, index) {
                final plan = provider.get_order[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text('Order ID: ${plan.orderId}'),
                    subtitle: Text('Time Placed: ${plan.timePlaced}'),
                    // Add more fields as needed
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
