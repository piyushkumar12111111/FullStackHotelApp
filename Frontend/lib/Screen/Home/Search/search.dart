import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../constant.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50.0,
                        child: AppTextField(
                          textStyle: kTextStyle.copyWith(color: kTitleColor),
                          textFieldType: TextFieldType.NAME,
                          decoration: kInputDecoration.copyWith(
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide(
                                  color: Color(0xFFECF3EE), width: 2),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide(
                                  color: Color(0xFFECF3EE), width: 2),
                            ),
                            fillColor: const Color(0xFFECF3EE),
                            labelText: 'Search',
                            hintText: 'Search for hotel',
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelStyle: kTextStyle.copyWith(color: kTitleColor),
                            hintStyle:
                                kTextStyle.copyWith(color: kGreyTextColor),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: kTitleColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: const Color(0xFFFF8748),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.clear,
                            color: Color(0XFFFFFFFF),
                          ),
                        ),
                      ),
                    ).onTap(
                      () => finish(context),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Recent Searches',
                  style: kTextStyle.copyWith(
                      color: kTitleColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
                ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    return Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: const Color(0xFFDEF0E2),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.location_on_outlined,
                                color: Color(0xFF5BB26E),
                                size: 18.0,
                              ),
                            ),
                          ),
                          title: Text(
                            'Dhaka',
                            style: kTextStyle.copyWith(
                                color: kTitleColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                          subtitle: Text(
                            'Pan Pacific Sonargaon Dhaka',
                            style: kTextStyle.copyWith(color: kGreyTextColor),
                          ),
                        ),
                        const Divider(
                          thickness: 1.0,
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
