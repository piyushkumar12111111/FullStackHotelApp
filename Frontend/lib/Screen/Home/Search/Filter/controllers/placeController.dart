
import 'package:get/get.dart';


class PlaceController extends GetxController{

 RxBool open = false.obs;

  void openClose(){
    open.value = !open.value;
  } 


RxList<String> placeList = [
  'Dhaka',
  'Chittagong',
  'Sylhet',
  'Khulna',
  'Rajshahi',
  'Barishal',
  'Rangpur',
  'Mymensingh',
  'Coxs Bazar',
  'Sundarban',
  'Bandarban',
  'Kuakata',
  'Saint Martin',
  'Sajek',
  'Jaflong',
  'Srimangal',
  'Ratargul',
  'Bichanakandi',
  'Paharpur',
  'Mahasthangarh',
  'Sonargaon',
  'Mainamati',
  'Puthia',
  'Kantajew',
  'Paharpur',
  'Bagerhat',
  'Puthia',
  'Kantajew',
  'Paharpur',
  'Bagerhat',
  'Puthia',
  'Kantajew',
  'Paharpur',
].obs;



RxList<String> choosenCity = <String>[].obs;


void addCity(String city){
  choosenCity.add(city);

}

void removeCity(String city){
  choosenCity.remove(city);
}

//! clear all selected city

void clearAll(){
  choosenCity.clear();
}



}