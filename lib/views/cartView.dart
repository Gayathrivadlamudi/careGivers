import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/menu_list.dart';
class cartView extends StatefulWidget{
  static const String routeName="/cartViews";
  List<Item> items=[];
   cartView({required this.items,super.key});
  @override
  State<cartView>createState()=>_cartViewState();
}
class _cartViewState extends State<cartView>{
  int sum=0;
        @override
  Widget build(BuildContext context){
          return
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
                            ,], )), ),
                  )),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: widget.items.length,
                      itemBuilder: (context,i){
                       return Padding(
                          padding:  EdgeInsets.only(top: 14,bottom: 12,left: 12,right: 12),
                          child: Container(
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: ClipRRect(
                                    borderRadius:BorderRadius.circular(14),

                                    child: Image.asset(widget.items[i].img,
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
                                      child: Text(widget.items[i].foodTitle,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 18),))
                                  ,Padding(
                                      padding:  EdgeInsets.only(left: 5),
                                      child: Text(widget.items[i].desc,style:TextStyle(color:Colors.black54,fontWeight: FontWeight.w400,fontSize: 14 ))),
                                  Padding(
                                      padding:  EdgeInsets.only(left: 5),
                                      child: Text('\u{20B9} ${widget.items[i].price}',style:TextStyle(color:Colors.black,fontWeight: FontWeight.w600,fontSize: 14 ))),
                                ],
                              )

                              ],
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            );
        }
}