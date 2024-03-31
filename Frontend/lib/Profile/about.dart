import 'package:flutter/material.dart';

import '../../../constant.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About Us',
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Who you are.',
                style: kTextStyle.copyWith(
                    color: kTitleColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              const Text(
                  'Lorem ipsum dolor sit amet, consectetur adip is cing elit. Neque nulla sed mauris feugiat eget. Augue id neque nisl nibh ut facilisis massa, diam. Quam massa in fusce mi faucibus integer est, en im. At sed ante et leo. Erat mattis sed cursus pelle  '),
              const SizedBox(height: 20.0),
              Text(
                'How you do it.',
                style: kTextStyle.copyWith(
                    color: kTitleColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              const Text(
                  'Ullamcorper eros senectus urna sit elementum aliquet. Nibh mauris trist ique elit pellentesque sapien malesuada eleifend iaculis malesuada. Mauris, ut id hendrerit habitant gravida urna congue arcu sit. At quisque leo semper urna gravida iac ulis nibh aliquam. Morbi tempor facilisi ultricies magna vitae sit. Velit augue sagittis, tempor, amet arcu nullam quam. Sit feugiat amet, pellentesque morbi mattis id blandit arcu morbi. Morbi cursus ac tortor amet. Iaculis nunc bibendum in vitae turpis mattis nisl viverra. Turpis habitant purus, venenatis vitae ut urna, rhoncus nunc. '),
            ],
          ),
        ),
      ),
    );
  }
}
