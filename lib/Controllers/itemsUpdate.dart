import 'dart:ui';

import 'package:get/get.dart';

import '../models/menu_list.dart';
import '../utils/constants.dart';

class ItemsUpdate extends GetxController{
  var cartCount=0.obs;
  var color="E6E9F3".obs;
  var items=<Item>[].obs;

  late var originalList=<MenuList>[].obs;
  void countIncre(){
    cartCount++;
  }
  void countDecre(){
    cartCount--;
  }
  void addItems(Item i){
    items.add(i);
  }
  void removeItems(Item j){
    items.remove(j);
  }

}