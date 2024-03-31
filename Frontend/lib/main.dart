import 'package:flutter/material.dart';
import 'Screen/SplashScreen/splash_screen.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotel Booking APP',
      theme: ThemeData(fontFamily: 'Display'),
      home: const SplashScreen(),
    );
  }
}
//! 192.168.85.111