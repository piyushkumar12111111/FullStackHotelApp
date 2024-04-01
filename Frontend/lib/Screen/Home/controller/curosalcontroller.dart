import 'package:get/get.dart';

class CurosalController extends GetxController {
  RxList<String> imgList = [
    'Frontend/images/banner4.png',
    'Frontend/images/banner4.png',
    'Frontend/images/banner4.png',
    'Frontend/images/banner4.png',

    // Add more images URLs to this list
  ].obs;

  RxInt currentIndex = 0.obs;

  void changeIndex() {
    //currentIndex.value = index;

    if (currentIndex.value == imgList.length - 1) {
      currentIndex.value = 0;
    } else {
      currentIndex.value = currentIndex.value + 1;
    }
    update();
  }
}
