import 'package:flutter/material.dart';
class Constants {
 static const String imagepath="assets/images/";
 static Color hexColor(String color){
   return Color(int.parse(color,radix: 16)+0XFF000000);
 }
 static String currency_baseUrl="https://v6.exchangerate-api.com/v6/50ffe3d995f8c696b38be130/latest/USD";
}