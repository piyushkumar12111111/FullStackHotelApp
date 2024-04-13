import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:hotel_booking/Chat/chat_list.dart';
import 'package:hotel_booking/Profile/about.dart';
import 'package:hotel_booking/Profile/edit_profile.dart';
import 'package:hotel_booking/Profile/privacy_policy.dart';
import 'package:hotel_booking/Screen/Home/review.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../constant.dart';
import '../Notification/notification.dart';
import '../Screen/Home/Payment/payment.dart';

import 'package:http/http.dart' as http;

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isOn = false;

  SharedPreferences? sharedPreferences;

  String name = 'Abdul Korim'; // Default name
  String email = 'maantheme@gmail.com'; // Default email

  // @override
  // void initState() {
  //   super.initState();
  //   _loadUserData();
  // }

  // Future<void> _loadUserData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   // Fetch and set the name and email from SharedPreferences
  //   final loadedName = prefs.getString('name');
  //   final loadedEmail = prefs.getString('email');

  //   // If the fetched data is not null, update the state with it
  //   if (loadedName != null && loadedEmail != null) {
  //     setState(() {
  //       name = loadedName;
  //       email = loadedEmail;
  //     });
  //   }
  // }

  @override
  void initState() {
    super.initState();
    getWishListApi();
  }

  //! http://192.168.85.111:9080/profile

  //! post api for fetching profile data

  //! http://192.168.85.111:9080/profile

  Future<Map<String, dynamic>> getWishListApi() async {
    var url = Uri.parse('http://192.168.85.111:9080/profile');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> profile = json.decode(response.body);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      // Update the state with the fetched data
      setState(() {
        name = profile['name'];
        email = profile['email'];
      });

      return profile;
    } else {
      // Handle error or return empty list
      print('Request failed with status: ${response.statusCode}.');
      return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: kTextStyle.copyWith(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: kMainColor,
        elevation: 0.0,
      ),
      backgroundColor: kMainColor,
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50.0,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft:
                          Radius.circular(30.0), //! here we made it circular
                      topRight:
                          Radius.circular(30.0), //! here we made it circular
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 60.0),
                      Text(
                        name,
                        style: kTextStyle.copyWith(
                            color: kTitleColor,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        email,
                        style: kTextStyle.copyWith(color: kGreyTextColor),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        width: context.width(),
                        height: context.height(),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0,
                                  right: 20.0,
                                  top: 20.0,
                                  bottom: 10),
                              child: Text(
                                'Account Setting',
                                style: kTextStyle.copyWith(
                                    color: kTitleColor, fontSize: 18.0),
                              ),
                            ),
                            ListTile(
                              onTap: () => const EditProfile().launch(context),
                              leading: const CircleAvatar(
                                backgroundColor: Color(0xFFFFE7DB),
                                child: Icon(
                                  FeatherIcons.edit,
                                  color: Color(0xFFFF8748),
                                ),
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: kGreyTextColor,
                              ),
                              title: Text(
                                'Edit Profile',
                                style: kTextStyle.copyWith(
                                    color: kGreyTextColor, fontSize: 18.0),
                              ),
                            ),
                            ListTile(
                              onTap: () => const Payment().launch(context),
                              leading: const CircleAvatar(
                                backgroundColor: Color(0xFFD5E5FF),
                                child: Icon(
                                  FeatherIcons.creditCard,
                                  color: Color(0xFF4B83FF),
                                ),
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: kGreyTextColor,
                              ),
                              title: Text(
                                'Payment',
                                style: kTextStyle.copyWith(
                                    color: kGreyTextColor, fontSize: 18.0),
                              ),
                            ),
                            ListTile(
                              onTap: () =>
                                  const Notificationlist().launch(context),
                              leading: const CircleAvatar(
                                backgroundColor: Color(0xFFFFECEC),
                                child: Icon(
                                  FeatherIcons.bell,
                                  color: Color(0xFFD74B4B),
                                ),
                              ),
                              trailing: RichText(
                                text: TextSpan(children: [
                                  WidgetSpan(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 14.0),
                                      child: Text(
                                        isOn ? 'On' : 'Off',
                                        style: kTextStyle.copyWith(
                                            color: kGreyTextColor),
                                      ),
                                    ),
                                  ),
                                  WidgetSpan(
                                      child: Switch(
                                    activeColor: kMainColor,
                                    onChanged: (bool value) {
                                      setState(() {
                                        isOn = value;
                                      });
                                    },
                                    value: isOn,
                                  )),
                                ]),
                              ),
                              title: Text(
                                'Notifications',
                                style: kTextStyle.copyWith(
                                    color: kGreyTextColor, fontSize: 18.0),
                              ),
                            ),
                            ListTile(
                              leading: const CircleAvatar(
                                backgroundColor: Color(0xFFE4FFF1),
                                child: Icon(
                                  Icons.translate,
                                  color: Color(0xFF13DD74),
                                ),
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: kGreyTextColor,
                              ),
                              title: Row(
                                children: [
                                  Text(
                                    'Language',
                                    style: kTextStyle.copyWith(
                                        color: kGreyTextColor, fontSize: 18.0),
                                  ),
                                  const Spacer(),
                                  Text(
                                    'English',
                                    style: kTextStyle.copyWith(
                                        color: kGreyTextColor),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, top: 25.0, bottom: 10.0),
                              child: Text(
                                'Are You a Property Owner?',
                                style: kTextStyle.copyWith(
                                    color: kTitleColor, fontSize: 18.0),
                              ),
                            ),
                            ListTile(
                              onTap: () => const Profile().launch(
                                  context), //! here we have launched profile only
                              leading: const CircleAvatar(
                                backgroundColor: Color(0xFFD5E5FF),
                                child: Icon(
                                  FeatherIcons.list,
                                  color: Color(0xFF4B83FF),
                                ),
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: kGreyTextColor,
                              ),
                              title: Text(
                                'List your property',
                                style: kTextStyle.copyWith(
                                    color: kGreyTextColor, fontSize: 18.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, top: 25.0, bottom: 10.0),
                              child: Text(
                                'Support',
                                style: kTextStyle.copyWith(
                                    color: kTitleColor, fontSize: 18.0),
                              ),
                            ),
                            ListTile(
                              onTap: () => const ChatScreen().launch(context),
                              leading: const CircleAvatar(
                                backgroundColor: Color(0xFFFFE6E7),
                                child: Icon(
                                  FeatherIcons.messageCircle,
                                  color: Color(0xFFD74B4B),
                                ),
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: kGreyTextColor,
                              ),
                              title: Text(
                                'Message',
                                style: kTextStyle.copyWith(
                                    color: kGreyTextColor, fontSize: 18.0),
                              ),
                            ),
                            ListTile(
                              onTap: () => const Review().launch(context),
                              leading: const CircleAvatar(
                                backgroundColor: Color(0xFFFFF0E3),
                                child: Icon(
                                  FeatherIcons.send,
                                  color: Color(0xFFFF8400),
                                ),
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: kGreyTextColor,
                              ),
                              title: Text(
                                'Give Us Feedback',
                                style: kTextStyle.copyWith(
                                    color: kGreyTextColor, fontSize: 18.0),
                              ),
                            ),
                            ListTile(
                              onTap: () => const Privacy().launch(context),
                              leading: const CircleAvatar(
                                backgroundColor: Color(0xFFD5E5FF),
                                child: Icon(
                                  FeatherIcons.alertCircle,
                                  color: Color(0xFF4B83FF),
                                ),
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: kGreyTextColor,
                              ),
                              title: Text(
                                'Terms of Service',
                                style: kTextStyle.copyWith(
                                    color: kGreyTextColor, fontSize: 18.0),
                              ),
                            ),
                            ListTile(
                              onTap: () => const About().launch(context),
                              leading: const CircleAvatar(
                                backgroundColor: Color(0xFFFFF0E3),
                                child: Icon(
                                  FeatherIcons.messageCircle,
                                  color: Color(0xFFFF8400),
                                ),
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: kGreyTextColor,
                              ),
                              title: Text(
                                'About Us',
                                style: kTextStyle.copyWith(
                                    color: kGreyTextColor, fontSize: 18.0),
                              ),
                            ),
                            ListTile(
                              leading: const CircleAvatar(
                                backgroundColor: Color(0xFFFFECEC),
                                child: Icon(
                                  FeatherIcons.logOut,
                                  color: Color(0xFFD74B4B),
                                ),
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: kGreyTextColor,
                              ),
                              title: Text(
                                'Log Out',
                                style: kTextStyle.copyWith(
                                    color: kGreyTextColor, fontSize: 18.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Positioned(
              top: -00,
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/profilepic.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
