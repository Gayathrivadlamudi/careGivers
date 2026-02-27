import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/material.dart';
import 'package:untitled/utils/constants.dart';
class AdvancedCurrencyConvertor extends StatefulWidget{
  static const String routeName="/AdvancedCurrencyConvertor";
  AdvancedCurrencyConvertor({super.key});
  @override
  State<AdvancedCurrencyConvertor>createState()=>_AdvancedCurrencyConvertor();
}
class _AdvancedCurrencyConvertor extends  State<AdvancedCurrencyConvertor>{
  Future<void> getCurrencyData()async{
    Dio dio=new Dio();
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient=(){
      final client=HttpClient();
      client.idleTimeout=Duration(seconds: 15);
      client.connectionTimeout=Duration(seconds: 15);
      return client;
    };
    Response response=await dio.get(Constants.currency_baseUrl);
    print(response);
  }
  @override
  void initState(){
    super.initState();
    getCurrencyData();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Advanced Currency Convertor"),
      ),
    body: Column(
      children: [
      ElevatedButton(onPressed: (){}, child: Text("getting api")),
      ],
    ),
    );
  }
}
