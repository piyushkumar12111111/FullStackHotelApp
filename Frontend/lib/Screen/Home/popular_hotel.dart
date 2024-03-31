import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hotel_booking/constant.dart';
import 'package:nb_utils/nb_utils.dart';

class PopularHotel extends StatefulWidget {
  const PopularHotel({Key? key}) : super(key: key);

  @override
  State<PopularHotel> createState() => _PopularHotelState();
}

class _PopularHotelState extends State<PopularHotel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        title: Text(
          'Popular Hotel',
          style: kTextStyle.copyWith(
              color: kTitleColor, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: const Color(0xFFF7F7F7),
        iconTheme: const IconThemeData(color: kTitleColor),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
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
                              Image.asset('images/hotel.png'),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  padding: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                    border: Border.all(color: Colors.white.withOpacity(0.5),),
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
    );
  }
}
