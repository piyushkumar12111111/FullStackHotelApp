import 'dart:convert';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/Screen/Authentication/phone_authentication.dart';
import 'package:hotel_booking/constant.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:http/http.dart' as http;

import '../../GlobalComponents/button_global.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

//! callin the signup post api

// Future<void> signUpPostApi(
//     String country, String email, String password, context) async {
//   var url = Uri.parse('http://192.168.85.111:8080/signup');
//   var response = await http.post(url, body: {
//     "country": country,
//     "email": email,
//     "password": password,
//   });

//   //!

//   if (response.statusCode == 200) {
//     print('Response status: ${response.statusCode}');
//     print('Response body: ${response.body}');

//     //! encoding the response
//     var data = jsonDecode(response.body);
//     print(data);

//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => PhoneAuth()),
//     );
//   } else {
//     //! show toast msg
//     toast("otp not send to your email");
//     print('Response status: ${response.statusCode}');
//     print('Response body: ${response.body}');
//   }
// }

 //! otp variable 

 late String otp;
Future<void> signUpPostApi(
    String country, String username, String password, context) async {
  var url = Uri.parse('http://192.168.85.111:9080/signup');
  var response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: json.encode(<String, String>{
      "country": "pakistan",
      "email": "anuradhasingh@gmail.com",
      "password": "123456789"
    }),
  );
  if (response.statusCode == 200) {
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    //! encoding the response
    var data = jsonDecode(response.body);

    otp = data['otp'];
    print(data);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PhoneAuth(verifyotp: otp,)),
    );
  } else {
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController countryController = TextEditingController();

class _SignUpState extends State<SignUp> {
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
                  'Create an account',
                  style: kTextStyle.copyWith(
                      color: kTitleColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0),
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Let’s us know what your name,  email, \n and your password',
                  style: kTextStyle.copyWith(color: kGreyTextColor),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                FormField(
                  builder: (FormFieldState<dynamic> field) {
                    return InputDecorator(
                      decoration: kInputDecoration.copyWith(
                        contentPadding:
                            const EdgeInsets.only(left: 10.0, right: 8.0),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Country/Region',
                        labelStyle: kTextStyle.copyWith(color: kTitleColor),
                      ),
                      child: const DropdownButtonHideUnderline(
                        child: CountryCodePicker(
                          padding: EdgeInsets.zero,
                          onChanged: print,
                          initialSelection: 'BD',
                          showFlag: false,
                          showCountryOnly: true,
                          showOnlyCountryWhenClosed: true,
                          showDropDownButton: true,
                          alignLeft: true,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20.0),
                AppTextField(
                  controller: emailController,
                  textFieldType: TextFieldType.EMAIL,
                  decoration: kInputDecoration.copyWith(
                    labelText: 'Email Address*',
                    hintText: 'abdulkorim@gmail.com',
                    labelStyle: kTextStyle.copyWith(color: kTitleColor),
                    hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
                  ),
                ),
                const SizedBox(height: 20.0),
                AppTextField(
                  controller: passwordController,
                  textFieldType: TextFieldType.PASSWORD,
                  decoration: kInputDecoration.copyWith(
                    labelText: 'Password*',
                    hintText: '********',
                    labelStyle: kTextStyle.copyWith(color: kTitleColor),
                    hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Confirm your email. Standard message and date \nretes apply.',
                  style: kTextStyle.copyWith(color: kTitleColor),
                ),
                const SizedBox(height: 40.0),
                ButtonGlobal(
                  buttontext: 'Continue',
                  buttonDecoration:
                      kButtonDecoration.copyWith(color: kMainColor),
                  //   onPressed: () => const PhoneAuth().launch(context),
                  onPressed: () {
                    signUpPostApi("india", emailController.text,
                        passwordController.text, context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
