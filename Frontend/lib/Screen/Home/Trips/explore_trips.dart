import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constant.dart';
import 'package:http/http.dart' as http;

class ExploreTrips extends StatefulWidget {
  const ExploreTrips({Key? key}) : super(key: key);

  @override
  State<ExploreTrips> createState() => _ExploreTripsState();
}

class _ExploreTripsState extends State<ExploreTrips> {
  @override
  void initState() {
    super.initState();
    popHotelListapi();
  }

  Future<List<dynamic>> getWishListApi() async {
    var url = Uri.parse('http://192.168.85.111:9080/places');
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

  //! http://192.168.85.111:9080/popularhotels

  Future<List<dynamic>> popHotelListapi() async {
    var url = Uri.parse('http://192.168.85.111:9080/popularhotels');
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
          'Trips',
          style: kTextStyle.copyWith(color: kTitleColor),
        ),
        iconTheme: const IconThemeData(color: kTitleColor),
        backgroundColor: const Color(0xFFF7F7F7),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Recommended Places',
                style: kTextStyle.copyWith(
                    color: kTitleColor, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
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
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    Image.asset('images/sea.png'),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        padding: const EdgeInsets.all(5.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          border: Border.all(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                          ),
                                          color: Colors.white.withOpacity(0.3),
                                        ),
                                        child: const Icon(
                                          FontAwesomeIcons.heart,
                                          size: 10.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 5.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      hotel['name'],
                                      style: kTextStyle.copyWith(
                                          color: kTitleColor,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 5.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Image.asset('images/distance.png'),
                                        //const SizedBox(width: 5.0),
                                        Text(
                                          hotel['distance'].toString() + ' km',
                                          style: kTextStyle.copyWith(
                                              color: kGreyTextColor),
                                        ),
                                        const SizedBox(width: 90),
                                        RatingBarWidget(
                                          onRatingChanged: null,
                                          itemCount: 1,
                                          inActiveColor:
                                              const Color(0xFFFFC60B),
                                          size: 15.0,
                                        ),
                                        const SizedBox(width: 2.0),
                                        Text(
                                          hotel['rating'].toString(),
                                          style: kTextStyle.copyWith(
                                              color: kTitleColor),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 5.0),
                                    // Text(
                                    //   'Start form \$60 per Night',
                                    //   style: kTextStyle.copyWith(
                                    //       color: kTitleColor),
                                    // ),

                                    RichText(
                                        text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Start form ',
                                          style: kTextStyle.copyWith(
                                              color: kGreyTextColor),
                                        ),
                                        TextSpan(
                                          text: '\$${hotel['charges']}',
                                          style: kTextStyle.copyWith(
                                              color: kMainColor),
                                        ),
                                        TextSpan(
                                          text: ' per Night',
                                          style: kTextStyle.copyWith(
                                              color: kGreyTextColor),
                                        ),
                                      ],
                                    )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
              const SizedBox(height: 10.0),
              Text(
                'Popular Place',
                style: kTextStyle.copyWith(
                    color: kTitleColor, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              // Column(
              //   children: [
              //     ListView.builder(
              //       itemCount: 10,
              //       shrinkWrap: true,
              //       physics: const NeverScrollableScrollPhysics(),
              //       itemBuilder: (_, index) {
              //         return Padding(
              //           padding: const EdgeInsets.only(bottom: 10.0),
              //           child: Container(
              //             padding: const EdgeInsets.all(10.0),
              //             width: context.width() / 1.5,
              //             decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(20.0),
              //               color: Colors.white,
              //             ),
              //             child: Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               mainAxisSize: MainAxisSize.min,
              //               children: [
              //                 Stack(
              //                   alignment: Alignment.topLeft,
              //                   children: [
              //                     Image.asset(
              //                       'images/sea2.png',
              //                       width: context.width(),
              //                       fit: BoxFit.cover,
              //                     ),
              //                     Padding(
              //                       padding: const EdgeInsets.all(4.0),
              //                       child: Row(
              //                         mainAxisSize: MainAxisSize.min,
              //                         children: [
              //                           Container(
              //                             padding: const EdgeInsets.all(5.0),
              //                             decoration: BoxDecoration(
              //                               border:
              //                                   Border.all(color: Colors.white),
              //                               color:
              //                                   Colors.white.withOpacity(0.3),
              //                               borderRadius:
              //                                   const BorderRadius.only(
              //                                 topLeft: Radius.circular(10.0),
              //                               ),
              //                             ),
              //                             child: Text(
              //                               '\$99 per Night',
              //                               style: kTextStyle.copyWith(
              //                                   color: Colors.white,
              //                                   fontSize: 18.0),
              //                             ),
              //                           ),
              //                           const Spacer(),
              //                           Container(
              //                             alignment: Alignment.topRight,
              //                             decoration: BoxDecoration(
              //                               borderRadius:
              //                                   BorderRadius.circular(30.0),
              //                               border: Border.all(
              //                                 color:
              //                                     Colors.white.withOpacity(0.5),
              //                               ),
              //                               color:
              //                                   Colors.white.withOpacity(0.3),
              //                             ),
              //                             child: const Padding(
              //                               padding: EdgeInsets.all(5.0),
              //                               child: Icon(
              //                                 FontAwesomeIcons.heart,
              //                                 size: 18.0,
              //                                 color: Colors.white,
              //                               ),
              //                             ),
              //                           ),
              //                         ],
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //                 const SizedBox(height: 10.0),
              //                 Text(
              //                   'Rio de Janeiro, Brazil',
              //                   style: kTextStyle.copyWith(
              //                       color: kTitleColor,
              //                       fontSize: 18.0,
              //                       fontWeight: FontWeight.bold),
              //                 ),
              //                 Row(
              //                   children: [
              //                     const Icon(
              //                       Icons.location_on,
              //                       color: Color(0xFFFF8748),
              //                       size: 18.0,
              //                     ),
              //                     Text(
              //                       '10,984 kilometres away',
              //                       style: kTextStyle.copyWith(
              //                         color: kGreyTextColor,
              //                       ),
              //                     ),
              //                     const Spacer(),
              //                     Container(
              //                       decoration: BoxDecoration(
              //                         borderRadius: BorderRadius.circular(30.0),
              //                         color: kMainColor,
              //                       ),
              //                       child: Padding(
              //                         padding: const EdgeInsets.all(10.0),
              //                         child: Image.asset('images/arrow.png'),
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ],
              //             ),
              //           ),
              //         );
              //       },
              //     ),
              //   ],
              // ),
              FutureBuilder<List<dynamic>>(
                future: popHotelListapi(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<dynamic>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    List<dynamic> hotels = snapshot.data ?? [];
                    return Column(
                      children: [
                        ListView.builder(
                          itemCount: hotels.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (_, index) {
                            return Padding(
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
                                          'images/sea2.png',
                                          width: context.width(),
                                          fit: BoxFit.cover,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.white),
                                                  color: Colors.white
                                                      .withOpacity(0.3),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10.0),
                                                  ),
                                                ),
                                                child: Text(
                                                  '\$99 per Night',
                                                  style: kTextStyle.copyWith(
                                                      color: Colors.white,
                                                      fontSize: 18.0),
                                                ),
                                              ),
                                              const Spacer(),
                                              Container(
                                                alignment: Alignment.topRight,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                  border: Border.all(
                                                    color: Colors.white
                                                        .withOpacity(0.5),
                                                  ),
                                                  color: Colors.white
                                                      .withOpacity(0.3),
                                                ),
                                                child: const Padding(
                                                  padding: EdgeInsets.all(5.0),
                                                  child: Icon(
                                                    FontAwesomeIcons.heart,
                                                    size: 18.0,
                                                    color: Colors.white,
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
                                      hotels[index]['name'],
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
                                          hotels[index]['distance'].toString() +
                                              ' km away',
                                          style: kTextStyle.copyWith(
                                            color: kGreyTextColor,
                                          ),
                                        ),
                                        const Spacer(),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            color: kMainColor,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child:
                                                Image.asset('images/arrow.png'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
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
