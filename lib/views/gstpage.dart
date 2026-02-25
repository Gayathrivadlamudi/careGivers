import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:untitled/views/paymentSuccess.dart';

import '../utils/constants.dart';

class Gstpage extends StatefulWidget{
  static const String routeName="/Gstpage";
  int sum;

   Gstpage({required this.sum,super.key});
  @override
  State<Gstpage>createState()=>_GstpageState();
}
class _GstpageState extends State<Gstpage>{
  static double totalpay=0;
  static void calcuGst(int sum){
    totalpay=((sum/100)*18);
  }
  @override
  void initState(){
    super.initState;
    calcuGst(widget.sum);
  }

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
          Expanded(
            child: Column(
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
                Padding(padding: EdgeInsets.symmetric(horizontal: 41),
                  child:
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: Text("Food package",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500))),
                          Icon(Icons.currency_rupee,size: 16,),
                          Text("${widget.sum}",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500))
                        ],
                      ),
                      SizedBox(height:23),
                      Row(
                        children: [
                          Expanded(child: Text("Food GST (18% on ${widget.sum})",style: TextStyle(color: Colors.black54,fontSize: 16,fontWeight: FontWeight.w500))),
                          Icon(Icons.currency_rupee,size: 16,),
                          Text("${totalpay.toStringAsFixed(2)}",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500))
                        ],
                      ),
                      SizedBox(height:14),
                      Divider(height: 2,),
                      SizedBox(height:14),
                      Row(
                        children: [
                          Expanded(child: Text("Total Amount",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500))),
                          Icon(Icons.currency_rupee,size: 16,),
                          Text("${double.parse(totalpay.toStringAsFixed(2))+widget.sum}",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500))
                        ],
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),

          Container(
              padding: EdgeInsets.symmetric(horizontal: 32,vertical: 18),
              decoration: BoxDecoration(
                  color: Color(0XFFF6F6F6)
              ),
              child:Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Total amount",style: TextStyle(fontSize: 16,color: Colors.black54),),
                        Row(
                          children: [
                            Icon(Icons.currency_rupee,size: 14,),
                            Text("${double.parse(totalpay.toStringAsFixed(2))+widget.sum}",style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w500)),
                          ],
                        )
                      ],
                    ),
                  ),

                  ElevatedButton(onPressed: (){
                      Get.toNamed(PaySuccess.routeName);
                  },
                    child: Text("Pay Now"),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green,
                      foregroundColor: Colors.white,),)
                ],
              ))
        ],
      ) ,
      bottomNavigationBar: SizedBox(
        height: 63,
        child: BottomNavigationBar(
          type:BottomNavigationBarType.fixed,
          selectedItemColor:Color(0xFFf44641) ,
          unselectedItemColor: Colors.black,
          backgroundColor: Colors.white,
          onTap: (value)=>{
          },
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Image.asset(Constants.imagepath+"home.png",height: 23,width: 23,),),
            BottomNavigationBarItem(
              label: 'Fee',
              icon: Image.asset(Constants.imagepath+"fee.png",height: 23,width: 23,),),
            BottomNavigationBarItem(
              label: 'Notifications',
              icon: Image.asset(Constants.imagepath+"notification.png",height: 23,width: 23,),),
            BottomNavigationBarItem(
              label: 'Messages',
              icon: Image.asset(Constants.imagepath+"mesg.png",height: 23,width: 23,),),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Image.asset(Constants.imagepath+"profile.png",height: 23,width: 23,),)
          ],
        ),
      ),
    )
      ;
  }
}