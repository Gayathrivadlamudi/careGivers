import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/models/menu_list.dart';
import 'package:untitled/utils/constants.dart';
import 'package:flutter/services.dart';
import 'package:untitled/views/cartView.dart';

import '../Controllers/itemsController.dart';

class FoodItemsView extends StatefulWidget {
  static const String routeName='/fooditems';
  const FoodItemsView({super.key});
  @override
  State<FoodItemsView> createState()=> _FoodItemsViewState();
}
class _FoodItemsViewState extends State<FoodItemsView>{
  late final json=<Map<String,dynamic>>[
    {
      'day':"Monday (10-12-2025)",

      'data':[
        {
          'img':Constants.imagepath+"rice.png",
          'itemTitle':"Healthy Lunch",
          'desc':"Khichidi desc",
          'price':100,
          'color':"009951",
          'addedBit':0,
          'ind':1,
          'oind':0,
        },
        {
          'img':Constants.imagepath+"c.png",
          'itemTitle':"Evening snack",
          'desc':"Khichidi desc",
          'price':50,
          'color':"009951",
          'addedBit':0,
          'ind':2,
          'oind':0,
        },
        {
          'img':Constants.imagepath+"l.png",
          'itemTitle':"Lunch + snack",
          'desc':"Khichidi desc",
          'price':140,'color':"009951",
          'addedBit':0,
          'ind':3,
          'oind':0,

        }
      ]
    },

    {
      'day':"Tuesday (11-12-2025)",
      'oind':1,
      'data':[
        {
          'img':Constants.imagepath+"r&D.png",
          'itemTitle':"Roti & Dal",
          'desc':"Khichidi desc",
          'price':100,'color':"009951",
          'addedBit':0,
          'ind':4,
          'oind':1,
        },
        {
          'img':Constants.imagepath+"fruit.png",
          'itemTitle':"fruit snack",
          'desc':"Khichidi desc",
          'price':50,'color':"009951",
          'addedBit':0,
          'ind':5,
          'oind':1,
        },
        {
          'img':Constants.imagepath+"rice.png",
          'itemTitle':"Rice",
          'desc':"Khichidi desc",
          'price':140,'color':"009951",
          'addedBit':0,
          'ind':6,
          'oind':1,
        }
      ]
    },
    {
      'day':"Wednesday (12-12-2025)",
      'oind':2,
      'data':[
        {
          'img':Constants.imagepath+"rice.png",
          'itemTitle':"Healthy Lunch",
          'desc':"Khichidi desc",
          'price':100,'color':"009951",
          'addedBit':0,
          'ind':7,
          'oind':2,
        },
        {
          'img':Constants.imagepath+"c.png",
          'itemTitle':"Evening snack",
          'desc':"Khichidi desc",
          'price':50,'color':"009951",
          'addedBit':0,
          'ind':8,
          'oind':2,
        },
        {
          'img':Constants.imagepath+"l.png",
          'itemTitle':"Lunch + snack",
          'desc':"Khichidi desc",
          'price':140,'color':"009951",
          'addedBit':0,
          'ind':9,
          'oind':2,
        }
      ]
    },
    {
      'day':"Thursday (13-12-2025)",
      'oind':3,
      'data':[
        {
          'img':Constants.imagepath+"r&D.png",
          'itemTitle':"Roti & Dal",
          'desc':"Khichidi desc",
          'price':100,'color':"009951",
          'addedBit':0,
          'ind':10,
          'oind':3,
        },
        {
          'img':Constants.imagepath+"fruit.png",
          'itemTitle':"fruit snack",
          'desc':"Khichidi desc",
          'price':50,'color':"009951",
          'addedBit':0,
          'ind':11,
          'oind':3,
        },
        {
          'img':Constants.imagepath+"rice.png",
          'itemTitle':"Rice",
          'desc':"Khichidi desc",
          'price':140,'color':"009951",
          'addedBit':0,
          'ind':12,
          'oind':3,
        }
      ]
    },
    {
      'day':"Firday (14-12-2025)",
      'oind':4,
      'data':[
        {
          'img':Constants.imagepath+"r&D.png",
          'itemTitle':"Roti & Dal",
          'desc':"Khichidi desc",
          'price':100,'color':"009951",
          'addedBit':0,
          'ind':13,
          'oind':4,
        },
        {
          'img':Constants.imagepath+"fruit.png",
          'itemTitle':"fruit snack",
          'desc':"Khichidi desc",
          'price':50,'color':"009951",
          'addedBit':0,
          'ind':14,
          'oind':4,
        },
        {
          'img':Constants.imagepath+"rice.png",
          'itemTitle':"Rice",
          'desc':"Khichidi desc",
          'price':140,'color':"009951",
          'addedBit':0,
          'ind':15,
          'oind':4,
        }
      ]
    },
    {
      'day':"Saturday (15-12-2025)",
      'oind':5,
      'data':[
        {
          'img':Constants.imagepath+"r&D.png",
          'itemTitle':"Roti & Dal",
          'desc':"Khichidi desc",
          'price':100,'color':"009951",
          'addedBit':0,
          'ind':16,
          'oind':5,
        },
        {
          'img':Constants.imagepath+"fruit.png",
          'itemTitle':"fruit snack",
          'desc':"Khichidi desc",
          'price':50,'color':"009951",
          'addedBit':0,
          'ind':17,
          'oind':5,
        },
        {
          'img':Constants.imagepath+"rice.png",
          'itemTitle':"Rice",
          'desc':"Khichidi desc",
          'price':140,'color':"009951",
          'addedBit':0,
          'ind':18,
          'oind':5,
        }
      ]
    }
  ];
  late List<MenuList> items=json.map(
          (data)=>  MenuList.fromJson(data)
  ).toList();
  final controller=Get.put(ItemsController());
  int sum=0;
  @override
  void initState(){
    super.initState();
    controller.originalList.assignAll(items);
  }
@override
  Widget build(BuildContext context){
  return  Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(54),
          child: AppBar(
            automaticallyImplyLeading:false,
            backgroundColor:  Color(0xFFf44641),
            iconTheme: IconThemeData(color: Colors.white),
            flexibleSpace:
            Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 50),
                    decoration: BoxDecoration(
                        color: Color(0xFFf44641)
                    ),
                    child:Padding(padding: EdgeInsets.symmetric(horizontal:14),
                        child: Row(
                          children: [
                            GestureDetector(onTap: (){Get.back();},child: Icon(Icons.arrow_back,color: Colors.white,),),
                            SizedBox(width: 9,),
                            Expanded(child: Text("OnDemand Packages",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 18),))

                            ,GestureDetector(onTap: (){},
                              child: Icon(Icons.notification_important_outlined,color: Colors.white,),
                            ),
                            IconButton(onPressed: (){
                              Get.to(()=>cartView(sum:sum));
                            },
                              icon:  Icon(Icons.add_shopping_cart_outlined,color: Colors.white,),
                            ) ,], )), ),
                  Positioned(
                    right: 18,
                    bottom:25,
                    child:Container(
                      alignment:  Alignment.center,
                      padding: const EdgeInsets.only(  left: 5,  right: 5),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(75),
                        color: Colors.white,
                      ),
                      child:
                      Obx(()=>Text("${controller.cartCount.value}",
                        style: TextStyle(color: Colors.black,fontSize:12,fontWeight: FontWeight.w600  )
                        ,))
                    ),

                  )
                ]
            ),
          ),
        ),
        body:
        SingleChildScrollView(
          child:
          Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.originalList.length,
                itemBuilder: (context,i){
                  List<Item> data=controller.originalList[i].data;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal:5,vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (i == 0)
                          Padding(
                            padding: const EdgeInsets.only(top:12,left: 9.0, bottom: 12),
                            child: Text(
                              "Weekly Food Menu (10-12-2025 to 15-12-2025)",
                              style: TextStyle(
                                fontSize:16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(left: 14.0),
                          child: Text("${controller.originalList[i].day}",
                            textAlign: TextAlign.start,
                            style: TextStyle(color: Colors.black,fontSize:17,fontWeight: FontWeight.w600),),
                        ),
                        SizedBox(height: 3,),
                        SizedBox(
                          height:176,
                          child:
                          ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: data.length,
                              itemBuilder:(context,j){
                                return
                                  Padding(
                                    padding:  EdgeInsets.only(top: 14,bottom: 14,left: 12),
                                    child: Container(
                                      padding: EdgeInsets.all(0),
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
                                            child: Image.asset(data[j].img,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          SizedBox(height: 5,),
                                          Padding(
                                              padding: EdgeInsets.only(left: 5),
                                              child: Text(data[j].foodTitle,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 14),))
                                          ,Padding(
                                              padding:  EdgeInsets.only(left: 5),
                                              child: Text(data[j].desc,style:TextStyle(color:Colors.black54,fontWeight: FontWeight.w400,fontSize: 12 ))),
                                          Expanded(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                      padding:  EdgeInsets.only(left: 5),
                                                      child: Text('\u{20B9} ${data[j].price}',style:TextStyle(color:Colors.black,fontWeight: FontWeight.w600,fontSize: 12 ))),
                                                ),

                                                Padding(
                                              padding: EdgeInsets.only(right: 5),
                                              child:GestureDetector(
                                                  onTap: (){
                                                    // if(!(controller.addedItems.contains(data[j]))) {
                                                    //   // controller.addItems(data[j]);
                                                    //   controller.countIncre();
                                                    //   setState(() {
                                                    //     controller.originalList[i].data[j].color="E6E9F3";
                                                    //   });
                                                    //
                                                    //   controller.addedItems.refresh();
                                                    // }
                                                    if(data[j].addedBit!=1){
                                                      data[j].addedBit=1;

                                                      controller.countIncre();
                                                     setState(() {
                                                       data[j].color="E6E9F3";
                                                       sum+=data[j].price;
                                                     });
                                                    }
                                                  },
                                                  child: Container(
                                                    height: 19,
                                                    width: 35,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color:Constants.hexColor(data[j].color),
                                                    ),
                                                    child: Center(child: Text("Add",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w500),)),
                                                  ),  ),   )

                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );

                              }),
                        ),

                      ],
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:16,vertical: 5),
                child: Row(
                  children: [
                    Image.asset(Constants.imagepath+"redCheck.png",height: 21,width: 21,fit: BoxFit.contain,),
                    SizedBox(width: 12,),
                    Text(" All meals are prepared with mild spices and child \n friendly ingredients"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:16,vertical: 5),
                child: Row(
                  children: [
                    Image.asset(Constants.imagepath+"blackCheck.png",height: 21,width: 21,fit: BoxFit.contain,),
                    SizedBox(width: 12,),
                    Text(" You have to book the meal before day 7PM"),
                  ],
                ),
              ),
              SizedBox(width: 16,),

            ],
          ),
        ),
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
      );
}
}
