import 'package:coin_market/screens/splash/splash_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Coin Market App',
      theme: ThemeData(fontFamily: 'Nunito'),
      debugShowCheckedModeBanner: false,
      home: SplashModule(),
    );
  }
}
