import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hotel_booking/Screen/Authentication/sign_in.dart';
import 'package:hotel_booking/Screen/Authentication/sign_up.dart';
import 'package:hotel_booking/constant.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../GlobalComponents/button_global.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('images/welcomebg.png'),
              ),
              const SizedBox(height: 50.0),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Let’s get ',
                        style: kTextStyle.copyWith(
                            color: kTitleColor,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                        children: [
                          // const WidgetSpan(
                          //   child: Image(
                          //     image: AssetImage('images/logo2.png'),
                          //   ),
                          // ),
                          TextSpan(
                            text: ' started',
                            style: kTextStyle.copyWith(
                                color: kTitleColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                'Login to your account below or sign up for an amazing experience',
                style: kTextStyle.copyWith(color: kGreyTextColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30.0,
              ),
              //! they are not working facebook google login and apple login
              Hero(
                tag: 'social',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        elevation: 0.0,
                        color: const Color(0xFF3B5998),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(
                              left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
                          child: Center(
                            child: Icon(
                              FontAwesomeIcons.facebookF,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        elevation: 0.0,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
                          child: Center(
                            child: Image.asset(
                              'images/google.png',
                              height: 25.0,
                              width: 25.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        elevation: 0.0,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(
                              left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
                          child: Center(
                            child: Icon(
                              FontAwesomeIcons.apple,
                              color: Color(0xFF412F2D),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: ButtonGlobal(
                    buttontext: 'Sign up with mobile',
                    buttonDecoration:
                        kButtonDecoration.copyWith(color: kMainColor),
                    onPressed: () => const SignUp().launch(context),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already Have an Account?',
                      style: kTextStyle.copyWith(
                          color: kGreyTextColor, fontSize: 14.0),
                    ),
                    TextButton(
                      onPressed: () {
                        const SignIn().launch(context);
                      },
                      child: Text(
                        'Log In',
                        style: kTextStyle.copyWith(
                            color: kMainColor, fontSize: 14.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
