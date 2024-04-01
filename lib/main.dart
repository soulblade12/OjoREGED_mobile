import 'package:flutter/material.dart';
import 'package:ojoregedapp/helper/routing.dart';
import 'package:get/get.dart';
import 'package:ojoregedapp/presentation/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.initial,
      getPages: AppRoutes.routes,
      //  home:  Onbording(),
    );
  }
}
