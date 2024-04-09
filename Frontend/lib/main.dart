import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/firebase_options.dart';
import 'Screen/SplashScreen/splash_screen.dart';
import 'package:get/get.dart';


@pragma('vm:entry-point')
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

 await Firebase.initializeApp(

  options: DefaultFirebaseOptions.currentPlatform,
 );
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
      home:  SplashScreen(),
    );
  }
}
//! 192.168.85.111