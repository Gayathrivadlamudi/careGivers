import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/utils/constants.dart';

class FoodItemsView extends StatefulWidget {
  static const String routeName='/fooditems';
  const FoodItemsView({super.key});
  @override
  State<FoodItemsView> createState()=> _FoodItemsViewState();
}
class _FoodItemsViewState extends State<FoodItemsView>{
  static int cartCount=0;
  final json=<Map<String,dynamic>>[
  {
    'day':"Monday (10-12-2025)",
    'data':[
      {
        'img':Constants.imagepath+"rice.png",
        'itemTitle':"Healthy Lunch",
        'price':100,
      },
      {
        'img':Constants.imagepath+"c.png",
        'itemTitle':"Evening snack",
        'price':50,
      },
      {
        'img':Constants.imagepath+"l.png",
        'itemTitle':"Lunch + snack",
        'price':140,
      }
    ]
  },

    {
      'day':"Tuesday (11-12-2025)",
      'data':[
        {
          'img':Constants.imagepath+"r&D.png",
          'itemTitle':"Roti & Dal",
          'price':100,
        },
        {
          'img':Constants.imagepath+"fruit.png",
          'itemTitle':"fruit snack",
          'price':50,
        },
        {
          'img':Constants.imagepath+"rice.png",
          'itemTitle':"Rice",
          'price':140,
        }
      ]
    },
    {
      'day':"Wednesday (12-12-2025)",
      'data':[
        {
          'img':Constants.imagepath+"rice.png",
          'itemTitle':"Healthy Lunch",
          'price':100,
        },
        {
          'img':Constants.imagepath+"c.png",
          'itemTitle':"Evening snack",
          'price':50,
        },
        {
          'img':Constants.imagepath+"l.png",
          'itemTitle':"Lunch + snack",
          'price':140,
        }
      ]
    },
    {
      'day':"Thursday (13-12-2025)",
      'data':[
        {
          'img':Constants.imagepath+"r&D.png",
          'itemTitle':"Roti & Dal",
          'price':100,
        },
        {
          'img':Constants.imagepath+"fruit.png",
          'itemTitle':"fruit snack",
          'price':50,
        },
        {
          'img':Constants.imagepath+"rice.png",
          'itemTitle':"Rice",
          'price':140,
        }
      ]
    }
  ];
@override
  Widget build(BuildContext context){
  return Container(
    color:  Color(0xFFf44641),
    child: SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(68),
          child: AppBar(
            automaticallyImplyLeading:false,
           backgroundColor:  Color(0xFFf44641),

            iconTheme: IconThemeData(color: Colors.white),
            flexibleSpace: Stack(
            children: [ Container(
                  padding: EdgeInsets.only(top: 23),
                decoration: BoxDecoration(
                 color: Color(0xFFf44641)
                ),
                child:Padding(padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        GestureDetector(onTap: (){},child: Icon(Icons.arrow_back,color: Colors.white,),),
                        SizedBox(width: 9,),
                        Text("OnDemand Packages",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 18),)
                        ,SizedBox(width: 77,),
                        GestureDetector(onTap: (){},
                          child: Icon(Icons.notification_important_outlined,color: Colors.white,),
                        ),
                        SizedBox(width: 14,),
                          GestureDetector(onTap: (){},
                                child:  Icon(Icons.add_shopping_cart_outlined,color: Colors.white,),
                              ) ,], )), ),
                         Positioned(
                          right: 18,
                          bottom:18,
                          child:Container(
                            alignment:  Alignment.center,
                            padding: const EdgeInsets.only(  left: 5,  right: 5),
                            //height: 17,
                            decoration:BoxDecoration(
                              borderRadius: BorderRadius.circular(75),
                              color: Colors.white,
                            ),
                            child: Text("${cartCount}",style: TextStyle(color: Colors.black,fontSize:12,fontWeight: FontWeight.w600  ),),

                          ),

                        )
                      ]
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 23,),
              Align(
                alignment: Alignment.center,
                child: Text("Weekly Food Menu (10-12-2025 to 15-12-2025)",
                  style: TextStyle(color: Colors.black,fontSize:17,fontWeight: FontWeight.w600),),
              ),
              SizedBox(height: 23,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 23,vertical: 7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5,),
                    Text("Monday (10-12-2025)",
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.black,fontSize:17,fontWeight: FontWeight.w600),),
                    SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding:  EdgeInsets.only(top: 16,bottom: 12),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(0),
                                  height:Get.height/5.5,
                                  width: Get.width/3,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                   border:Border.all(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(14),
                                    boxShadow: [new BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 5.0
                                    )]
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      ClipRRect(
                                        borderRadius:BorderRadius.only(topLeft: Radius.circular(14),topRight: Radius.circular(14),),
                                        child: Image.asset(Constants.imagepath+"rice.png",
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      SizedBox(height: 5,),

                                      Padding(
                                          padding: EdgeInsets.only(left: 5),
                                          child: Text("Healthy Lunch",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 14),))
                                      ,Padding(
                                          padding:  EdgeInsets.only(left: 5),
                                          child: Text("Khichidi desc.",style:TextStyle(color:Colors.black54,fontWeight: FontWeight.w400,fontSize: 12 ))),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Padding(
                                                padding:  EdgeInsets.only(left: 5),
                                                child: Text('\u{20B9} 100',style:TextStyle(color:Colors.black,fontWeight: FontWeight.w600,fontSize: 12 ))),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(right: 5),
                                            child: GestureDetector(
                                              onTap: (){

                                              },
                                              child: Container(
                                                height: 19,
                                                width: 35,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5),
                                                  color: Color(0XFF009951)
                                                ),
                                                child: Center(child: Text("Add",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w500),)),
                                              ),
                                            ),
                                          )

                                        ],
                                         ),


                                    ],
                                  ),
                                ),
                                SizedBox(width: 12,),
                                Container(
                                  padding: EdgeInsets.all(0),
                                  height:Get.height/5.5,
                                  width: Get.width/3,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border:Border.all(color: Colors.black12),
                                      borderRadius: BorderRadius.circular(14),
                                      boxShadow: [new BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 5.0
                                      )]
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      ClipRRect(
                                        borderRadius:BorderRadius.only(topLeft: Radius.circular(14),topRight: Radius.circular(14),),
                                        child: Image.asset(Constants.imagepath+"c.png",
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      SizedBox(height: 5,),

                                      Padding(
                                          padding: EdgeInsets.only(left: 5),
                                          child: Text("Evening snack",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 14),))
                                      ,Padding(
                                          padding:  EdgeInsets.only(left: 5),
                                          child: Text("Milk & Bisuit.",style:TextStyle(color:Colors.black54,fontWeight: FontWeight.w400,fontSize: 12 ))),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Padding(
                                                padding:  EdgeInsets.only(left: 5),
                                                child: Text('\u{20B9} 50',style:TextStyle(color:Colors.black,fontWeight: FontWeight.w600,fontSize: 12 ))),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(right: 5),
                                            child: GestureDetector(
                                              onTap: (){},
                                              child: Container(
                                                height: 19,
                                                width: 35,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(5),
                                                    color: Color(0XFF009951)
                                                ),
                                                child: Center(child: Text("Add",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w500),)),
                                              ),
                                            ),
                                          )

                                        ],
                                      ),


                                    ],
                                  ),
                                ),
                                SizedBox(width: 12,),
                                Container(
                                  padding: EdgeInsets.all(0),
                                  height:Get.height/5.5,
                                  width: Get.width/3,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border:Border.all(color: Colors.black12),
                                      borderRadius: BorderRadius.circular(14),
                                      boxShadow: [new BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 5.0
                                      )]
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      ClipRRect(
                                        borderRadius:BorderRadius.only(topLeft: Radius.circular(14),topRight: Radius.circular(14),),
                                        child: Image.asset(Constants.imagepath+"l.png",
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      SizedBox(height: 5,),

                                      Padding(
                                          padding: EdgeInsets.only(left: 5),
                                          child: Text("Lunch + Snack",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 14),))
                                      ,Padding(
                                          padding:  EdgeInsets.only(left: 5),
                                          child: Text("Combo desc.",style:TextStyle(color:Colors.black54,fontWeight: FontWeight.w400,fontSize: 12 ))),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Padding(
                                                padding:  EdgeInsets.only(left: 5),
                                                child: Text('\u{20B9} 140',style:TextStyle(color:Colors.black,fontWeight: FontWeight.w600,fontSize: 12 ))),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(right: 5),
                                            child: GestureDetector(
                                              onTap: (){},
                                              child: Container(
                                                height: 19,
                                                width: 35,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(5),
                                                    color: Color(0XFF009951)
                                                ),
                                                child: Center(child: Text("Add",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w500),)),
                                              ),
                                            ),
                                          )

                                        ],
                                      ),


                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    Text("Tuesday (11-12-2025)",
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.black,fontSize:17,fontWeight: FontWeight.w600),),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding:  EdgeInsets.only(top: 16,bottom: 12),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(0),
                              height:Get.height/5.5,
                              width: Get.width/3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:Border.all(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: [new BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5.0
                                  )]
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  ClipRRect(
                                    borderRadius:BorderRadius.only(topLeft: Radius.circular(14),topRight: Radius.circular(14),),
                                    child: Image.asset(Constants.imagepath+"r&D.png",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  SizedBox(height: 5,),

                                  Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text("Roti + Dal",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 14),))
                                  ,Padding(
                                      padding:  EdgeInsets.only(left: 5),
                                      child: Text("Roti dal desc.",style:TextStyle(color:Colors.black54,fontWeight: FontWeight.w400,fontSize: 12 ))),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                            padding:  EdgeInsets.only(left: 5),
                                            child: Text('\u{20B9} 100',style:TextStyle(color:Colors.black54,fontWeight: FontWeight.w400,fontSize: 12 ))),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: GestureDetector(
                                          onTap: (){},
                                          child: Container(
                                            height: 19,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color: Color(0XFF009951)
                                            ),
                                            child: Center(child: Text("Add",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w500),)),
                                          ),
                                        ),
                                      )

                                    ],
                                  ),


                                ],
                              ),
                            ),
                            SizedBox(width: 12,),
                            Container(
                              padding: EdgeInsets.all(0),
                              height:Get.height/5.5,
                              width: Get.width/3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:Border.all(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: [new BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5.0
                                  )]
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  ClipRRect(
                                    borderRadius:BorderRadius.only(topLeft: Radius.circular(14),topRight: Radius.circular(14),),
                                    child: Image.asset(Constants.imagepath+"fruit.png",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  SizedBox(height: 5,),

                                  Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text("Healthy Lunch",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 14),))
                                  ,Padding(
                                      padding:  EdgeInsets.only(left: 5),
                                      child: Text("Khichidi desc.",style:TextStyle(color:Colors.black54,fontWeight: FontWeight.w400,fontSize: 12 ))),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                            padding:  EdgeInsets.only(left: 5),
                                            child: Text('\u{20B9} 100',style:TextStyle(color:Colors.black54,fontWeight: FontWeight.w400,fontSize: 12 ))),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: GestureDetector(
                                          onTap: (){},
                                          child: Container(
                                            height: 19,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color: Color(0XFF009951)
                                            ),
                                            child: Center(child: Text("Add",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w500),)),
                                          ),
                                        ),
                                      )

                                    ],
                                  ),


                                ],
                              ),
                            ),
                            SizedBox(width: 12,),
                            Container(
                              padding: EdgeInsets.all(0),
                              height:Get.height/5.5,
                              width: Get.width/3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:Border.all(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: [new BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5.0
                                  )]
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  ClipRRect(
                                    borderRadius:BorderRadius.only(topLeft: Radius.circular(14),topRight: Radius.circular(14),),
                                    child: Image.asset(Constants.imagepath+"rice.png",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  SizedBox(height: 5,),

                                  Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text("Healthy Lunch",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 14),))
                                  ,Padding(
                                      padding:  EdgeInsets.only(left: 5),
                                      child: Text("Khichidi desc.",style:TextStyle(color:Colors.black54,fontWeight: FontWeight.w400,fontSize: 12 ))),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                            padding:  EdgeInsets.only(left: 5),
                                            child: Text('\u{20B9} 100',style:TextStyle(color:Colors.black54,fontWeight: FontWeight.w400,fontSize: 12 ))),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: GestureDetector(
                                          onTap: (){},
                                          child: Container(
                                            height: 19,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color: Color(0XFF009951)
                                            ),
                                            child: Center(child: Text("Add",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w500),)),
                                          ),
                                        ),
                                      )

                                    ],
                                  ),


                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text("Wednesday (12-12-2025)",
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.black,fontSize:17,fontWeight: FontWeight.w600),),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding:  EdgeInsets.only(top: 16,bottom:12),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(0),
                              height:Get.height/5.5,
                              width: Get.width/3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:Border.all(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: [new BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5.0
                                  )]
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  ClipRRect(
                                    borderRadius:BorderRadius.only(topLeft: Radius.circular(14),topRight: Radius.circular(14),),
                                    child: Image.asset(Constants.imagepath+"c.png",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  SizedBox(height: 5,),

                                  Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text("Healthy Lunch",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 14),))
                                  ,Padding(
                                      padding:  EdgeInsets.only(left: 5),
                                      child: Text("Khichidi desc.",style:TextStyle(color:Colors.black54,fontWeight: FontWeight.w400,fontSize: 12 ))),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                            padding:  EdgeInsets.only(left: 5),
                                            child: Text('\u{20B9} 100',style:TextStyle(color:Colors.black54,fontWeight: FontWeight.w400,fontSize: 12 ))),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: GestureDetector(
                                          onTap: (){},
                                          child: Container(
                                            height: 19,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color: Color(0XFF009951)
                                            ),
                                            child: Center(child: Text("Add",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w500),)),
                                          ),
                                        ),
                                      )

                                    ],
                                  ),


                                ],
                              ),
                            ),
                            SizedBox(width: 12,),
                            Container(
                              padding: EdgeInsets.all(0),
                              height:Get.height/5.5,
                              width: Get.width/3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:Border.all(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: [new BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5.0
                                  )]
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  ClipRRect(
                                    borderRadius:BorderRadius.only(topLeft: Radius.circular(14),topRight: Radius.circular(14),),
                                    child: Image.asset(Constants.imagepath+"l.png",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  SizedBox(height: 5,),

                                  Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text("Healthy Lunch",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 14),))
                                  ,Padding(
                                      padding:  EdgeInsets.only(left: 5),
                                      child: Text("Khichidi desc.",style:TextStyle(color:Colors.black54,fontWeight: FontWeight.w400,fontSize: 12 ))),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                            padding:  EdgeInsets.only(left: 5),
                                            child: Text('\u{20B9} 100',style:TextStyle(color:Colors.black54,fontWeight: FontWeight.w400,fontSize: 12 ))),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: GestureDetector(
                                          onTap: (){},
                                          child: Container(
                                            height: 19,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color: Color(0XFF009951)
                                            ),
                                            child: Center(child: Text("Add",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w500),)),
                                          ),
                                        ),
                                      )

                                    ],
                                  ),


                                ],
                              ),
                            ),
                            SizedBox(width: 12,),
                            Container(
                              padding: EdgeInsets.all(0),
                              height:Get.height/5.5,
                              width: Get.width/3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:Border.all(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: [new BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5.0
                                  )]
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  ClipRRect(
                                    borderRadius:BorderRadius.only(topLeft: Radius.circular(14),topRight: Radius.circular(14),),
                                    child: Image.asset(Constants.imagepath+"r&D.png",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  SizedBox(height: 5,),

                                  Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text("Healthy Lunch",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 14),))
                                  ,Padding(
                                      padding:  EdgeInsets.only(left: 5),
                                      child: Text("Khichidi desc.",style:TextStyle(color:Colors.black54,fontWeight: FontWeight.w400,fontSize: 12 ))),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                            padding:  EdgeInsets.only(left: 5),
                                            child: Text('\u{20B9} 100',style:TextStyle(color:Colors.black54,fontWeight: FontWeight.w400,fontSize: 12 ))),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: GestureDetector(
                                          onTap: (){},
                                          child: Container(
                                            height: 19,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color: Color(0XFF009951)
                                            ),
                                            child: Center(child: Text("Add",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w500),)),
                                          ),
                                        ),
                                      )

                                    ],
                                  ),


                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text("Thursday (13-12-2025)",
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.black,fontSize:17,fontWeight: FontWeight.w600),),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding:  EdgeInsets.only(top: 16,bottom:12),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(0),
                              height:Get.height/5.5,
                              width: Get.width/3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:Border.all(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: [new BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5.0
                                  )]
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  ClipRRect(
                                    borderRadius:BorderRadius.only(topLeft: Radius.circular(14),topRight: Radius.circular(14),),
                                    child: Image.asset(Constants.imagepath+"rice.png",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  SizedBox(height: 5,),

                                  Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text("Healthy Lunch",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 14),))
                                  ,Padding(
                                      padding:  EdgeInsets.only(left: 5),
                                      child: Text("Khichidi desc.",style:TextStyle(color:Colors.black54,fontWeight: FontWeight.w400,fontSize: 12 ))),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                            padding:  EdgeInsets.only(left: 5),
                                            child: Text('\u{20B9} 100',style:TextStyle(color:Colors.black54,fontWeight: FontWeight.w400,fontSize: 12 ))),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: GestureDetector(
                                          onTap: (){},
                                          child: Container(
                                            height: 19,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color: Color(0XFF009951)
                                            ),
                                            child: Center(child: Text("Add",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w500),)),
                                          ),
                                        ),
                                      )

                                    ],
                                  ),


                                ],
                              ),
                            ),
                            SizedBox(width: 12,),
                            Container(
                              padding: EdgeInsets.all(0),
                              height:Get.height/5.5,
                              width: Get.width/3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:Border.all(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: [new BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5.0
                                  )]
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  ClipRRect(
                                    borderRadius:BorderRadius.only(topLeft: Radius.circular(14),topRight: Radius.circular(14),),
                                    child: Image.asset(Constants.imagepath+"rice.png",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  SizedBox(height: 5,),

                                  Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text("Healthy Lunch",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 14),))
                                  ,Padding(
                                      padding:  EdgeInsets.only(left: 5),
                                      child: Text("Khichidi desc.",style:TextStyle(color:Colors.black54,fontWeight: FontWeight.w400,fontSize: 12 ))),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                            padding:  EdgeInsets.only(left: 5),
                                            child: Text('\u{20B9} 100',style:TextStyle(color:Colors.black54,fontWeight: FontWeight.w400,fontSize: 12 ))),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: GestureDetector(
                                          onTap: (){},
                                          child: Container(
                                            height: 19,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color: Color(0XFF009951)
                                            ),
                                            child: Center(child: Text("Add",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w500),)),
                                          ),
                                        ),
                                      )

                                    ],
                                  ),


                                ],
                              ),
                            ),
                            SizedBox(width: 12,),
                            Container(
                              padding: EdgeInsets.all(0),
                              height:Get.height/5.5,
                              width: Get.width/3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:Border.all(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: [new BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5.0
                                  )]
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  ClipRRect(
                                    borderRadius:BorderRadius.only(topLeft: Radius.circular(14),topRight: Radius.circular(14),),
                                    child: Image.asset(Constants.imagepath+"rice.png",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  SizedBox(height: 5,),

                                  Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text("Healthy Lunch",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 14),))
                                  ,Padding(
                                      padding:  EdgeInsets.only(left: 5),
                                      child: Text("Khichidi desc.",style:TextStyle(color:Colors.black54,fontWeight: FontWeight.w400,fontSize: 12 ))),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                            padding:  EdgeInsets.only(left: 5),
                                            child: Text('\u{20B9} 100',style:TextStyle(color:Colors.black54,fontWeight: FontWeight.w400,fontSize: 12 ))),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: GestureDetector(
                                          onTap: (){},
                                          child: Container(
                                            height: 19,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color: Color(0XFF009951)
                                            ),
                                            child: Center(child: Text("Add",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w500),)),
                                          ),
                                        ),
                                      )

                                    ],
                                  ),


                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text("Firday (14-12-2025)",
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.black,fontSize:17,fontWeight: FontWeight.w600),),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding:  EdgeInsets.only(top: 16,bottom:12),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(0),
                              height:Get.height/5.5,
                              width: Get.width/3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:Border.all(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: [new BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5.0
                                  )]
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  ClipRRect(
                                    borderRadius:BorderRadius.only(topLeft: Radius.circular(14),topRight: Radius.circular(14),),
                                    child: Image.asset(Constants.imagepath+"rice.png",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  SizedBox(height: 5,),

                                  Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text("Healthy Lunch",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 14),))
                                  ,Padding(
                                      padding:  EdgeInsets.only(left: 5),
                                      child: Text("Khichidi desc.",style:TextStyle(color:Colors.black54,fontWeight: FontWeight.w400,fontSize: 12 ))),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                            padding:  EdgeInsets.only(left: 5),
                                            child: Text('\u{20B9} 100',style:TextStyle(color:Colors.black54,fontWeight: FontWeight.w400,fontSize: 12 ))),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: GestureDetector(
                                          onTap: (){},
                                          child: Container(
                                            height: 19,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color: Color(0XFF009951)
                                            ),
                                            child: Center(child: Text("Add",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w500),)),
                                          ),
                                        ),
                                      )

                                    ],
                                  ),


                                ],
                              ),
                            ),
                            SizedBox(width: 12,),
                            Container(
                              padding: EdgeInsets.all(0),
                              height:Get.height/5.5,
                              width: Get.width/3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:Border.all(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: [new BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5.0
                                  )]
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  ClipRRect(
                                    borderRadius:BorderRadius.only(topLeft: Radius.circular(14),topRight: Radius.circular(14),),
                                    child: Image.asset(Constants.imagepath+"rice.png",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  SizedBox(height: 5,),

                                  Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text("Healthy Lunch",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 14),))
                                  ,Padding(
                                      padding:  EdgeInsets.only(left: 5),
                                      child: Text("Khichidi desc.",style:TextStyle(color:Colors.black54,fontWeight: FontWeight.w400,fontSize: 12 ))),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                            padding:  EdgeInsets.only(left: 5),
                                            child: Text('\u{20B9} 100',style:TextStyle(color:Colors.black54,fontWeight: FontWeight.w400,fontSize: 12 ))),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: GestureDetector(
                                          onTap: (){},
                                          child: Container(
                                            height: 19,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color: Color(0XFF009951)
                                            ),
                                            child: Center(child: Text("Add",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w500),)),
                                          ),
                                        ),
                                      )

                                    ],
                                  ),


                                ],
                              ),
                            ),
                            SizedBox(width: 12,),
                            Container(
                              padding: EdgeInsets.all(0),
                              height:Get.height/5.5,
                              width: Get.width/3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:Border.all(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: [new BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5.0
                                  )]
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  ClipRRect(
                                    borderRadius:BorderRadius.only(topLeft: Radius.circular(14),topRight: Radius.circular(14),),
                                    child: Image.asset(Constants.imagepath+"rice.png",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  SizedBox(height: 5,),

                                  Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text("Healthy Lunch",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 14),))
                                  ,Padding(
                                      padding:  EdgeInsets.only(left: 5),
                                      child: Text("Khichidi desc.",style:TextStyle(color:Colors.black54,fontWeight: FontWeight.w400,fontSize: 12 ))),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                            padding:  EdgeInsets.only(left: 5),
                                            child: Text('\u{20B9} 100',style:TextStyle(color:Colors.black54,fontWeight: FontWeight.w400,fontSize: 12 ))),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: GestureDetector(
                                          onTap: (){},
                                          child: Container(
                                            height: 19,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color: Color(0XFF009951)
                                            ),
                                            child: Center(child: Text("Add",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w500),)),
                                          ),
                                        ),
                                      )

                                    ],
                                  ),


                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text("Saturday (14-12-2025)",
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.black,fontSize:17,fontWeight: FontWeight.w600),),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding:  EdgeInsets.only(top: 16,bottom:12),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(0),
                              height:Get.height/5.5,
                              width: Get.width/3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:Border.all(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: [new BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5.0
                                  )]
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  ClipRRect(
                                    borderRadius:BorderRadius.only(topLeft: Radius.circular(14),topRight: Radius.circular(14),),
                                    child: Image.asset(Constants.imagepath+"rice.png",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  SizedBox(height: 5,),

                                  Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text("Healthy Lunch",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 14),))
                                  ,Padding(
                                      padding:  EdgeInsets.only(left: 5),
                                      child: Text("Khichidi desc.",style:TextStyle(color:Colors.black54,fontWeight: FontWeight.w400,fontSize: 12 ))),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                            padding:  EdgeInsets.only(left: 5),
                                            child: Text('\u{20B9} 100',style:TextStyle(color:Colors.black54,fontWeight: FontWeight.w400,fontSize: 12 ))),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: GestureDetector(
                                          onTap: (){},
                                          child: Container(
                                            height: 19,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color: Color(0XFF009951)
                                            ),
                                            child: Center(child: Text("Add",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w500),)),
                                          ),
                                        ),
                                      )

                                    ],
                                  ),


                                ],
                              ),
                            ),
                            SizedBox(width: 12,),
                            Container(
                              padding: EdgeInsets.all(0),
                              height:Get.height/5.5,
                              width: Get.width/3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:Border.all(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: [new BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5.0
                                  )]
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  ClipRRect(
                                    borderRadius:BorderRadius.only(topLeft: Radius.circular(14),topRight: Radius.circular(14),),
                                    child: Image.asset(Constants.imagepath+"rice.png",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  SizedBox(height: 5,),

                                  Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text("Healthy Lunch",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 14),))
                                  ,Padding(
                                      padding:  EdgeInsets.only(left: 5),
                                      child: Text("Khichidi desc.",style:TextStyle(color:Colors.black54,fontWeight: FontWeight.w400,fontSize: 12 ))),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                            padding:  EdgeInsets.only(left: 5),
                                            child: Text('\u{20B9} 100',style:TextStyle(color:Colors.black54,fontWeight: FontWeight.w400,fontSize: 12 ))),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: GestureDetector(
                                          onTap: (){},
                                          child: Container(
                                            height: 19,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color: Color(0XFF009951)
                                            ),
                                            child: Center(child: Text("Add",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w500),)),
                                          ),
                                        ),
                                      )

                                    ],
                                  ),


                                ],
                              ),
                            ),
                            SizedBox(width: 12,),
                            Container(
                              padding: EdgeInsets.all(0),
                              height:Get.height/5.5,
                              width: Get.width/3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:Border.all(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: [new BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5.0
                                  )]
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  ClipRRect(
                                    borderRadius:BorderRadius.only(topLeft: Radius.circular(14),topRight: Radius.circular(14),),
                                    child: Image.asset(Constants.imagepath+"rice.png",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  SizedBox(height: 5,),

                                  Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text("Healthy Lunch",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 14),))
                                  ,Padding(
                                      padding:  EdgeInsets.only(left: 5),
                                      child: Text("Khichidi desc.",style:TextStyle(color:Colors.black54,fontWeight: FontWeight.w400,fontSize: 12 ))),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                            padding:  EdgeInsets.only(left: 5),
                                            child: Text('\u{20B9} 100',style:TextStyle(color:Colors.black54,fontWeight: FontWeight.w400,fontSize: 12 ))),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: GestureDetector(
                                          onTap: (){},
                                          child: Container(
                                            height: 19,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color: Color(0XFF009951)
                                            ),
                                            child: Center(child: Text("Add",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w500),)),
                                          ),
                                        ),
                                      )

                                    ],
                                  ),


                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),




                  ],
                ),
              )
            ],
          ),
        ),

        ),

    ),
  );
}
}
