import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ojoregedapp/domain/use_case/shared_login.dart';

import '../../domain/entity/Login_response_entity.dart';

class Profile_Page extends StatelessWidget {
   Profile_Page({Key? key}) : super(key: key);



  @override
  final loginResponse = Get.arguments as LoginResponse?;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome, ${loginResponse?.firstName ?? 'User'}!', // Display the user's first name
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Display other user information as needed
          ],
        ),
      ),
    );
  }
}
