import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/utils/init_routes.dart';
import 'package:untitled/views/foodItem_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Kindergarten'),
      getPages: routes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0XFFF44641),
        title: Text(widget.title,style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Container(
              height: 86,
              width: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Color(0XFF14ae5c),

            ),
          child: GestureDetector(
            onTap: (){
              Get.toNamed(FoodItemsView.routeName);
            },
            child: Center(child:Text("FoodSection",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),)
          ),

        ),
      )
    );
  }
}
