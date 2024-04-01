import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hotel_booking/GlobalComponents/button_global.dart';
import 'package:hotel_booking/Screen/Home/choose_room.dart';
import 'package:hotel_booking/Screen/Home/controller/hotelController.dart';
import 'package:hotel_booking/Screen/Home/review.dart';
import 'package:hotel_booking/constant.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'Map/dhaka.dart';

class Hotel extends StatefulWidget {
  const Hotel({Key? key}) : super(key: key);

  @override
  State<Hotel> createState() => _HotelState();
}

class _HotelState extends State<Hotel> {
  bool isDateSelected = false;

  List<String> categoryList = [
    'Wifi',
    'Gym',
    'Spa',
    'Parking',
    'Heating',
    'Wifi',
    'Gym',
    'Spa',
    'Parking',
  ];
  String selected = 'Wifi';

  List<String> imageList = [
    'images/wifi.png',
    'images/gym.png',
    'images/spa.png',
    'images/parking.png',
    'images/heating.png',
    'images/wifi.png',
    'images/gym.png',
    'images/spa.png',
    'images/parking.png',
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
      //! bottomnavbar for price
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
                    borderRadius: BorderRadiusDirectional.circular(20.0),
                    color: kMainColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      isDateSelected ? 'Choose Room' : 'Check Availablity',
                      style: kTextStyle.copyWith(
                          color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                ).onTap(
                  () => isDateSelected
                      ? const ChooseRoom().launch(context)
                      : showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              decoration: const BoxDecoration(),
                              height: 500,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.arrow_back_outlined,
                                          color: kTitleColor,
                                        ).onTap(
                                          () => finish(context),
                                        ),
                                        const SizedBox(width: 20.0),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Select Dates',
                                              style: kTextStyle.copyWith(
                                                  color: kTitleColor,
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Add your  booking dates for exact pricing',
                                              style: kTextStyle.copyWith(
                                                  color: kGreyTextColor),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10.0),
                                    Material(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      elevation: 1.0,
                                      color: Colors.white,
                                      child: SfDateRangePicker(
                                        todayHighlightColor: kMainColor,
                                        view: DateRangePickerView.month,
                                        selectionMode:
                                            DateRangePickerSelectionMode.range,
                                        rangeSelectionColor:
                                            kMainColor.withOpacity(0.1),
                                        endRangeSelectionColor: kMainColor,
                                        startRangeSelectionColor: kMainColor,
                                      ),
                                    ),
                                    const SizedBox(height: 10.0),
                                    ButtonGlobal(
                                        buttontext: 'Submit',
                                        buttonDecoration: kButtonDecoration
                                            .copyWith(color: kMainColor),
                                        onPressed: () {
                                          setState(() {
                                            isDateSelected = !isDateSelected;
                                          });
                                          finish(context);
                                        }),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
      //!
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                    'images/hotel2.png'), //! this will come in background
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, top: 50, right: 20.0),
                  child: Row(
                    children: [
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.white.withOpacity(0.3),
                          ),
                          child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              )),
                        ),
                      ),
                      const Spacer(),
                      InkWell(

                        onTap: (() {
                          
                        }),
                        child: Container(
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
                      ),
                    ],
                  ),
                ),
                //! use of positioned for position the widget in stack
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
                          'Sandy Hill Beach, West Sonadia',
                          style: kTextStyle.copyWith(
                              color: kTitleColor, fontSize: 18.0),
                        ),
                        const SizedBox(height: 4.0),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: Color(
                                0xFFFF8748,
                              ),
                              size: 18.0,
                            ),
                            Text(
                              '2,984 kilometres away',
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
            //! stack part end's
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
                    style:
                        kTextStyle.copyWith(color: kTitleColor, fontSize: 18.0),
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
                    height: 10.0,
                  ),
                  Text(
                    'Photo',
                    style:
                        kTextStyle.copyWith(color: kTitleColor, fontSize: 18.0),
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
                    'Description',
                    style:
                        kTextStyle.copyWith(color: kTitleColor, fontSize: 18.0),
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
                  Card(
                    child: Column(
                      children: [
                        //! expansiontile
                        ExpansionTile(
                          title: Text(
                            'Food and drink',
                            style: kTextStyle.copyWith(color: kTitleColor),
                          ),
                          children: const [
                            ListTile(
                              title: Text('Free buffet breakfast daily'),
                            ),
                            ListTile(
                              title: Text('Bar / lounge'),
                            ),
                            ListTile(
                              title: Text('Barbecue grills'),
                            ),
                            ListTile(
                              title: Text('Restaurant'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Card(
                    child: Column(
                      children: [
                        ExpansionTile(
                          title: Text(
                            'House Services',
                            style: kTextStyle.copyWith(color: kTitleColor),
                          ),
                          children: const [
                            ListTile(
                              title: Text('24-hour front desk'),
                            ),
                            ListTile(
                              title: Text('Concierge services'),
                            ),
                            ListTile(
                              title: Text('Laundry facilities'),
                            ),
                            ListTile(
                              title: Text('Porter/bellhop'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Card(
                    child: Column(
                      children: [
                        ExpansionTile(
                          title: Text(
                            'House Rules',
                            style: kTextStyle.copyWith(color: kTitleColor),
                          ),
                          children: const [
                            ListTile(
                              title: Text('Check-in: After 9:00 Am'),
                            ),
                            ListTile(
                              title: Text('Check out: 8:00 Pm'),
                            ),
                            ListTile(
                              title: Text('Pets are Allowed'),
                            ),
                            ListTile(
                              title: Text('No smoking'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Text(
                        'Reviews',
                        style: kTextStyle.copyWith(
                            color: kTitleColor, fontSize: 18.0),
                      ),
                      const Spacer(),
                      Text(
                        'See All',
                        style: kTextStyle.copyWith(color: kTitleColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  // Card(
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(20.0),
                  //       color: Colors.white,
                  //     ),
                  //     child: ListTile(
                  //       isThreeLine: true,
                  //       leading: const CircleAvatar(
                  //         backgroundImage: AssetImage('images/profile2.png'),
                  //       ),
                  //       title: Text(
                  //         'Wade Warren',
                  //         style: kTextStyle.copyWith(
                  //             color: kTitleColor, fontSize: 18.0),
                  //       ),
                  //       subtitle: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             '15 Apr 2022',
                  //             style: kTextStyle.copyWith(color: kGreyTextColor),
                  //           ),
                  //           const SizedBox(height: 5.0),
                  //           Text(
                  //             'Sagittis, convallis nibh gravida phas ellus sit  at erat faucibus erat.',
                  //             style: kTextStyle.copyWith(
                  //               color: kGreyTextColor,
                  //             ),
                  //             maxLines: 5,
                  //           ),
                  //         ],
                  //       ),
                  //       trailing: RichText(
                  //         text: TextSpan(
                  //           children: [
                  //             WidgetSpan(
                  //               child: RatingBarWidget(
                  //                 onRatingChanged: null,
                  //                 itemCount: 1,
                  //                 size: 18.0,
                  //               ),
                  //             ),
                  //             TextSpan(
                  //               text: '4.9',
                  //               style:
                  //                   kTextStyle.copyWith(color: kGreyTextColor),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  CardCarousel(),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 10.0),
                      child: Container(
                        width: context.width(),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.transparent,
                          border: Border.all(color: kTitleColor),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Write a Review',
                                style: kTextStyle.copyWith(
                                    color: kTitleColor, fontSize: 18.0),
                              ),
                            ).onTap(
                              () => const Review().launch(context),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardCarousel extends StatelessWidget {
  final TextStyle kTextStyle = TextStyle(color: Colors.black);
  final Color kTitleColor = Colors.black;
  final Color kGreyTextColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    List<Widget> cardList = List.generate(10,
        (index) => buildCardWidget(kTextStyle, kTitleColor, kGreyTextColor));

    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        height: 250, // Adjust the height if necessary

        viewportFraction: 0.85,
        aspectRatio: 2.0,
        initialPage: 0,
        enableInfiniteScroll: true,
      ),
      items: cardList.map((card) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: card,
            );
          },
        );
      }).toList(),
    );
  }

  Widget buildCardWidget(
      TextStyle kTextStyle, Color kTitleColor, Color kGreyTextColor) {
    // Placeholder for the RatingBarWidget, replace it with your actual widget
    Widget ratingPlaceholder = Container(
      padding: const EdgeInsets.only(right: 4.0),
      child: Icon(Icons.star, size: 18.0, color: Colors.amber),
    );

    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
        child: ListTile(
          isThreeLine: true,
          leading: const CircleAvatar(
            backgroundImage: AssetImage('images/profile2.png'),
          ),
          title: Text(
            'Wade Warren',
            style: kTextStyle.copyWith(color: kTitleColor, fontSize: 18.0),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '15 Apr 2022',
                style: kTextStyle.copyWith(color: kGreyTextColor),
              ),
              const SizedBox(height: 5.0),
              Text(
                'Sagittis, convallis nibh gravida phas ellus sit  at erat faucibus erat.',
                style: kTextStyle.copyWith(
                  color: kGreyTextColor,
                ),
                maxLines: 5,
              ),
            ],
          ),
          trailing: RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  child: RatingBarWidget(
                    onRatingChanged: null,
                    itemCount: 1,
                    size: 18.0,
                  ),
                ),
                TextSpan(
                  text: '4.9',
                  style: kTextStyle.copyWith(color: kGreyTextColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
