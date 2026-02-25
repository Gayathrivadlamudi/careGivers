import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/Controllers/itemsController.dart';
import 'package:untitled/utils/constants.dart';

import '../models/menu_list.dart';
import 'gstpage.dart';
class cartView extends StatefulWidget{
  static const String routeName="/cartViews";
  int sum;
   cartView({required this.sum,super.key});
  @override
  State<cartView>createState()=>_cartViewState();
}
class _cartViewState extends State<cartView> {
  final Controller = Get.put(ItemsController());
  late List<MenuList> OriginalList = Controller.originalList;

  List<Item> addedItems = [];

  //late List<Item> items=Controller.addedItems;

  @override
  void initState() {
    super.initState();
    for(var menu in OriginalList){
      addedItems.addAll(menu.data.where((e)=>e.addedBit==1));
    }
// sum=caluSum();
  }

// int caluSum(){
//   // for(int i=0;i<itemController.addedItems.length;i++){
//   //   sum+=itemController.addedItems[i].price;
//   // }
//   return sum;
// }

  @override
  Widget build(BuildContext context) {
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
                      Text("OnDemand Packages",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 18),)
                      ,],)), ),
          )),
      body:
        SingleChildScrollView(
         child: Column(
           children: [
         Padding(padding: EdgeInsets.symmetric(horizontal: 23,vertical: 23),
           child:ListView.builder(
               shrinkWrap: true,
               physics: NeverScrollableScrollPhysics(),
               itemCount:addedItems.length
               ,itemBuilder: (BuildContext context,j) {
             return
               Column(
                 children: [
                   Container(
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
                           child: Image.asset(addedItems[j].img,
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
                               child: Text(addedItems[j].foodTitle,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 18),))
                           ,Padding(
                               padding:  EdgeInsets.only(left: 5),
                               child: Text(addedItems[j].desc,style:TextStyle(color:Colors.black54,fontWeight: FontWeight.w400,fontSize: 14 ))),
                           Padding(
                               padding:  EdgeInsets.only(left: 5),
                               child: Text('\u{20B9} ${addedItems[j].price}',style:TextStyle(color:Colors.black,fontWeight: FontWeight.w600,fontSize: 14 ))),
                           GestureDetector(
                             onTap:(){
                               setState(() {
                                 //  itemController.removeItems(items[i]);
                                 //  //itemController .originalList[itemController.addedItems[i].i].data[itemController.addedItems[i].j].color="009951";
                                 //  itemController.countDecre();
                                 //  itemController.originalList.refresh();
                                 // sum-=itemController.addedItems[i].price;
                                 Controller.countDecre();
                                 int ind=addedItems[j].ind;
                                 int oind=addedItems[j].oind;
                                 List<Item> data=Controller.originalList[oind].data;
                                 //nt index = data.indexWhere((sublist) => sublist.contains(keyToFind));
                                int index=data.indexWhere((item)=>item.contains(ind));
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
                       )   ],
                   ),  ),
                   SizedBox(height: 18,)
                 ],
               );
           }
           ),

        )
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
         // return Obx(
         //        ()=>
         //            Scaffold(
         //          backgroundColor: Colors.white,
         //          appBar: PreferredSize(preferredSize: Size.fromHeight(54),
         //              child: AppBar(
         //                automaticallyImplyLeading: false,
         //                backgroundColor:  Color(0xFFf44641),
         //                iconTheme: IconThemeData(color: Colors.white),
         //                flexibleSpace:   Container(
         //                  padding: EdgeInsets.only(top: 50),
         //                  decoration: BoxDecoration(
         //                      color: Color(0xFFf44641)
         //                  ),
         //                  child:Padding(padding: EdgeInsets.symmetric(horizontal: 16),
         //                      child: Row(
         //                        children: [
         //                          GestureDetector(onTap: (){Get.back();},child: Icon(Icons.arrow_back,color: Colors.white,),),
         //                          SizedBox(width: 9,),
         //                          Text("OnDemand Packages",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 18),)
         //                          ,],)), ),
         //              )),
         //          body: (itemController.addedItems.length>0)?
         //          SingleChildScrollView(
         //            child: Column(
         //              children: [
         //                ListView.builder(
         //                  shrinkWrap: true,
         //                  physics: NeverScrollableScrollPhysics(),
         //                  itemCount: itemController.addedItems.length,
         //                  itemBuilder: (context,i){
         //                    return Padding(
         //                      padding:  EdgeInsets.only(top: 14,bottom: 12,left: 32,right:41),
         //                      child:
//                      Container(
         //                        decoration: BoxDecoration(
         //                            color: Colors.white,
         //                            border:Border.all(color: Colors.black12),
         //                            borderRadius: BorderRadius.circular(14),
         //                            boxShadow: [new BoxShadow(
         //                                color: Colors.black12,
         //                                blurRadius: 5.0
         //                            )]
         //                        ),
         //                        child: Row(
         //                          mainAxisAlignment: MainAxisAlignment.start,
         //                          crossAxisAlignment: CrossAxisAlignment.start,
         //                          children: [
         //                            Padding(
         //                              padding: const EdgeInsets.all(12),
         //                              child: ClipRRect(
         //                                borderRadius:BorderRadius.circular(14),
         //
         //                                child: Image.asset(itemController.addedItems[i].img,
         //                                  fit: BoxFit.contain,
         //                                  height: 100,
         //                                ),
         //                              ),
         //                            ),
         //                            SizedBox(width:2,),
         //                            Column(
         //                              mainAxisAlignment: MainAxisAlignment.center,
         //                              crossAxisAlignment: CrossAxisAlignment.start,
         //                              children: [
         //                                Padding(
         //                                    padding: EdgeInsets.only(left: 5,top: 23),
         //                                    child: Text(itemController.addedItems[i].foodTitle,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 18),))
         //                                ,Padding(
         //                                    padding:  EdgeInsets.only(left: 5),
         //                                    child: Text(itemController.addedItems[i].desc,style:TextStyle(color:Colors.black54,fontWeight: FontWeight.w400,fontSize: 14 ))),
         //                                Padding(
         //                                    padding:  EdgeInsets.only(left: 5),
         //                                    child: Text('\u{20B9} ${itemController.addedItems[i].price}',style:TextStyle(color:Colors.black,fontWeight: FontWeight.w600,fontSize: 14 ))),
         //                                GestureDetector(
         //                                  onTap:(){
         //                                    setState(() {
         //                                     //  itemController.removeItems(items[i]);
         //                                     //  //itemController .originalList[itemController.addedItems[i].i].data[itemController.addedItems[i].j].color="009951";
         //                                     //  itemController.countDecre();
         //                                     //  itemController.originalList.refresh();
         //                                     // sum-=itemController.addedItems[i].price;
         //
         //                                    });
         //
         //                                  },
         //                                  child: Padding(
         //                                    padding: const EdgeInsets.only(left: 5,top: 5),
         //                                    child: Container(
         //                                      height: 23,
         //                                      width: 50,
         //                                      decoration: BoxDecoration(
         //                                        borderRadius: BorderRadius.circular(5),
         //                                        color:Color(0xFFf44641),
         //                                      ),
         //                                      child: Center(child: Text("Remove",
         //                                        style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w500),)),),
         //                                  ),
         //                                ),
         //
         //                              ],
         //                            )
         //
         //                          ],
         //                        ),
         //                      ),
         //                    );
         //                  },
         //                ),
         //                Padding(
         //                  padding: const EdgeInsets.all(23),
         //                  child: Container(
         //                    padding: EdgeInsets.all(14),
         //                    decoration: BoxDecoration(
         //                      color: Colors.white,
         //                      borderRadius: BorderRadius.circular(12),
         //                      boxShadow: [new BoxShadow(
         //                        color: Colors.black12,
         //                        blurRadius: 5.0,
         //                      )]
         //                    ),
         //                    child: Row(
         //                      children: [
         //                        Expanded(
         //                          child: Column(
         //                            crossAxisAlignment: CrossAxisAlignment.start,
         //                            children: [
         //                              Text("${itemController.addedItems.length} items are selected",
         //                              style: TextStyle(color: Colors.black54,fontSize: 14),),
         //                              Text("Total payable: ${sum}",
         //                                style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.w500),)
         //                            ],
         //
         //                          ),
         //                        ),
         //                        ElevatedButton(onPressed: (){
         //                          Get.to(Gstpage(sum:sum));
         //                        },
         //                            child: Text("Pay Now"),
         //                        style: ElevatedButton.styleFrom(backgroundColor: Colors.green,
         //                          foregroundColor: Colors.white,),)
         //                      ],
         //                    )
         //                  ),
         //                )
         //
         //              ],
         //            ),
         //          ):Center(child: Text("No Items are added to card",
         //            style:TextStyle(fontSize: 23,fontWeight: FontWeight.w500,color: Colors.black) ,),),
         //              bottomNavigationBar: SizedBox(
         //                height: 63,
         //                child: BottomNavigationBar(
         //                  type:BottomNavigationBarType.fixed,
         //                  selectedItemColor:Color(0xFFf44641) ,
         //                  unselectedItemColor: Colors.black,
         //                  backgroundColor: Colors.white,
         //                  onTap: (value)=>{
         //                  },
         //                  items: [
         //                    BottomNavigationBarItem(
         //                      label: 'Home',
         //                      icon: Image.asset(Constants.imagepath+"home.png",height: 23,width: 23,),),
         //                    BottomNavigationBarItem(
         //                      label: 'Fee',
         //                      icon: Image.asset(Constants.imagepath+"fee.png",height: 23,width: 23,),),
         //                    BottomNavigationBarItem(
         //                      label: 'Notifications',
         //                      icon: Image.asset(Constants.imagepath+"notification.png",height: 23,width: 23,),),
         //                    BottomNavigationBarItem(
         //                      label: 'Messages',
         //                      icon: Image.asset(Constants.imagepath+"mesg.png",height: 23,width: 23,),),
         //                    BottomNavigationBarItem(
         //                      label: 'Profile',
         //                      icon: Image.asset(Constants.imagepath+"profile.png",height: 23,width: 23,),)
         //                  ],
         //                ),
         //              ),
         //        ),
         //    );


