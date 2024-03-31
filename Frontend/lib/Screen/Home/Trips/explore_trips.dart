import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constant.dart';

class ExploreTrips extends StatefulWidget {
  const ExploreTrips({Key? key}) : super(key: key);

  @override
  State<ExploreTrips> createState() => _ExploreTripsState();
}

class _ExploreTripsState extends State<ExploreTrips> {
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
              ListView.builder(
                itemCount: 3,
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
                              Image.asset('images/sea.png'),
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
                                'Cox\'s Bazar',
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
                                    '16.3 km',
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
                                    '4.9',
                                    style:
                                        kTextStyle.copyWith(color: kTitleColor),
                                  )
                                ],
                              ),
                              const SizedBox(height: 5.0),
                              Text(
                                'Start form \$60 per Night',
                                style: kTextStyle.copyWith(color: kTitleColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10.0),
              Text(
                'Popular Place',
                style: kTextStyle.copyWith(color: kTitleColor,fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              Column(
                children: [
                  ListView.builder(
                    itemCount: 10,
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
                                  Image.asset('images/sea2.png', width: context.width(),fit: BoxFit.cover,),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
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
                                            borderRadius: BorderRadius.circular(30.0),
                                            border: Border.all(color: Colors.white.withOpacity(0.5),),
                                            color: Colors.white.withOpacity(0.3),
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
                                'Rio de Janeiro, Brazil',
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
                                    '10,984 kilometres away',
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
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
