import 'package:get/get.dart';
import 'package:untitled/views/cartView.dart';

import '../views/foodItem_view.dart';
import '../views/gstpage.dart';
import '../views/paymentSuccess.dart';
List<GetPage> routes=[
  GetPage(name: FoodItemsView.routeName,page:()=> const FoodItemsView()),
  GetPage(name: PaySuccess.routeName,page:()=>  PaySuccess()),
];