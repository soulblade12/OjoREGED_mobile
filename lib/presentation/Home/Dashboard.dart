import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ojoregedapp/presentation/Home/component/Home.dart';
import 'package:ojoregedapp/presentation/Home/provider/dashboard_provider.dart';
import 'package:provider/provider.dart';


import 'component/subscription_plan.dart';
import 'component/user_history.dart';
import 'component/user_profile.dart';

class Dashboard extends StatelessWidget {
  
  @override

  static List<Widget> _widgetOptions = <Widget>[
      Home(),
    userProfile(),
    userHistory()
  ];


  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Consumer<DashboardProvider>(
          builder: (context, provider, _) {
            return Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(24),
                  topLeft: Radius.circular(24),
                ),
                child: BottomNavigationBar(
                  selectedItemColor: Colors.green,
                  unselectedItemColor: Colors.black,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.white,
                  selectedFontSize: 14.0,
                  currentIndex: provider.selectedIndex,
                  onTap: provider.updateSelectedIndex,
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person_pin),
                      label: 'Profile',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.list_alt),
                      label: 'History',
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        body: Consumer<DashboardProvider>(
          builder: (context, provider, _) {
            return _widgetOptions.elementAt(provider.selectedIndex);
          },
        ),
      ),
    );
  }
}
