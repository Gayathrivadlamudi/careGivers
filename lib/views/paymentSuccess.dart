import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../utils/constants.dart';

class PaySuccess extends StatefulWidget {
  static const String routeName = "/PaySuccess";

  PaySuccess({super.key});

  @override
  State<PaySuccess> createState() => _PaySuccessState();
}
class _PaySuccessState extends State<PaySuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(preferredSize: Size.fromHeight(54),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xFFf44641),
            iconTheme: IconThemeData(color: Colors.white),
            flexibleSpace: Container(
              padding: EdgeInsets.only(top: 50),
              decoration: BoxDecoration(
                  color: Color(0xFFf44641)
              ),
              child: Padding(padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      GestureDetector(onTap: () {
                        Get.back();
                      }, child: Icon(Icons.arrow_back, color: Colors.white,),),
                      SizedBox(width: 9,),
                      Text("Payment Successful", style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),)
                      ,
                    ],)),),
          )),
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 32,vertical:86),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
              alignment: Alignment.center,
              child:
              Text("Payment successful",
                  textAlign:TextAlign.center,
                  style: TextStyle(fontSize: 27,color: Colors.black,fontWeight: FontWeight.w600))),

          SizedBox(height: 23,),
          Image.asset(Constants.imagepath+"statusSuccess.png"),
          SizedBox(height: 32,),
          Align(
              alignment: Alignment.center,
              child:
              Text("You have purchased ",
                  textAlign:TextAlign.center,
                  style: TextStyle(fontSize: 19,color: Colors.black,fontWeight: FontWeight.w500))),
          SizedBox(height:5,),
          Align(
              alignment: Alignment.center,
              child:
              Text("Transaction ID: 465151ASDF65465",
                  textAlign:TextAlign.center,
                  style: TextStyle(fontSize: 14,color: Colors.black54,fontWeight: FontWeight.w500))),
        ],
      ),
      ),
    );
  }
}