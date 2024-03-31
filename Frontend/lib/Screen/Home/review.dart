import 'package:flutter/material.dart';
import 'package:hotel_booking/constant.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../GlobalComponents/button_global.dart';
import 'home.dart';

class Review extends StatefulWidget {
  const Review({Key? key}) : super(key: key);

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Write a review',
          style: kTextStyle.copyWith(color: kTitleColor),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: kTitleColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: RatingBarWidget(
                    onRatingChanged: null,
                    itemCount: 5,
                    inActiveColor: const Color(0xFFD6D2D4),
                  ),
                ),
              ),
              const SizedBox(height: 5.0),
              Text(
                'Tap a star to rate',
                style: kTextStyle.copyWith(color: kTitleColor, fontSize: 18.0),
              ),
              const SizedBox(height: 30.0),
              SizedBox(
                height: 200,
                child: AppTextField(
                  textFieldType: TextFieldType.MULTILINE,
                  showCursor: true,
                  decoration: kInputDecoration.copyWith(
                    hintText: 'Review',
                    labelStyle: kTextStyle.copyWith(color: kTitleColor),
                    hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ButtonGlobal(
                  buttontext: 'Send',
                  buttonDecoration:
                      kButtonDecoration.copyWith(color: kMainColor),
                  onPressed: () => const Home().launch(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
