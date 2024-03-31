import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../constant.dart';

class BookingList extends StatefulWidget {
  const BookingList({Key? key}) : super(key: key);

  @override
  State<BookingList> createState() => _BookingListState();
}

class _BookingListState extends State<BookingList> {
  List<String> status = [
    'Last Month',
    'This Month',
  ];
  String selectedStatus = 'Last Month';

  List<String> selectStatus =[
    'Completed',
    'Confirmed',
    'Pending',
  ];


  List<Color> color =[
    const Color(0xFF0E79F2),
    const Color(0xFF5BB26E),
    const Color(0xFFFF8748),

  ];

  DropdownButton<String> getStatus() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String des in status) {
      var item = DropdownMenuItem(
        child: Text(des),
        value: des,
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: selectedStatus,
      onChanged: (value) {
        setState(() {
          selectedStatus = value!;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Booking',
          style: kTextStyle.copyWith(color: kTitleColor),
        ),
        iconTheme: const IconThemeData(color: kTitleColor),
        backgroundColor: const Color(0xFFF7F7F7),
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: 140,
              child: FormField(
                builder: (FormFieldState<dynamic> field) {
                  return InputDecorator(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0,),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelStyle: kTextStyle,
                      enabledBorder: outlineInputBorder().copyWith(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: DropdownButtonHideUnderline(child: getStatus()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      children: [
                        ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true, //!
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
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.white),
                                                  color: Colors.white,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10.0),
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
                                    const SizedBox(height: 10.0),
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
                                          style: kTextStyle.copyWith(
                                              color: kGreyTextColor),
                                        ),
                                        const Spacer(),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            color: color[index].withOpacity(0.1),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                                            child: Text(
                                              selectStatus[index],
                                              style: kTextStyle.copyWith(
                                                  color: color[index],
                                                  fontSize: 18.0),
                                            ),
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
                  );
                }),

          ],
        ),
      ),
    );
  }
}
