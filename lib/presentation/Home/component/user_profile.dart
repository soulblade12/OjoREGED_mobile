

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ojoregedapp/presentation/Home/component/user_edit.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/entity/customer_profile_entity.dart';
import '../provider/dashboard_provider.dart';
import '../provider/user_profile_provider.dart';

class userProfile extends StatelessWidget {
  const userProfile({Key? key});

  @override
  Widget build(BuildContext context) {
    final customerProfileProvider =
    Provider.of<CustomerProfileProvider>(context);
    // Fetch customer profile data
    customerProfileProvider.fetchCustomerProfile();

    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0), // Add padding
        child: Center(
          child: customerProfileProvider.customerProfile != null
              ? _buildCustomerProfileWidget(
              customerProfileProvider.customerProfile!,context)
              : CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget _buildCustomerProfileWidget(CustomerProfileEntity customerProfile, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: const Icon(Icons.ice_skating_sharp),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color.fromRGBO(217, 237, 191, 1),
                    ),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            Text("name"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${customerProfile.firstName} ${customerProfile.lastName}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text("email"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${customerProfile.emailAddress}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => editUser(customerProfile: customerProfile),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(44, 120, 101, 1),
                  side: BorderSide.none,
                  shape: const StadiumBorder(),
                  // Add margin to the button
                  padding: EdgeInsets.symmetric(vertical: 10),

                ),
                child: const Text("Edit Profile", style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 10),
            ListTile(
              onTap: () {
                Get.toNamed('/InsertAddress');
              },
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color.fromRGBO(217, 237, 191, 0.6),
                ),
                child: const Icon(Icons.home, color: Colors.black),
              ),
              title: Text("Settings"),
              trailing: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: const Icon(Icons.arrow_forward_ios, size: 18.0, color: Colors.grey),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color.fromRGBO(217, 237, 191, 0.6),
                ),
                child: const Icon(Icons.wallet_sharp, color: Colors.black),
              ),
              title: Text("Billing Details"),
              trailing: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: const Icon(Icons.arrow_forward_ios, size: 18.0, color: Colors.grey),
              ),
            ),
            const Divider(),
            const SizedBox(height: 10),
            ListTile(
              onTap: () {
                Get.defaultDialog(
                  title: "LOGOUT",
                  titleStyle: const TextStyle(fontSize: 20),
                  content: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Text("Are you sure you want to logout?"),
                  ),
                  confirm: Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        await prefs.clear();
                        // Provider.of<CustomerProfileProvider>(context, listen: false).clear();
                        // Provider.of<DashboardProvider>(context, listen: false).clear();
                        Get.offNamed('/Login');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        side: BorderSide.none,
                      ),
                      child: const Text("Yes"),
                    ),
                  ),
                  cancel: OutlinedButton(onPressed: () => Get.back(), child: const Text("No")),
                );
              },
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color.fromRGBO(217, 237, 191, 0.6),
                ),
                child: const Icon(Icons.logout, color: Colors.black),
              ),
              title: Text("Log Out", style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ],
    );
  }
}

