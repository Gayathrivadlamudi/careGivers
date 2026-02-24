import 'package:flutter/material.dart';
class Constants {
 static const String imagepath="assets/images/";
 static Color hexColor(String color){
   return Color(int.parse(color,radix: 16)+0XFF000000);
 }
}