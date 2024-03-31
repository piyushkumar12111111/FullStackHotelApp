import 'package:flutter/material.dart';
import 'package:hotel_booking/Screen/Home/Trips/explore_trips.dart';
import 'package:hotel_booking/constant.dart';
import 'package:nb_utils/nb_utils.dart';

class Trips extends StatefulWidget {
  const Trips({Key? key}) : super(key: key);

  @override
  State<Trips> createState() => _TripsState();
}

class _TripsState extends State<Trips> {
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
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                  ),
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        const Image(
                          image: AssetImage('images/bg.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Start Planning Your First\nAdventure',
                                style: kTextStyle.copyWith(
                                    color: kTitleColor,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 20.0),
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 20.0,
                                    top: 5.0,
                                    bottom: 5.0,
                                    right: 10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: kMainColor,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Explore Trips',
                                      style: kTextStyle.copyWith(
                                          color: Colors.white),
                                    ),
                                    const SizedBox(width: 4.0),
                                    const Image(
                                      image: AssetImage('images/arrow.png'),
                                    ),
                                  ],
                                ),
                              ).onTap(
                                () => const ExploreTrips().launch(context),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
