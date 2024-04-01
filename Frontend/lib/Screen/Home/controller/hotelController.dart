import 'package:get/get.dart';

class HotelController extends GetxController {
  RxList<String> imgList = <String>[].obs;

  RxInt currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
