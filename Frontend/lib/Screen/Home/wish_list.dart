import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hotel_booking/Screen/Home/hotel.dart';
import 'package:hotel_booking/constant.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:http/http.dart' as http;
import 'package:vibration/vibration.dart';

class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
//! calling get api for showing wishlists hotels

  // @override
  // void initState() {
  //   super.initState();
  //   getWishListApi();
  // }

  Future<List<dynamic>> getWishListApi() async {
    var url = Uri.parse('http://192.168.85.111:9080/hotels');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> hotels = json.decode(response.body);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      return hotels;
    } else {
      // Handle error or return empty list
      print('Request failed with status: ${response.statusCode}.');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        title: Text(
          'Wishlists',
          style: kTextStyle.copyWith(color: kTitleColor, fontSize: 18.0),
        ),
        iconTheme: const IconThemeData(color: kTitleColor),
        backgroundColor: const Color(0xFFF7F7F7),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ListView.builder(
                itemCount: 1,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: () async {
                      bool? canVibrate = await Vibration.hasVibrator();
                      if (canVibrate == true) {
                        Vibration.vibrate();

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Hotel()),
                        );
                      }
                    },
                    child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          width: context.width() / 1.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Stack(
                                alignment: Alignment.topLeft,
                                children: [
                                  Image.asset(
                                    'images/banner6.png',
                                    width: context.width(),
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min, //!
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(5.0),
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.white),
                                            color:
                                                Colors.white.withOpacity(0.3),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(10.0),
                                            ),
                                          ),
                                          child: Text(
                                            '\$99 per Night',
                                            style: kTextStyle.copyWith(
                                                color: Colors.white,
                                                fontSize: 18.0),
                                          ),
                                        ),
                                        const Spacer(), //!
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            border:
                                                Border.all(color: Colors.white),
                                            color:
                                                Colors.white.withOpacity(0.3),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Icon(
                                              FontAwesomeIcons.solidHeart,
                                              size: 15.0,
                                              color: Color(0xFFFF8748),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10.0),
                              Text(
                                'Sandy Hill Beach, West Sonadia',
                                style: kTextStyle.copyWith(
                                    color: kTitleColor,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: Color(0xFFFF8748),
                                    size: 18.0,
                                  ),
                                  Text(
                                    '2,984 kilometres away',
                                    style: kTextStyle.copyWith(
                                      color: kGreyTextColor,
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      color: kMainColor,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Image.asset('images/arrow.png'),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                  );
                },
              ),

              //!

              //! future builder for showing wishlists hotels
              FutureBuilder<List<dynamic>>(
                future: getWishListApi(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<dynamic>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    List<dynamic> hotels = snapshot.data ?? [];
                    return ListView.builder(
                      itemCount: hotels.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        var hotel = hotels[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            width: context.width(),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Stack(
                                  alignment: Alignment.topLeft,
                                  children: [
                                    // Replace with your network image
                                    Image.asset(
                                      'images/banner6.png',
                                      width: context.width(),
                                      fit: BoxFit.cover,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              '${hotel['name']} - \$99 per Night',
                                              style: kTextStyle.copyWith(
                                                  color: Colors.white,
                                                  fontSize: 18.0),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                              border: Border.all(
                                                  color: Colors.white),
                                              color:
                                                  Colors.white.withOpacity(0.3),
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.all(5.0),
                                              child: Icon(
                                                FontAwesomeIcons.solidHeart,
                                                size: 15.0,
                                                color: Color(0xFFFF8748),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10.0),
                                Text(
                                  hotel['name'],
                                  style: kTextStyle.copyWith(
                                      color: kTitleColor,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 4.0),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          color: Color(0xFFFF8748),
                                          size: 18.0,
                                        ),
                                        Text(
                                          hotel['location'],
                                          style: kTextStyle.copyWith(
                                              color: kGreyTextColor),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Color(0xFFFF8748),
                                          size: 18.0,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          hotel['rating'].toString(),
                                          style: kTextStyle.copyWith(
                                              color: kGreyTextColor),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ).onTap(
                            () => const Hotel().launch(context),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
