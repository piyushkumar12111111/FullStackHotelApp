import 'package:flutter/material.dart';

import '../../../constant.dart';

class Privacy extends StatefulWidget {
  const Privacy({Key? key}) : super(key: key);

  @override
  State<Privacy> createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Privacy Policy',
          style: kTextStyle.copyWith(color: kTitleColor),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: kTitleColor),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              Text(
                  'Ullamcorper eros senectus urna sit elementum aliquet. Nibh mauris trist ique elit pellentesque sapien malesuada eleifend iaculis malesuada. Mauris, ut id hendrerit habitant gravida urna congue arcu sit. At quisque leo semper urna gravida iac ulis nibh aliquam. Morbi tempor facilisi ultricies magna vitae sit. Velit augue sagittis, tempor, amet arcu nullam quam. Sit feugiat amet, pellentesque morbi mattis id blandit arcu morbi. Morbi cursus ac tortor amet. Iaculis nunc bibendum in vitae turpis mattis nisl viverra. Turpis habitant purus, venenatis vitae ut urna, rhoncus nunc. '),
              SizedBox(height: 10.0),
              Text(
                  'Ullamcorper eros senectus urna sit elementum aliquet. Nibh mauris trist ique elit pellentesque sapien malesuada eleifend iaculis malesuada. Mauris, ut id hendrerit habitant gravida urna congue arcu sit. '),
              SizedBox(height: 10.0),
              Text(
                  'Ullamcorper eros senectus urna sit elementum aliquet. Nibh mauris trist ique elit pellentesque sapien malesuada eleifend iaculis malesuada. Mauris, ut id hendrerit habitant gravida urna congue arcu sit. At quisque leo semper urna gravida iac ulis nibh aliquam. Morbi tempor facilisi ultricies magna vitae sit. Velit augue sagittis, tempor, amet arcu nullam quam. Sit feugiat amet, pellentesque morbi mattis id blandit arcu morbi. Morbi cursus ac tortor amet. Iaculis nunc bibendum in vitae turpis mattis nisl viverra. Turpis habitant purus, venenatis vitae ut urna, rhoncus nunc. '),
              SizedBox(height: 10.0),
              Text(
                  'Ullamcorper eros senectus urna sit elementum aliquet. Nibh mauris trist ique elit pellentesque sapien malesuada eleifend iaculis malesuada. Mauris, ut id hendrerit habitant gravida urna congue arcu sit. At quisque leo semper urna gravida iac ulis nibh aliquam. Morbi tempor facilisi ultricies magna vitae sit. Velit augue sagittis, tempor, amet arcu nullam quam. Sit feugiat amet, pellentesque morbi mattis id blandit arcu morbi. Morbi cursus ac tortor amet. Iaculis nunc bibendum in vitae turpis mattis nisl viverra. Turpis habitant purus, venenatis vitae ut urna, rhoncus nunc. '),
            ],
          ),
        ),
      ),
    );
  }
}
