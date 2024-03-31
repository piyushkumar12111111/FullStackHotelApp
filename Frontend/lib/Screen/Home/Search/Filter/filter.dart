import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:hotel_booking/Screen/Home/Search/Filter/show_result.dart';
import 'package:hotel_booking/constant.dart';
import 'package:nb_utils/nb_utils.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  final dateController = TextEditingController();
  int bedrooms = 1;
  int bathrooms = 1;
  int roomNumber = 1;

  List<String> filterList = [
    'Pets Allowed',
    'Restaurant',
    'Swimming Pool',
    'Car Parking',
    'Fitness Center',
  ];

  List<String> propertyList = [
    'Flat',
    'Apartment',
    'Couple Corner',
    'Car Parking',
    'Hostel',
  ];

  List<String> paymentList = [
    'Pay at Hotel',
    'Online Payment',
    'Advance Payment',
  ];

  List<String> selectedList = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: context.width(),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(30.0),
                      color: kMainColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Center(
                        child: Text(
                          'Show Results',
                          style: kTextStyle.copyWith(
                              color: Colors.white, fontSize: 18.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ).onTap(
          () => const ShowResult().launch(context),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              children: [
                Text(
                  'Filters',
                  style:
                      kTextStyle.copyWith(color: kTitleColor, fontSize: 18.0),
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: const Color(0xFFFFE7DB),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(
                      FeatherIcons.x,
                      size: 18.0,
                      color: Color(0xFFFF8748),
                    ),
                  ),
                ).onTap(
                  () => finish(context),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: roomNumber,
                  itemBuilder: (_, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rooms & Beds',
                          style: kTextStyle.copyWith(
                              color: kTitleColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Text(
                              'Bedrooms',
                              style: kTextStyle.copyWith(color: kTitleColor),
                            ),
                            const Spacer(),
                            const Icon(FeatherIcons.minusCircle).onTap(() {
                              setState(() {
                                bedrooms > 1 ? bedrooms-- : bedrooms = 1;
                              });
                            }),
                            const SizedBox(width: 10.0),
                            Text(bedrooms.toString()),
                            const SizedBox(width: 10.0),
                            const Icon(FeatherIcons.plusCircle).onTap(() {
                              setState(() {
                                bedrooms++;
                              });
                            }),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                            Text(
                              'Bathrooms',
                              style: kTextStyle.copyWith(color: kTitleColor),
                            ),
                            const Spacer(),
                            const Icon(FeatherIcons.minusCircle).onTap(() {
                              setState(() {
                                bathrooms > 1 ? bathrooms-- : bathrooms = 1;
                              });
                            }),
                            const SizedBox(width: 10.0),
                            Text(bathrooms.toString()),
                            const SizedBox(width: 10.0),
                            const Icon(FeatherIcons.plusCircle).onTap(() {
                              setState(() {
                                bathrooms++;
                              });
                            }),
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        Card(
                          child: ExpansionTile(
                            title: Text(
                              'Service & Facilities',
                              style: kTextStyle.copyWith(
                                  color: kTitleColor, fontSize: 18.0),
                            ),
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: filterList.length,
                                itemBuilder: (_, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          filterList[index],
                                          style: kTextStyle.copyWith(
                                              color: kGreyTextColor),
                                        ).onTap(() {
                                          setState(() {
                                            selectedList
                                                    .contains(filterList[index])
                                                ? selectedList
                                                    .remove(filterList[index])
                                                : selectedList
                                                    .add(filterList[index]);
                                          });
                                        }),
                                        const Spacer(),
                                        Checkbox(
                                          value: selectedList.contains(
                                            filterList[index],
                                          ),
                                          onChanged: null,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              30.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Card(
                          child: ExpansionTile(
                            title: Text(
                              'Property Type',
                              style: kTextStyle.copyWith(
                                  color: kTitleColor, fontSize: 18.0),
                            ),
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: propertyList.length,
                                itemBuilder: (_, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          propertyList[index],
                                          style: kTextStyle.copyWith(
                                              color: kGreyTextColor),
                                        ).onTap(() {
                                          setState(() {
                                            selectedList.contains(
                                                    propertyList[index])
                                                ? selectedList
                                                    .remove(propertyList[index])
                                                : selectedList
                                                    .add(propertyList[index]);
                                          });
                                        }),
                                        const Spacer(),
                                        Checkbox(
                                          value: selectedList.contains(
                                            propertyList[index],
                                          ),
                                          onChanged: null,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              30.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Card(
                          child: ExpansionTile(
                            title: Text(
                              'Payment',
                              style: kTextStyle.copyWith(
                                  color: kTitleColor, fontSize: 18.0),
                            ),
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: paymentList.length,
                                itemBuilder: (_, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          paymentList[index],
                                          style: kTextStyle.copyWith(
                                              color: kGreyTextColor),
                                        ).onTap(() {
                                          setState(() {
                                            selectedList.contains(
                                                    paymentList[index])
                                                ? selectedList
                                                    .remove(paymentList[index])
                                                : selectedList
                                                    .add(paymentList[index]);
                                          });
                                        }),
                                        const Spacer(),
                                        Checkbox(
                                          value: selectedList.contains(
                                            paymentList[index],
                                          ),
                                          onChanged: null,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              30.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
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
