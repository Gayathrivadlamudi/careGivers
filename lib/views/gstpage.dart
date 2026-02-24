import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../utils/constants.dart';

class Gstpage extends StatefulWidget{
  static const String routeName="/Gstpage";
  int sum;
   Gstpage({required this.sum,super.key});
  @override
  State<Gstpage>createState()=>_GstpageState();
}
class _GstpageState extends State<Gstpage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(preferredSize: Size.fromHeight(54),
            child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor:  Color(0xFFf44641),
              iconTheme: IconThemeData(color: Colors.white),
              flexibleSpace:   Container(
                padding: EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                    color: Color(0xFFf44641)
                ),
                child:Padding(padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        GestureDetector(onTap: (){Get.back();},child: Icon(Icons.arrow_back,color: Colors.white,),),
                        SizedBox(width: 9,),
                        Text("Overview",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 18),)
                        ,],)), ),
            )),
      body:  Column(
        children: [
          SizedBox(height: 23,),
          Padding(
            padding: const EdgeInsets.all(23),
            child: Image.asset(Constants.imagepath+"overview.png"),
          ),
          Container(
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Color(0XFFf5f2f9)
            ),
            child: Center(
              child: Text("Overview",style: TextStyle(color: Colors.red,fontSize: 23,fontWeight: FontWeight.w500),),
            ),
          ),
          SizedBox(height:14),
          Padding(padding: EdgeInsets.symmetric(horizontal: 23),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: Text("Food package")),
                  Text("${widget.sum}")
                ],
              )
             
            ],
          ),
          )
        ],
      ) ,
    )
      ;
  }
}