import 'dart:ui';

import 'package:get/get.dart';

import '../models/menu_list.dart';
import '../utils/constants.dart';

class ItemsController extends GetxController{
  var cartCount=0.obs;
  var color="E6E9F3".obs;
  var addedItems=<Item>[].obs;

  late var originalList=<MenuList>[].obs;
  void countIncre(){
    cartCount++;
  }
  void countDecre(){
    cartCount--;
  }
  void addItems(Item i){
    addedItems.add(i);
  }
  void removeItems(Item j){
    addedItems.remove(j);
  }

}