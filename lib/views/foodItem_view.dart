import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/models/menu_list.dart';
import 'package:untitled/utils/constants.dart';
import 'package:flutter/services.dart';
import 'package:untitled/views/cartView.dart';

class FoodItemsView extends StatefulWidget {
  static const String routeName='/fooditems';
  const FoodItemsView({super.key});
  @override
  State<FoodItemsView> createState()=> _FoodItemsViewState();
}
class _FoodItemsViewState extends State<FoodItemsView>{
  static int cartCount=0;
  late final json=<Map<String,dynamic>>[
  {
    'day':"Monday (10-12-2025)",
    'data':[
      {
        'img':Constants.imagepath+"rice.png",
        'itemTitle':"Healthy Lunch",
        'desc':"Khichidi desc",
        'price':100,
      },
      {
        'img':Constants.imagepath+"c.png",
        'itemTitle':"Evening snack",
        'desc':"Khichidi desc",
        'price':50,
      },
      {
        'img':Constants.imagepath+"l.png",
        'itemTitle':"Lunch + snack",
        'desc':"Khichidi desc",
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
          'desc':"Khichidi desc",
          'price':100,
        },
        {
          'img':Constants.imagepath+"fruit.png",
          'itemTitle':"fruit snack",
          'desc':"Khichidi desc",
          'price':50,
        },
        {
          'img':Constants.imagepath+"rice.png",
          'itemTitle':"Rice",
          'desc':"Khichidi desc",
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
          'desc':"Khichidi desc",
          'price':100,
        },
        {
          'img':Constants.imagepath+"c.png",
          'itemTitle':"Evening snack",
          'desc':"Khichidi desc",
          'price':50,
        },
        {
          'img':Constants.imagepath+"l.png",
          'itemTitle':"Lunch + snack",
          'desc':"Khichidi desc",
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
          'desc':"Khichidi desc",
          'price':100,
        },
        {
          'img':Constants.imagepath+"fruit.png",
          'itemTitle':"fruit snack",
          'desc':"Khichidi desc",
          'price':50,
        },
        {
          'img':Constants.imagepath+"rice.png",
          'itemTitle':"Rice",
          'desc':"Khichidi desc",
          'price':140,
        }
      ]
    },
    {
      'day':"Firday (14-12-2025)",
      'data':[
        {
          'img':Constants.imagepath+"r&D.png",
          'itemTitle':"Roti & Dal",
          'desc':"Khichidi desc",
          'price':100,
        },
        {
          'img':Constants.imagepath+"fruit.png",
          'itemTitle':"fruit snack",
          'desc':"Khichidi desc",
          'price':50,
        },
        {
          'img':Constants.imagepath+"rice.png",
          'itemTitle':"Rice",
          'desc':"Khichidi desc",
          'price':140,
        }
      ]
    },
    {
      'day':"Saturday (15-12-2025)",
      'data':[
        {
          'img':Constants.imagepath+"r&D.png",
          'itemTitle':"Roti & Dal",
          'desc':"Khichidi desc",
          'price':100,
        },
        {
          'img':Constants.imagepath+"fruit.png",
          'itemTitle':"fruit snack",
          'desc':"Khichidi desc",
          'price':50,
        },
        {
          'img':Constants.imagepath+"rice.png",
          'itemTitle':"Rice",
          'desc':"Khichidi desc",
          'price':140,
        }
      ]
    }
  ];

  late List<MenuList> items=json.map(
          (data)=>  MenuList.fromJson(data)
  ).toList();
  int count=1;
   List<Item> cartItems=[];

@override
  Widget build(BuildContext context){
  return Scaffold(
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
            child:Padding(padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    GestureDetector(onTap: (){Get.back();},child: Icon(Icons.arrow_back,color: Colors.white,),),
                    SizedBox(width: 9,),
                    Text("OnDemand Packages",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 18),)
                    ,SizedBox(width: 77,),
                    GestureDetector(onTap: (){},
                      child: Icon(Icons.notification_important_outlined,color: Colors.white,),
                    ),
                    SizedBox(width: 14,),
                      GestureDetector(onTap: (){
                        Get.to(()=>cartView(items:cartItems));
                      },
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
    body:
    SingleChildScrollView(
      child: Column(
      children: [
        ListView.builder(
          shrinkWrap: true,//take only required height, not infinite"
        physics: NeverScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context,i){
            List<Item> data=items[i].data;
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
                    child: Text("${items[i].day}",
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.black,fontSize:17,fontWeight: FontWeight.w600),),
                  ),
                  SizedBox(height: 3,),
                  SizedBox(
                    height:176,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: data.length,
                        itemBuilder:(context,j){
                          return
                            Padding(
                            padding:  EdgeInsets.only(top: 14,bottom: 12,left: 12),
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
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                            padding:  EdgeInsets.only(left: 5),
                                            child: Text('\u{20B9} ${data[j].price}',style:TextStyle(color:Colors.black,fontWeight: FontWeight.w600,fontSize: 12 ))),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: GestureDetector(
                                          onTap: (){
                                            setState(() {

                                              if(!(cartItems.contains(data[j]))){
                                                cartItems.add(data[j]);
                                                ++cartCount;
                                              }

                                            });
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
                          );

                        }),
                  ),

                ],
              ),
            );
          },
        ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:14,vertical: 5),
                child: Row(
                  children: [
                    Image.asset(Constants.imagepath+"redCheck.png",height: 25,width: 25,fit: BoxFit.contain,),
                    SizedBox(width: 12,),
                    Text(" All meals are prepared with mild spices and child \n friendly ingredients"),
                  ],
                ),
              ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:14,vertical: 5),
          child: Row(
            children: [
              Image.asset(Constants.imagepath+"blackCheck.png",height: 25,width: 25,fit: BoxFit.contain,),
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
          setState(() {

          })
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
