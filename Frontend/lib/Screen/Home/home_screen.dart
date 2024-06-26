import 'dart:async';
import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/Notification/notification.dart';
import 'package:hotel_booking/Screen/Home/Map/dhaka.dart';
import 'package:hotel_booking/Screen/Home/controller/curosalcontroller.dart';
import 'package:hotel_booking/Screen/Home/hotel.dart';
import 'package:hotel_booking/Screen/Home/popular_hotel.dart';
import 'package:hotel_booking/Screen/Home/Search/search.dart';
import 'package:hotel_booking/constant.dart';
import 'package:nb_utils/nb_utils.dart';
import 'Search/Filter/filter.dart';
import 'package:scroll_to_top/scroll_to_top.dart';

import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDateSelected = false;
  List<String> categoryList = [
    'Nearby',
    'Dhaka',
    'Chittagong',
    'Rajshahi',
    'Dinajpur',
    'Khulna',
    'Mymensingh',
    'Barisal',
    'Sylhet',
  ];
  String selected = 'Nearby';

  List<String> imageList = [
    'images/location.png',
    'images/dhaka.png',
    'images/ctg.png',
    'images/raj.png',
    'images/dnaj.png',
    'images/dhaka.png',
    'images/ctg.png',
    'images/raj.png',
    'images/dnaj.png',
  ];

  final List<String> imgList = [
    'Frontend/images/banner4.png',
    'Frontend/images/banner4.png',
    'Frontend/images/banner4.png',

    // Add more images URLs to this list
  ];

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState

    Timer.periodic(Duration(seconds: 4), (timer) {
      controller.changeIndex();
    });

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('reached end');
      }
    });

    super.initState();
  }

  CurosalController controller = Get.put(CurosalController());

  //! calling post api for showing hotels

  Future<List<dynamic>> getWishListApi() async {
    
    var url = Uri.parse('http://192.168.85.111:9080/rechotels');
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
   
   String name = 'User';
 
  Future<List<dynamic>> profileDataApi() async {
    
    var url = Uri.parse('http://192.168.85.111:9080/profile');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> profile = json.decode(response.body);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      //! update name 
      setState(() {
        name = profile[0]['name'];
      });
      return profile;
    } else {
      // Handle error or return empty list
      print('Request failed with status: ${response.statusCode}.');
      return [];
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F7F7),
        body: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 20.0,
                      backgroundImage: AssetImage('images/profile.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello, Hemant',
                            style: kTextStyle.copyWith(color: kGreyTextColor),
                          ),
                          Text(
                            'Let’s Find Best Hotel',
                            style: kTextStyle.copyWith(
                                color: kTitleColor,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(), //!
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: kGreyTextColor)),
                      child: const Padding(
                        padding: EdgeInsets.all(6.0),
                        child: Icon(Icons.notifications_none),
                      ),
                    ).onTap(
                      () => const Notificationlist().launch(context),
                    ),
                  ],
                ),
                const SizedBox(height: 30.0),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: const Color(0xFFECF3EE),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.search_outlined,
                          color: kTitleColor,
                        ),
                        Text(
                          'Search for hotel',
                          style: kTextStyle.copyWith(color: kGreyTextColor),
                        ).onTap(
                          () => const Search().launch(context),
                        ),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: kMainColor,
                          ),
                          child: const Icon(Icons.tune_outlined,
                              color: Colors.white),
                        ).onTap(
                          () => const Filter().launch(context),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                  child: Text(
                    'Explore City',
                    style: kTextStyle.copyWith(
                        color: kTitleColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                //! horizontal list
                HorizontalList(
                  spacing: 10.0,
                  itemCount: imageList.length,
                  itemBuilder: (_, i) {
                    return Column(
                      //! ontap on itembuilder return
                      children: [
                        Image.asset(imageList[i]),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          categoryList[i],
                          style: kTextStyle.copyWith(color: kGreyTextColor),
                        )
                      ],
                    ).onTap(
                      () {
                        Dhaka(
                          cityname: categoryList[i],
                        ).launch(
                            context); //! here we have same launch for every screen
                      },
                    );
                  },
                ),
                const SizedBox(height: 10.0),
                // HorizontalList(
                //   padding: EdgeInsets.zero,
                //   spacing: 10.0,
                //   itemCount: 5,
                //   itemBuilder: (_, i) {
                //     return Image.asset('images/banner4.png').onTap(
                //       //! only single banner displayed
                //       () {
                //         setState(
                //           () {
                //             selected = categoryList[i];
                //           },
                //         );
                //       },
                //     );
                //   },
                // ),

                //! create a curosel slider which makes image move authomtically image coming from list
                Center(
                  child: CarouselSlider.builder(
                    itemCount: controller.imgList.length,
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      height: 150, // Fixed height
                      aspectRatio: 16 / 9, // Aspect ratio for the width
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      pauseAutoPlayOnTouch: true,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true, // Enables the wrap-around
                    ),
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        Stack(
                      children: [
                        Container(
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            child: Image.asset(
                              "images/banner4.png",
                              fit: BoxFit.contain,
                              width: 1000,
                            ),
                          ),
                        ),
                        // Obx(() => Positioned(
                        //       bottom: 70,
                        //       left: 100,
                        //       child: Row(
                        //         mainAxisAlignment:
                        //             MainAxisAlignment.spaceEvenly,
                        //         children: [
                        //           Icon(Icons.circle,
                        //               color: controller.currentIndex == 0
                        //                   ? Colors.black
                        //                   : Colors.white,
                        //               size: 10),
                        //           Icon(Icons.circle,
                        //               color: controller.currentIndex == 1
                        //                   ? Colors.black
                        //                   : Colors.white,
                        //               size: 10),
                        //           Icon(Icons.circle,
                        //               color: controller.currentIndex == 2
                        //                   ? Colors.black
                        //                   : Colors.white,
                        //               size: 10),
                        //           Icon(Icons.circle,
                        //               color: controller.currentIndex == 4
                        //                   ? Colors.black
                        //                   : Colors.white,
                        //               size: 10),
                        //         ],
                        //       ),
                        //     ))
                      ],
                    ),
                  ),
                ),

                // const SizedBox(height: 5.0),
                Text(
                  'Recomended for your next trip',
                  style: kTextStyle.copyWith(
                      color: kTitleColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15.0),
                //! here recommend for your next trip

                FutureBuilder<List<dynamic>>(
                  future: getWishListApi(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<dynamic>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 2,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: 10.0);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return ShimmerLoadingContainer();
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      List<dynamic> hotels = snapshot.data ?? [];
                      return ListView.builder(
                        //scrollDirection: Axis.horizontal,
                        itemCount: hotels.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) {
                          var hotel = hotels[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              width: MediaQuery.of(context).size.width,
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
                                        'images/banner5.png',
                                        width:
                                            MediaQuery.of(context).size.width,
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
                                                color: Colors.white
                                                    .withOpacity(0.3),
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
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    Text(
                      'Popular Hotel',
                      style: kTextStyle.copyWith(
                          color: kTitleColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                    const Spacer(), //! add max gap
                    Text(
                      'See More',
                      style: kTextStyle.copyWith(
                        color: kGreyTextColor,
                      ),
                    ).onTap(
                      () => const PopularHotel().launch(context),
                    ),
                  ],
                ),
                ListView.builder(
                  itemCount: 10,
                  shrinkWrap:
                      true, //! shrinkwrap for listview.builder if not visible
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    //! itembuilder here
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
                                Image.asset(
                                    'images/hotel.png'), //! background image
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      border: Border.all(
                                        color: Colors.white.withOpacity(0.5),
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
                                  'Nagar Valley Hotel Ltd.',
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
                                    Image.asset('images/distance.png'),
                                    const SizedBox(width: 5.0),
                                    Text(
                                      '14.3 km',
                                      style: kTextStyle.copyWith(
                                          color: kGreyTextColor),
                                    ),
                                    const SizedBox(width: 90),
                                    RatingBarWidget(
                                      onRatingChanged: null,
                                      itemCount: 1,
                                      inActiveColor: const Color(0xFFFFC60B),
                                      size: 15.0,
                                    ),
                                    const SizedBox(width: 2.0),
                                    Text(
                                      '5.0',
                                      style: kTextStyle.copyWith(
                                          color: kTitleColor),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 5.0),
                                Text(
                                  'Start form \$60 per Night',
                                  style:
                                      kTextStyle.copyWith(color: kTitleColor),
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
            ),
          ),
        ),
      ),
    );
  }
}

class ShimmerLoadingContainer extends StatelessWidget {
  final double width;
  final double height;

  const ShimmerLoadingContainer({
    Key? key,
    this.width = 500.0,
    this.height = 200.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(30),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.5),
          //     spreadRadius: 5,
          //     blurRadius: 7,
          //     offset: Offset(0, 3),
          //   ),
          // ],
        ),
      ),
    );
  }
}
