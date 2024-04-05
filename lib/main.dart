import 'package:carousel_slider/utils.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ojoregedapp/helper/routing.dart';
import 'package:get/get.dart';
import 'package:ojoregedapp/presentation/Home/provider/dashboard_provider.dart';
import 'package:ojoregedapp/presentation/Home/provider/user_profile_provider.dart';
import 'package:ojoregedapp/presentation/onboarding_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;
void setup(){
  // getIt.registerSingleton(instance)
}

Future<void> main() async {

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool hasToken = prefs.containsKey('jwt_token') && prefs.getString('jwt_token') != null && prefs.getString('jwt_token')!.isNotEmpty;

  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => DashboardProvider()),
          ChangeNotifierProvider(create: (context) => CustomerProfileProvider())
        ],
        child: MyApp(hasToken: hasToken,),
      )
  );
}

class MyApp extends StatelessWidget {
  final bool hasToken;
  const MyApp({Key? key, required this.hasToken}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: hasToken ?  AppRoutes.isLogin : AppRoutes.initial,
      getPages: AppRoutes.routes,
      //  home:  Onbording(),
    );
  }
}
