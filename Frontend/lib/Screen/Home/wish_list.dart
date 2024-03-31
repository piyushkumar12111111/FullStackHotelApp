import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hotel_booking/Screen/Home/hotel.dart';
import 'package:hotel_booking/constant.dart';
import 'package:nb_utils/nb_utils.dart';

class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
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
                              Image.asset('images/banner6.png',width: context.width(),fit: BoxFit.cover,),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,  //!
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
                                    const Spacer(),  //!
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
                    ).onTap(
                      () => const Hotel().launch(context),
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
