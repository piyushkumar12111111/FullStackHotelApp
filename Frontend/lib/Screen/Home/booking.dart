import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:hotel_booking/Screen/Home/Payment/payment.dart';
import 'package:hotel_booking/Screen/Home/room_details.dart';
import 'package:hotel_booking/constant.dart';
import 'package:nb_utils/nb_utils.dart';

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  final dateController = TextEditingController();
  int adultCount = 1;
  int childrenCount = 1;
  int roomNumber = 1;

  bool showCounter = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        'Payment',
                        style:
                            kTextStyle.copyWith(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ).onTap(()=>const Payment().launch(context),),
      appBar: AppBar(
        title: Text(
          'Booking',
          style: kTextStyle.copyWith(color: kTitleColor, fontSize: 18.0),
        ),
        iconTheme: const IconThemeData(color: kTitleColor),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10.0),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Image.asset('images/indoor6.png'),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
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
                                RatingBarWidget(
                                    onRatingChanged: null,
                                    itemCount: 1,
                                    size: 18.0),
                                Text(
                                  '4.9  ',
                                  style: kTextStyle.copyWith(
                                      color: kGreyTextColor, fontSize: 18.0),
                                ),
                                Text(
                                  '(100 reviews)',
                                  style: kTextStyle.copyWith(
                                      color: kTitleColor, fontSize: 18.0),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4.0),
                            Row(
                              children: [
                                Text(
                                  'View Details',
                                  style: kTextStyle.copyWith(
                                      color: const Color(0xFFFF8748),
                                      fontSize: 18.0),
                                ).onTap(()=>const RoomDetails().launch(context),),
                                const SizedBox(width: 10.0),
                                Image.asset('images/arrow2.png'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: context.width(),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  topLeft: Radius.circular(30.0),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Trip',
                      style: kTextStyle.copyWith(
                          color: kTitleColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(
                          child: AppTextField(
                            textFieldType: TextFieldType.NAME,
                            readOnly: true,
                            onTap: () async {
                              var date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100));
                              dateController.text =
                                  date.toString().substring(0, 10);
                            },
                            controller: dateController,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: 'Check-in',
                              hintText: 'Sar, Apr 03',
                              labelStyle: kTextStyle.copyWith(
                                  color: kTitleColor, fontSize: 18.0),
                              hintStyle:
                                  kTextStyle.copyWith(color: kGreyTextColor),
                              suffixIcon: const Icon(FeatherIcons.calendar),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: AppTextField(
                            textFieldType: TextFieldType.NAME,
                            readOnly: true,
                            onTap: () async {
                              var date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100));
                              dateController.text =
                                  date.toString().substring(0, 10);
                            },
                            controller: dateController,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: 'Check-in',
                              hintText: 'Sar, Apr 03',
                              labelStyle: kTextStyle.copyWith(
                                  color: kTitleColor, fontSize: 18.0),
                              hintStyle:
                                  kTextStyle.copyWith(color: kGreyTextColor),
                              suffixIcon: const Icon(FeatherIcons.calendar),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    AppTextField(
                      textFieldType: TextFieldType.NAME,
                      readOnly: true,
                      onTap: () {
                        setState(() {
                          showCounter = !showCounter;
                        });
                      },
                      controller: dateController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Rooms & Guests',
                        hintText:
                            '$roomNumber Room, $adultCount Guests, $childrenCount Children',
                        labelStyle: kTextStyle.copyWith(
                            color: kTitleColor, fontSize: 18.0),
                        hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
                        suffixIcon: const Icon(Icons.expand_more_outlined),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      'Contact Details',
                      style: kTextStyle.copyWith(
                          color: kTitleColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15.0),
                    AppTextField(
                      textFieldType: TextFieldType.EMAIL,
                      decoration: kInputDecoration.copyWith(
                        labelText: 'Email Address',
                        hintText: 'abdulkorim@gmail.com',
                        labelStyle: kTextStyle.copyWith(
                            color: kTitleColor, fontSize: 18.0),
                        hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    AppTextField(
                      textFieldType: TextFieldType.PHONE,
                      decoration: kInputDecoration.copyWith(
                        labelText: 'Phone Number',
                        hintText: '+235 2365 1462',
                        labelStyle: kTextStyle.copyWith(
                            color: kTitleColor, fontSize: 18.0),
                        hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    ListView.builder(
                      shrinkWrap: true,
                        itemCount: roomNumber,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_,index){
                      return Card(
                        child: Column(
                          children: [
                            ExpansionTile(
                              title: Text(
                                'Room ${index+1}',
                                style: kTextStyle.copyWith(color: kTitleColor),
                              ),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: AppTextField(
                                    textFieldType: TextFieldType.NAME,
                                    decoration: kInputDecoration.copyWith(
                                      labelText: 'Adult Full Name',
                                      hintText: 'Abdul Korim',
                                      labelStyle: kTextStyle.copyWith(
                                          color: kTitleColor),
                                      hintStyle: kTextStyle.copyWith(
                                          color: kGreyTextColor),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5.0),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: AppTextField(
                                    textFieldType: TextFieldType.NAME,
                                    decoration: kInputDecoration.copyWith(
                                      labelText: 'Child Full Name',
                                      hintText: 'Rana Khan',
                                      labelStyle: kTextStyle.copyWith(
                                          color: kTitleColor),
                                      hintStyle: kTextStyle.copyWith(
                                          color: kGreyTextColor),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Price Details',
                          style: kTextStyle.copyWith(
                              color: kTitleColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                          children: [
                            Text(
                              '\$99 X 4 Nights',
                              style: kTextStyle.copyWith(
                                color: kGreyTextColor,
                                fontSize: 16.0,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              '\$396.00',
                              style: kTextStyle.copyWith(
                                  color: kTitleColor, fontSize: 16.0),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                          children: [
                            Text(
                              'Security Deposit',
                              style: kTextStyle.copyWith(
                                  color: kGreyTextColor, fontSize: 16.0),
                            ),
                            const Spacer(),
                            Text(
                              '\$30.00',
                              style: kTextStyle.copyWith(
                                  color: kTitleColor, fontSize: 16.0),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                          children: [
                            Text(
                              'Service fee',
                              style: kTextStyle.copyWith(
                                  color: kGreyTextColor, fontSize: 16.0),
                            ),
                            const Spacer(),
                            Text(
                              '\$10.00',
                              style: kTextStyle.copyWith(
                                  color: kTitleColor, fontSize: 16.0),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4.0),
                        const Divider(thickness: 1.0),
                        Row(
                          children: [
                            Text(
                              'Total',
                              style: kTextStyle.copyWith(
                                  color: kTitleColor,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            Text(
                              '\$436.00',
                              style: kTextStyle.copyWith(
                                color: const Color(0xFFFF8748),
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ).visible(!showCounter),
            Card(
              elevation: 0.0,
              color: const Color(0xFFFDFDFD),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              // ignore: sized_box_for_whitespace
              child: SizedBox(
                  width: context.width(),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                    'Rooms ${index + 1}:',
                                    style: kTextStyle.copyWith(
                                        color: kTitleColor,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Adults',
                                        style: kTextStyle.copyWith(
                                            color: kTitleColor),
                                      ),
                                      const Spacer(),
                                      const Icon(FeatherIcons.minusCircle)
                                          .onTap(() {
                                        setState(() {
                                          adultCount > 1
                                              ? adultCount--
                                              : adultCount = 1;
                                        });
                                      }),
                                      const SizedBox(width: 10.0),
                                      Text(adultCount.toString()),
                                      const SizedBox(width: 10.0),
                                      const Icon(FeatherIcons.plusCircle)
                                          .onTap(() {
                                        setState(() {
                                          adultCount++;
                                        });
                                      }),
                                    ],
                                  ),
                                  Text(
                                    'Age 13+',
                                    style: kTextStyle.copyWith(
                                        color: kGreyTextColor),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Row(
                                    children: [
                                      Text(
                                        'Children',
                                        style: kTextStyle.copyWith(
                                            color: kTitleColor),
                                      ),
                                      const Spacer(),
                                      const Icon(FeatherIcons.minusCircle)
                                          .onTap(() {
                                        setState(() {
                                          childrenCount > 1
                                              ? childrenCount--
                                              : childrenCount = 1;
                                        });
                                      }),
                                      const SizedBox(width: 10.0),
                                      Text(childrenCount.toString()),
                                      const SizedBox(width: 10.0),
                                      const Icon(FeatherIcons.plusCircle)
                                          .onTap(() {
                                        setState(() {
                                          childrenCount++;
                                        });
                                      }),
                                    ],
                                  ),
                                  Text(
                                    'Age 2-12+',
                                    style: kTextStyle.copyWith(
                                        color: kGreyTextColor),
                                  ),
                                  const SizedBox(height: 4.0),
                                  const Divider(thickness: 1.0),
                                  const SizedBox(height: 20.0),
                                ],
                              );
                            }),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(10.0),
                                  color: Colors.white,
                                  border: Border.all(
                                    color: const Color(0xFFFF8748),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Center(
                                    child: Text(
                                      'Add Room',
                                      style: kTextStyle.copyWith(
                                        color: const Color(0xFFFF8748),
                                      ),
                                    ),
                                  ),
                                ),
                              ).onTap(() {
                                setState(() {
                                  roomNumber++;
                                });
                              }),
                            ),
                            const SizedBox(width: 10.0),
                            Expanded(
                              flex: 3,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(10.0),
                                  color: Colors.white,
                                  border: Border.all(
                                    color: const Color(0xFFF00000),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Center(
                                    child: Text(
                                      'Remove Room',
                                      style: kTextStyle.copyWith(
                                        color: const Color(0xFFF00000),
                                      ),
                                    ),
                                  ),
                                ),
                              ).onTap(() {
                                setState(() {
                                  roomNumber > 1
                                      ? roomNumber--
                                      : roomNumber = 1;
                                });
                              }),
                            ),
                            const SizedBox(width: 10.0),
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(10.0),
                                  color: kMainColor,
                                  border: Border.all(
                                    color: kMainColor,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Center(
                                    child: Text(
                                      'Save',
                                      style: kTextStyle.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ).onTap(
                                  () {
                                    setState(
                                      () {
                                        showCounter = !showCounter;
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
            ).visible(showCounter),
          ],
        ),
      ),
    );
  }
}
