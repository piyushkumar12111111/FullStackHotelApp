import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hotel_booking/Notification/notification.dart';
import 'package:hotel_booking/Screen/Home/Map/dhaka.dart';
import 'package:hotel_booking/Screen/Home/controller/curosalcontroller.dart';
import 'package:hotel_booking/Screen/Home/hotel.dart';
import 'package:hotel_booking/Screen/Home/popular_hotel.dart';
import 'package:hotel_booking/Screen/Home/Search/search.dart';
import 'package:hotel_booking/constant.dart';
import 'package:nb_utils/nb_utils.dart';
import 'Search/Filter/filter.dart';

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
                            'Hello, Korim',
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
                        const Dhaka().launch(
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
                    itemCount: imgList.length,
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      // height: 200, // Fixed height
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
                        Positioned(
                          bottom: 70,
                          left: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.circle, color: Colors.white, size: 10),
                              Icon(Icons.circle, color: Colors.white, size: 10),
                              Icon(Icons.circle, color: Colors.white, size: 10),
                              Icon(Icons.circle, color: Colors.white, size: 10),
                            ],
                          ),
                        )
                      ],
                    ),
                  
                  ),
                ),

                const SizedBox(height: 20.0),
                Text(
                  'Recomended for your next trip',
                  style: kTextStyle.copyWith(
                      color: kTitleColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10.0),
                //! here recommend for your next trip
                HorizontalList(
                  padding: EdgeInsets.zero,
                  itemCount: 10,
                  itemBuilder: (_, i) {
                    return Container(
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
                                  'images/banner5.png'), //! background image
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(5.0),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                        color: Colors.white.withOpacity(0.3),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10.0),
                                        ),
                                      ),
                                      child: Text(
                                        '\$35 per Night',
                                        style: kTextStyle.copyWith(
                                            color: Colors.white,
                                            fontSize: 18.0),
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        border: Border.all(color: Colors.white),
                                        color: Colors.white.withOpacity(0.3),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Icon(
                                          FontAwesomeIcons.heart,
                                          size: 15.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            'Pan Pacific Sonargaon Dhaka',
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
                    ).onTap(
                      () => const Hotel().launch(context),
                    );
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
