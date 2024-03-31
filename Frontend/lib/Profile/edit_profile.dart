import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:hotel_booking/Screen/Home/home.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../constant.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  List<String> item = [
    'Male',
    'Female',
    'Others',
  ];
  String froms = 'Male';

  DropdownButton<String> getGender() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String des in item) {
      var item = DropdownMenuItem(
        child: Text(des),
        value: des,
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: froms,
      onChanged: (value) {
        setState(() {
          froms = value!;
        });
      },
    );
  }

  final dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: kTextStyle.copyWith(color: kTitleColor),
        ),
        iconTheme: const IconThemeData(color: kTitleColor),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
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
                        'Update',
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
        () => const Home().launch(context),
      ),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: Container(
                    width: context.width(),
                    height: context.height(),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0)),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 70.0,
                          ),
                          AppTextField(
                            textFieldType: TextFieldType.NAME,
                            decoration: kInputDecoration.copyWith(
                                labelText: 'Full Name',
                                hintText: 'Abdul korim',
                                labelStyle: const TextStyle(
                                  color: kTitleColor,
                                )),
                          ),
                          const SizedBox(height: 20.0),
                          AppTextField(
                            textFieldType: TextFieldType.EMAIL,
                            decoration: kInputDecoration.copyWith(
                              labelText: 'Email Address*',
                              hintText: 'shaidulislam@gmail.com',
                              labelStyle: const TextStyle(
                                color: kTitleColor,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          AppTextField(
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
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: 'Date of bath',
                              hintText: '04/04/2000',
                              labelStyle: kTextStyle.copyWith(
                                  color: kTitleColor, fontSize: 18.0),
                              hintStyle:
                                  kTextStyle.copyWith(color: kGreyTextColor),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          SizedBox(
                            height: 60.0,
                            child: FormField(
                              builder: (FormFieldState<dynamic> field) {
                                return InputDecorator(
                                  decoration: kInputDecoration.copyWith(
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    labelText: 'Gender',
                                    hintText: 'Male',
                                    labelStyle:
                                        kTextStyle.copyWith(color: kTitleColor),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: getGender(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 60.0,
                    backgroundImage: AssetImage('images/profilepic.png'),
                  ),
                  Positioned(
                    bottom: 3.0,
                    right: 20.0,
                    child: Container(
                      padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: kMainColor)
                        ),
                        child: const Icon(FeatherIcons.camera,size: 12.0,)),
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
