import 'package:flutter/material.dart';
import 'package:hotel_booking/Screen/Home/room_details.dart';
import 'package:hotel_booking/constant.dart';
import 'package:nb_utils/nb_utils.dart';

class ChooseRoom extends StatefulWidget {
  const ChooseRoom({Key? key}) : super(key: key);

  @override
  State<ChooseRoom> createState() => _ChooseRoomState();
}

class _ChooseRoomState extends State<ChooseRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Choose Room',
          style: kTextStyle.copyWith(color: kTitleColor, fontSize: 18),
        ),
        iconTheme: const IconThemeData(color: kTitleColor),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            children: [
              ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
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
                                'images/indoor4.png',
                                width: context.width(),
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(5.0),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10.0),
                                        ),
                                      ),
                                      child: Text(
                                        'Up to -30%',
                                        style: kTextStyle.copyWith(
                                          color: const Color(0xFFFF8748),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            'Classic Flat Room',
                            style: kTextStyle.copyWith(
                                color: kTitleColor,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
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
                          const SizedBox(height: 20.0),
                          Row(
                            children: [
                              Text(
                                '\$399',
                                style: kTextStyle.copyWith(
                                  color: const Color(0xFFFF8748),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '  / 4 Night',
                                style:
                                    kTextStyle.copyWith(color: kGreyTextColor),
                              ),
                              const Spacer(),
                              Container(
                              
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: kMainColor,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    'Book Now',
                                    style: kTextStyle.copyWith(
                                        color: Colors.white, fontSize: 18.0),
                                  ).onTap(()=>const RoomDetails().launch(context),),
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
        ),
      ),
    );
  }
}
