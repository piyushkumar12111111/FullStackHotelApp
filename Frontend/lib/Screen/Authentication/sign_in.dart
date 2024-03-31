import 'package:flutter/material.dart';
import 'package:hotel_booking/Screen/Authentication/forgot_password.dart';
import 'package:hotel_booking/Screen/Home/home.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../GlobalComponents/button_global.dart';
import '../../constant.dart';


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  List<String> item = [
    'Male',
    'Female',
    'Others',
  ];
  String froms = 'Male';

  DropdownButton<String> getGender() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String des in item) {
      var item = DropdownMenuItem(
        child: Text(des),
        value: des,
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: froms,
      onChanged: (value) {
        setState(() {
          froms = value!;
        });
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
                  'Welcome back',
                  style: kTextStyle.copyWith(
                    color: kTitleColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Let’s us know what your name,  email,\n and your password',
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
                const SizedBox(height: 20.0),
                AppTextField(
                  textFieldType: TextFieldType.PASSWORD,
                  decoration: kInputDecoration.copyWith(
                    labelText: 'Password',
                    hintText: '********',
                    labelStyle: kTextStyle.copyWith(color: kTitleColor),
                    hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
                  ),
                ),
                const SizedBox(height: 20.0),
                ButtonGlobal(
                  buttontext: 'Continue',
                  onPressed: () {
                    const Home().launch(context);
                    
                  },
                  buttonDecoration:
                      kButtonDecoration.copyWith(color: kMainColor),
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      const ForGotPassword().launch(context);
                    },
                    child: Text('Forgot password',style: kTextStyle.copyWith(color: kGreyTextColor),),
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
