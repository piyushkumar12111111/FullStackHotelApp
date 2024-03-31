import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking/Screen/Authentication/welcome.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../constant.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndexPage = 0;
  String buttonText = 'Next';
  double percent = 0.34;

  List<Map<String, dynamic>> sliderList = [
    {
      "title": 'Find your best Hotel to stay',
      "description":
          'Adipiscing vitae, id non vitae, elementum, purus fermentum. Mus aliquam pellentesque',
      "icon": 'images/onboard1.png',
    },
    {
      "title": 'Best apartment and hotel booking',
      "description":
          'Adipiscing vitae, id non vitae, elementum, purus fermentum. Mus aliquam pellentesque',
      "icon": 'images/onboard2.png',
    },
    {
      "title": 'Enjoy your holiday time',
      "description":
          'Adipiscing vitae, id non vitae, elementum, purus fermentum. Mus aliquam pellentesque',
      "icon": 'images/onboard3.png',
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: (const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFFDFF0E3),
                Color(0xFFFFFEFF),
              ],
            ),
          )),
          child: Column(
            children: [
              const SizedBox(
                height: 40.0,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20.0),
                height: 500,
                child: Stack(
                  children: [
                    PageView.builder(
                      itemCount: sliderList.length,
                      controller: pageController,
                      onPageChanged: (int index) =>
                          setState(() => currentIndexPage = index),
                      itemBuilder: (_, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 10.0, top: 15.0, bottom: 15.0),
                              child: Text(
                                sliderList[index]['title'].toString(),
                                style: GoogleFonts.manrope(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                  color: kTitleColor,
                                ),
                              ),
                            ),
                            // ignore: sized_box_for_whitespace
                            Text(
                              sliderList[index]['description'].toString(),
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                              style: kTextStyle.copyWith(
                                wordSpacing: 2.0,
                                color: kGreyTextColor,
                              ),
                            ),
                            const Spacer(),
                            Image.asset(sliderList[index]['icon'],
                                width: context.width(),
                                alignment: Alignment.bottomRight,
                                height: 340),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, bottom: 30.0),
                child: Row(
                  children: [
                    SmoothPageIndicator(
                      controller: pageController,
                      count: 3,
                      effect: const ExpandingDotsEffect(
                        dotColor: Color(0xFFD4EBD9),
                        activeDotColor: kMainColor,
                        dotHeight: 10.0,
                        dotWidth: 10.0,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          border:
                              Border.all(color: kMainColor.withOpacity(0.3))),
                      child: Container(
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          border: Border.all(
                            color: kMainColor.withOpacity(0.5),
                          ),
                        ),
                        child: const CircleAvatar(
                          radius: 30.0,
                          backgroundColor: kMainColor,
                          child: Image(
                            image: AssetImage('images/arrow.png'),
                          ),
                        ).onTap(
                          () => currentIndexPage > 2
                              ? pageController.nextPage(
                                  duration: const Duration(microseconds: 3000),
                                  curve: Curves.bounceInOut)
                              : const Welcome().launch(context),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
