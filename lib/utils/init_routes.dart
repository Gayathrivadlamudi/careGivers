import 'package:get/get.dart';
import 'package:untitled/views/cartView.dart';

import '../views/foodItem_view.dart';
import '../views/gstpage.dart';
List<GetPage> routes=[
  GetPage(name: FoodItemsView.routeName,page:()=> const FoodItemsView()),
  GetPage(name: cartView.routeName,page:()=> const cartView()),
  //GetPage(name: Gstpage.routeName,page:()=>  Gstpage()),
];