import 'package:bmi_calculator/splash_screen.dart';
import 'package:bmi_calculator/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'home_screen.dart';

void main()
{
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI APP',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: SplashScreen(),
    );
  }
}
