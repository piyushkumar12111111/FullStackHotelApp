import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hotel_booking/Screen/Home/Map/direction.dart';
import 'package:hotel_booking/Screen/Home/booking.dart';
import 'package:hotel_booking/constant.dart';
import 'package:nb_utils/nb_utils.dart';
import 'Map/dhaka.dart';

class RoomDetails extends StatefulWidget {
  const RoomDetails({Key? key}) : super(key: key);

  @override
  State<RoomDetails> createState() => _RoomDetailsState();
}

class _RoomDetailsState extends State<RoomDetails> {
  bool isDateSelected = false;

  List<String> categoryList = [
    '2 bed',
    '1 Tub',
    'Cooler',
    'Wifi',
    '1 Ac',
    '2 bed',
    '1 Tub',
    'Cooler',
    'Wifi',
  ];
  String selected = 'Wifi';

  List<String> imageList = [
    'images/bed.png',
    'images/tub.png',
    'images/cooler.png',
    'images/wifi2.png',
    'images/ac.png',
    'images/bed.png',
    'images/tub.png',
    'images/cooler.png',
    'images/wifi2.png',
  ];

  List<String> indoorimgList = [
    'images/indoor1.png',
    'images/indoor2.png',
    'images/indoor3.png',
    'images/indoor1.png',
    'images/indoor2.png',
    'images/indoor3.png',
    'images/indoor1.png',
    'images/indoor2.png',
    'images/indoor3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Container(
          width: context.width(),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.0),
              topLeft: Radius.circular(30.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text(
                          '\$99',
                          style: kTextStyle.copyWith(
                            color: const Color(0xFFFF8748),
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ' / Per Night',
                          style: kTextStyle.copyWith(color: kGreyTextColor),
                        ),
                      ],
                    ),
                    Text(
                      'Apr 3 - Apr 6',
                      style: kTextStyle.copyWith(color: kTitleColor),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(10.0),
                    color: kMainColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                    child: Text(
                      'Booking',
                      style: kTextStyle.copyWith(
                          color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                ).onTap(
                  () => const Booking().launch(context),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset('images/indoor5.png'),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, top: 50, right: 20.0),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.white.withOpacity(0.3),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.white.withOpacity(0.3),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Icon(
                            FontAwesomeIcons.heart,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -10,
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    width: context.width(),
                    decoration: const BoxDecoration(
                      color: Color(0xFFFAFAFA),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        topLeft: Radius.circular(30.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Classic Flat Room',
                          style: kTextStyle.copyWith(
                              color: kTitleColor, fontSize: 18.0),
                        ),
                        const SizedBox(height: 4.0),
                        Row(
                          children: [
                            Text(
                              '2 Double beds',
                              style: kTextStyle.copyWith(
                                color: kGreyTextColor,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              'Room size 40 m',
                              style: kTextStyle.copyWith(
                                color: kGreyTextColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4.0),
                        Row(
                          children: [
                            RatingBarWidget(
                              onRatingChanged: null,
                              itemCount: 1,
                              inActiveColor: const Color(0xFFFFC60B),
                              size: 15.0,
                            ),
                            Text(
                              '4.9',
                              style: kTextStyle.copyWith(color: kGreyTextColor),
                            ),
                            Text(
                              '(225) review',
                              style: kTextStyle.copyWith(color: kTitleColor),
                            ),
                            const Spacer(),
                            Text(
                              'Map Direction',
                              style: kTextStyle.copyWith(
                                  color: kTitleColor, fontSize: 18.0),
                            ).onTap(
                              () => const MapScreen().launch(context),
                            ),
                            const SizedBox(width: 4.0),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: const Color(0xFFFF8748),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Icon(
                                  FeatherIcons.send,
                                  size: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Container(
              padding: const EdgeInsets.all(20.0),
              width: context.width(),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  topLeft: Radius.circular(30.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Facilities',
                    style: kTextStyle.copyWith(
                        color: kTitleColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5.0),
                  HorizontalList(
                    padding: EdgeInsets.zero,
                    spacing: 10.0,
                    itemCount: imageList.length,
                    itemBuilder: (_, i) {
                      return Column(
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
                          const Dhaka().launch(context);
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'Room Photos',
                    style: kTextStyle.copyWith(
                        color: kTitleColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  HorizontalList(
                    padding: EdgeInsets.zero,
                    spacing: 10.0,
                    itemCount: indoorimgList.length,
                    itemBuilder: (_, i) {
                      return Column(
                        children: [
                          Image.asset(indoorimgList[i]),
                          const SizedBox(
                            height: 4.0,
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'Discription',
                    style: kTextStyle.copyWith(
                        color: kTitleColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  ReadMoreText(
                    'Nulla sed dignissim turpis sit imperdiet ipsum conseq uat. Integer quisque aliquet fermentum iaculis molestie nunc. Vitae lectus malesuada in volutpat aenean duis sapien,Nulla sed dignissim turpis sit imperdiet ipsum conseq uat. Integer quisque aliquet fermentum iaculis molestie nunc. Vitae lectus malesuada in volutpat aenean duis sapien',
                    trimLength: 120,
                    colorClickableText: const Color(0xFFFF8748),
                    trimCollapsedText: 'Read More',
                    style: kTextStyle.copyWith(color: kTitleColor),
                  ),
                  const SizedBox(height: 10.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
