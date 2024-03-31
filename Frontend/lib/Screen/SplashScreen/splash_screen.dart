import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../constant.dart';
import 'on_board.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 2));

    defaultBlurRadius = 10.0;
    defaultSpreadRadius = 0.5;

    finish(context);
    const OnBoard().launch(context);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: context.height() /2.5,),
          const Center(
            child: Image(
              image: AssetImage('images/logo.png'),
            ),
          ),
          const Spacer(),

          Center(child: Text('Hotel Booking App',style: kTextStyle.copyWith(color: Colors.white),),),
          Center(child: Text('Version 1.0.0',style: kTextStyle.copyWith(color: Colors.white),),),
          const SizedBox(height: 20.0,),

        ],
      ),
    );
  }
}
