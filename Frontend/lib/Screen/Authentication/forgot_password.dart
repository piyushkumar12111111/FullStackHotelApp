import 'package:flutter/material.dart';
import 'package:hotel_booking/Screen/Authentication/sign_in.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../GlobalComponents/button_global.dart';
import '../../constant.dart';

class ForGotPassword extends StatefulWidget {
  const ForGotPassword({Key? key}) : super(key: key);

  @override
  State<ForGotPassword> createState() => _ForGotPasswordState();
}

class _ForGotPasswordState extends State<ForGotPassword> {
  void showPopUp() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: const Color(0xFFF8F8F8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          // ignore: sized_box_for_whitespace
          child: SizedBox(
            height: 300.0,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
              child: Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.close_rounded,
                          color: kTitleColor,
                        ).onTap(
                          () => finish(context),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        color: const Color(0xFFFFE7DB),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Icon(
                          Icons.check_rounded,
                          color: Color(0xFFFF8748),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Your password was \n successfully changed',
                        style: kTextStyle.copyWith(
                            color: kTitleColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Close this window and login again',
                      style: kTextStyle.copyWith(color: kGreyTextColor),
                    ),
                    const Spacer(),
                    ButtonGlobal(
                      buttontext: 'Login again',
                      onPressed: () {
                        finish(context);
                        const SignIn().launch(context);
                      },
                      buttonDecoration:
                          kButtonDecoration.copyWith(color: kMainColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  final dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, bottom: 20.0, top: 40.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Forgot password?',
                  style: kTextStyle.copyWith(
                    color: kTitleColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Enter the email address associated \n with your account',
                  style: kTextStyle.copyWith(color: kGreyTextColor),
                ),
                const SizedBox(height: 20.0),
                AppTextField(
                  textFieldType: TextFieldType.EMAIL,
                  decoration: kInputDecoration.copyWith(
                    labelText: 'Email',
                    hintText: 'abdulkorim@gmail.com',
                    labelStyle: kTextStyle.copyWith(color: kTitleColor),
                    hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t work? ',
                        style: kTextStyle.copyWith(color: kGreyTextColor),
                      ),
                      Text(
                        'Try another way ',
                        style: kTextStyle.copyWith(
                          color: const Color(0xFFFF8748),
                        ),
                      ),
                    ],
                  ),
                ),
                ButtonGlobal(
                  buttontext: 'Reset Password',
                  onPressed: () => showPopUp(),
                  buttonDecoration:
                      kButtonDecoration.copyWith(color: kMainColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
