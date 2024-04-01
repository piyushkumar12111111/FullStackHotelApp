import 'package:get/get.dart';

class HotelController extends GetxController {
  RxList<String> imgList = <String>[].obs;

  RxInt currentIndex = 0.obs;
  RxBool isFavourite = false.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  void toogleFavourite(){

    isFavourite.value = !isFavourite.value;
    update();
  }
}
