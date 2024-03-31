import 'package:flutter/material.dart';
import 'package:hotel_booking/Screen/Authentication/sign_in.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../GlobalComponents/button_global.dart';
import '../../constant.dart';

class AddInfo extends StatefulWidget {
  const AddInfo({Key? key}) : super(key: key);

  @override
  State<AddInfo> createState() => _AddInfoState();
}

class _AddInfoState extends State<AddInfo> {
  List<String> item = [
    'Male',
    'Female',
    'Others',
  ];
  String froms = 'Male';
  String gender = 'Male';
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  _loadSavedData() async {
    final prefs = await SharedPreferences.getInstance();
    nameController.text = prefs.getString('name') ?? '';
    emailController.text = prefs.getString('email') ?? '';
    dateController.text = prefs.getString('dob') ?? '';
    gender = prefs.getString('gender') ?? 'Male';
    setState(() {});
  }

  _saveInfo() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', nameController.text);
    await prefs.setString('email', emailController.text);
    await prefs.setString('dob', dateController.text);
    await prefs.setString('gender', gender);
  }

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
      value: gender,
      onChanged: (value) {
        setState(() {
          froms = value!;
        });
        _saveInfo();
      },
    );
  }

  //final dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, bottom: 20.0, top: 40.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add your info',
                  style: kTextStyle.copyWith(
                    color: kTitleColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 20.0),
                AppTextField(
                  textFieldType: TextFieldType.NAME,
                  onChanged: (value) => _saveInfo(),
                  decoration: kInputDecoration.copyWith(
                    // onchange: (value) {
                    //   sharedPreferences!.setString('name', value);
                    // },

                    labelText: 'Full name',
                    hintText: 'Abdul Korim',
                    labelStyle: kTextStyle.copyWith(color: kTitleColor),
                    hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
                  ),
                ),
                const SizedBox(height: 20.0),
                AppTextField(
                  textFieldType: TextFieldType.EMAIL,
                  onChanged: (value) => _saveInfo(),
                  decoration: kInputDecoration.copyWith(
                    labelText: 'Email',
                    hintText: 'abdulkorim@gmail.com',
                    labelStyle: kTextStyle.copyWith(color: kTitleColor),
                    hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
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
                    dateController.text = date.toString().substring(0, 10);
                    if (date != null) {
                      dateController.text = date.toString().substring(0, 10);
                      _saveInfo();
                    }
                  },
                  controller: dateController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'Date of birth',
                    hintText: '04/04/2000',
                    labelStyle: kTextStyle.copyWith(color: kTitleColor),
                    hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
                  ),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  height: 60.0,
                  child: FormField(
                    builder: (FormFieldState<dynamic> field) {
                      return InputDecorator(
                        decoration: kInputDecoration.copyWith(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: 'Gender',
                          hintText: 'Male',
                          labelStyle: kTextStyle.copyWith(color: kTitleColor),
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
                const SizedBox(height: 20.0),
                ButtonGlobal(
                  buttontext: 'Save Info',
                  onPressed: () {
                    const SignIn().launch(context);
                  },
                  buttonDecoration:
                      kButtonDecoration.copyWith(color: kMainColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
