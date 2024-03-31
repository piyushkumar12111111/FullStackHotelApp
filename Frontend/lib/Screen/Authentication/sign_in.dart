import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hotel_booking/Screen/Authentication/forgot_password.dart';
import 'package:hotel_booking/Screen/Home/home.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../GlobalComponents/button_global.dart';
import '../../constant.dart';
import 'package:http/http.dart' as http;

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

  //! calling  post api for signin

  Future<void> signInPostApi(String email, String password, context) async {
    var url = Uri.parse('http://192.168.85.111:9080/signin');
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(<String, String>{
        "email": email, //! user@example.com
        "password": password, //! password123
      }),
    );
    if (response.statusCode == 200) {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } else {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      toast("You have Entered Wrong Email or Password");
    }
  }

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
                    //     const Home().launch(context);

                    signInPostApi('user@example.com', 'password123', context);
                  },
                  buttonDecoration:
                      kButtonDecoration.copyWith(color: kMainColor),
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      const ForGotPassword().launch(context);
                    },
                    child: Text(
                      'Forgot password',
                      style: kTextStyle.copyWith(color: kGreyTextColor),
                    ),
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
