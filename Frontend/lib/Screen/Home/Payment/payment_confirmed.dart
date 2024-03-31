import 'package:flutter/material.dart';
import 'package:hotel_booking/Screen/Home/home.dart';
import 'package:hotel_booking/constant.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../GlobalComponents/button_global.dart';

class PaymentConfirmed extends StatefulWidget {
  const PaymentConfirmed({Key? key}) : super(key: key);

  @override
  State<PaymentConfirmed> createState() => _PaymentConfirmedState();
}

class _PaymentConfirmedState extends State<PaymentConfirmed> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('images/confirmed.png'),
                ),
                const SizedBox(height: 50.0),
                Text(
                  'Payment Confirmed.',
                  style: kTextStyle.copyWith(
                      color: kTitleColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5.0),
                Text(
                  'Room successfully booked!',
                  style: kTextStyle.copyWith(
                      color: kGreyTextColor,
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ButtonGlobal(
                      buttontext: 'Back to Home',
                      buttonDecoration:
                      kButtonDecoration.copyWith(color: kMainColor),
                      onPressed: () => const Home().launch(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
