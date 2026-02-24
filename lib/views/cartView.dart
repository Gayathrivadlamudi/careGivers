import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/Controllers/itemsUpdate.dart';
import 'package:untitled/utils/constants.dart';

import '../models/menu_list.dart';
import 'gstpage.dart';
class cartView extends StatefulWidget{
  static const String routeName="/cartViews";
  const cartView({super.key});
  @override
  State<cartView>createState()=>_cartViewState();
}
class _cartViewState extends State<cartView>{
   final  itemController=Get.put(ItemsUpdate());
  late List<Item> items=itemController.items;
  int sum=0;
@override
void initState(){
  super.initState();
sum=caluSum();
}
int caluSum(){
  for(int i=0;i<items.length;i++){
    sum+=items[i].price;
  }
  return sum;
}

        @override
  Widget build(BuildContext context){
          return
            Obx(
                ()=>
                    Scaffold(
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
                                  Text("OnDemand Packages",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 18),)
                                  ,],)), ),
                      )),
                  body: (items.length==0)?Center(child: Text("No Items are added to card",
                    style:TextStyle(fontSize: 23,fontWeight: FontWeight.w500,color: Colors.black) ,),):


                  SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: items.length,
                          itemBuilder: (context,i){
                            return Padding(
                              padding:  EdgeInsets.only(top: 14,bottom: 12,left: 32,right:41),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border:Border.all(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(14),
                                    boxShadow: [new BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 5.0
                                    )]
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: ClipRRect(
                                        borderRadius:BorderRadius.circular(14),

                                        child: Image.asset(items[i].img,
                                          fit: BoxFit.contain,
                                          height: 100,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width:2,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(left: 5,top: 23),
                                            child: Text(items[i].foodTitle,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 18),))
                                        ,Padding(
                                            padding:  EdgeInsets.only(left: 5),
                                            child: Text(items[i].desc,style:TextStyle(color:Colors.black54,fontWeight: FontWeight.w400,fontSize: 14 ))),
                                        Padding(
                                            padding:  EdgeInsets.only(left: 5),
                                            child: Text('\u{20B9} ${items[i].price}',style:TextStyle(color:Colors.black,fontWeight: FontWeight.w600,fontSize: 14 ))),
                                        GestureDetector(
                                          onTap:(){
                                            setState(() {
                                              itemController.removeItems(items[i]);
                                              itemController .originalList[items[i].i].data[items[i].j].color="009951";
                                              itemController.countDecre();
                                              itemController.originalList.refresh();
                                             sum-=items[i].price;
                                            });

                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 5,top: 5),
                                            child: Container(
                                              height: 23,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color:Color(0xFFf44641),
                                              ),
                                              child: Center(child: Text("Remove",
                                                style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w500),)),),
                                          ),
                                        ),

                                      ],
                                    )

                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(23),
                          child: Container(
                            padding: EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [new BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5.0,
                              )]
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("${items.length} items are selected",
                                      style: TextStyle(color: Colors.black54,fontSize: 14),),
                                      Text("Total payable: ${sum}",
                                        style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.w500),)
                                    ],

                                  ),
                                ),
                                ElevatedButton(onPressed: (){
                                  Get.to(Gstpage(sum:sum));
                                },
                                    child: Text("Pay Now"),
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.green,
                                  foregroundColor: Colors.white,),)
                              ],
                            )
                          ),
                        )

                      ],
                    ),
                  ),
                ),
            );
        }
}