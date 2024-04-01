import 'package:get/get.dart';

class CurosalController extends GetxController {
  RxList<String> imgList = [
    'Frontend/images/banner4.png',
    'Frontend/images/banner4.png',
    'Frontend/images/banner4.png',

    // Add more images URLs to this list
  ].obs;

  RxInt currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
