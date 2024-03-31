import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:hotel_booking/Screen/Home/Payment/payment_confirmed.dart';
import 'package:hotel_booking/constant.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../GlobalComponents/button_global.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final dateController = TextEditingController();

  void showPopUp() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: SizedBox(
            height: 330.0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Pay With Visa Card',
                        style: kTextStyle.copyWith(
                            color: kTitleColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: const Color(0xFFFFE7DB),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(
                            FeatherIcons.x,
                            color: Color(0xFFFF8748),
                          ),
                        ),
                      ).onTap(
                        () => finish(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25.0),
                  AppTextField(
                    textFieldType: TextFieldType.NAME,
                    decoration: kInputDecoration.copyWith(
                      labelText: 'Card Number*',
                      hintText: '1234 5678 9101',
                      labelStyle: kTextStyle.copyWith(color: kTitleColor),
                      hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
                    ),
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
                          decoration: kInputDecoration.copyWith(
                            border: const OutlineInputBorder(),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: 'MM/YY*',
                            hintText: '6/22',
                            labelStyle: kTextStyle.copyWith(
                                color: kTitleColor, fontSize: 18.0),
                            hintStyle:
                                kTextStyle.copyWith(color: kGreyTextColor),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: AppTextField(
                          textFieldType: TextFieldType.NAME,
                          decoration: kInputDecoration.copyWith(
                            border: const OutlineInputBorder(),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: 'CVC',
                            hintText: '***',
                            labelStyle: kTextStyle.copyWith(color: kTitleColor),
                            hintStyle:
                                kTextStyle.copyWith(color: kGreyTextColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ButtonGlobal(
                        buttontext: 'Pay Now',
                        buttonDecoration:
                            kButtonDecoration.copyWith(color: kMainColor),
                        onPressed: () =>
                            const PaymentConfirmed().launch(context)),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  List<String> paymentIcons = [
    'images/paypal.png',
    'images/bkash.png',
    'images/stripe.png',
    'images/visa.png',
    'images/debit.png',
    'images/cash.png',
  ];

  String icons = 'images/paypal.png';

  List<String> title = [
    'Paypal Transfer',
    'bkash Transfer',
    'Stripe Transfer',
    'Visa card Transfer',
    'Cridit / Debit / ATM card ',
    'Cash on pay',
  ];
  String selectedTitle = 'Paypal Transfer';

  List<String> subtitle = [
    'pay on paypal',
    'pay on bkash',
    'pay on stripe',
    'pay on visa card',
    'pay on cridit / debit / ATM card',
    'pay on cash',
  ];
  String selectedsubTitle = 'pay on paypal';

  bool check = true;

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
        () => showPopUp(),
      ),
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Methord',
              style: kTextStyle.copyWith(color: kTitleColor, fontSize: 18.0),
            ),
            const SizedBox(height: 5.0),
            Text(
              'Select one of the payment methord',
              style: kTextStyle.copyWith(color: kGreyTextColor, fontSize: 16.0),
            ),
          ],
        ),
        backgroundColor: const Color(0xFFFAFAFA),
        elevation: 0.0,
        iconTheme: const IconThemeData(color: kTitleColor),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            Container(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Save Card',
                      style: kTextStyle.copyWith(
                          color: kTitleColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                    const SizedBox(height: 10.0),
                    CarouselSlider.builder(
                      options: CarouselOptions(
                        height: 200,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        onPageChanged: null,
                        scrollDirection: Axis.horizontal,
                      ),
                      itemCount: 10,
                      itemBuilder:
                          (BuildContext context, int index, int realIndex) {
                        return Image.asset('images/card.png');
                      },
                    ),
                    Text(
                      'Other payment Options',
                      style: kTextStyle.copyWith(
                          color: kTitleColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                    const SizedBox(height: 5.0),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: paymentIcons.length,
                      itemBuilder: (_, index) {
                        return Card(
                          child: Theme(
                            data: ThemeData(
                              checkboxTheme: CheckboxThemeData(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    30.0,
                                  ),
                                ),
                              ),
                            ),
                            child: CheckboxListTile(
                              title: Text(
                                title[index],
                                style: kTextStyle.copyWith(color: kTitleColor),
                              ),
                              subtitle: Text(
                                subtitle[index],
                                style:
                                    kTextStyle.copyWith(color: kGreyTextColor),
                              ),
                              secondary: Image(
                                image: AssetImage(paymentIcons[index]),
                              ),
                              value: title[index] == selectedTitle,
                              onChanged: null,
                            ),
                          ),
                        ).onTap(
                          () {
                            setState(
                              () {
                                selectedTitle = title[index];
                              },
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 10.0, bottom: 20.0),
              width: context.width(),
              decoration: const BoxDecoration(
                color: Color(0xFFFAFAFA),
              ),
              child: Column(
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
            ),
          ],
        ),
      ),
    );
  }
}
