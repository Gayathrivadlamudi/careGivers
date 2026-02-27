import 'package:currency_converter_pro/currency_converter_pro.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:untitled/utils/constants.dart';
import 'package:flutter/material.dart';
class CurrencyConvertor extends StatefulWidget{
  static const String routeName="/CurrencyConvertor";
  CurrencyConvertor({super.key});
  @override
  State<CurrencyConvertor>createState()=>_CurrencyConvertorState();
}
class Currency{
  final String code;
  Currency({required this.code});
}
class CurrencyCrypto{
  final String code;
  CurrencyCrypto({required this.code});
}
class _CurrencyConvertorState extends State<CurrencyConvertor> with SingleTickerProviderStateMixin//used for animation
 {
late TabController _tabController;
TextEditingController amtController=TextEditingController();
TextEditingController cryptoamtController=TextEditingController();
List<Currency> currencyList=[
  Currency(code:'usd'),
  Currency(code:'inr'),
  Currency(code:'jpy'),
  Currency(code:'krw'),
  Currency(code:'eur')
];
List<CurrencyCrypto> CryptocurrencyList=[
  CurrencyCrypto(code:'bitcoin'),
  CurrencyCrypto(code:'ethereum'),
  CurrencyCrypto(code:'litecoin'),
  CurrencyCrypto(code:'ripple'),
  CurrencyCrypto(code:'dogecoin')
];
@override
void initState(){
  super.initState();
  _tabController=TabController(length: 2, vsync: this);
}
double? convertedAmt;
double? convertedCrypAmt;
 String fromCurrenc="usd";
String toCurrenc="inr";
String fromCrypto = 'bitcoin';
String toCrypto = 'ethereum';
final currencyConvo=CurrencyConverterPro();
 Future<void> convertor(double amount)async {
  try {
    final result=await currencyConvo.convertCurrency(amount: amount, fromCurrency: fromCurrenc, toCurrency: toCurrenc);
    setState(() {
      convertedAmt=result;
    });
    print("result is $result");

  } on Exception catch (e) {
   print("erro $e");
  }
}
Future<void> convertorCry(double amount)async {
  try {
    final result=await currencyConvo.convertCrypto(fromCrypto, toCrypto,amount);
    setState(() {
      convertedCrypAmt=result;
    });

  } on Exception catch (e) {
    print("erro $e");
  }
}
  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: Padding(padding: EdgeInsets.only(top: 68,right: 14,left: 20,bottom: 20),
        child: Column(
          children: [
            Text("Currency convertor",style: TextStyle(fontSize: 23,fontWeight: FontWeight.w500),),
            SizedBox(height: 23,),
            Container(
              height: 45,
              child: TabBar(
                controller: _tabController,
               dividerHeight: 0,
                labelColor: Colors.black,
                tabs: [
                  Tab(text: 'Currency',),
                  Tab(text: 'Crypto',),
                ],
              ),
            ),
            SizedBox(height: 23,),
            Expanded(child:

            TabBarView(
                controller: _tabController,
                children: [
                Column(
                  children: [
                   Padding(
                     padding: const EdgeInsets.fromLTRB(12,14,3,9),
                     child: Row(
                       spacing: 10,
                       children: [
                         DropdownMenu(
                           inputDecorationTheme: InputDecorationTheme(
                             border: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(10),
                               borderSide:
                               const BorderSide(color: Colors.white70),
                             ),

                           ),
                         initialSelection:currencyList[0].code,
                         onSelected: (value){
                           fromCurrenc=value??"";
                         },
                         dropdownMenuEntries:
                           currencyList.map((e)=>DropdownMenuEntry<String>(value: e.code, label: e.code)).toList(),
                           // for(var curr in currencyList)
                           //   DropdownMenuEntry(
                           //     label: curr.code,
                           //     value: curr,
                           //   )
                       ),
                         SizedBox(width: 1,),
                         Icon(Icons.arrow_forward),
                         SizedBox(width: 1,),
                         DropdownMenu(
                           inputDecorationTheme: InputDecorationTheme(
                             border: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(10),
                               borderSide:  const BorderSide(color: Colors.white70),
                             ),

                           ),
                           initialSelection: currencyList[1].code,
                           onSelected: (value){
                             toCurrenc=value??"";
                           },
                           dropdownMenuEntries: currencyList.map((e)=>DropdownMenuEntry(value:e.code, label: e.code)).toList(),
                         )
                       ],
                     ),

                   ),
                    SizedBox(height: 23,),
                    TextField(
                      controller: amtController,
                      keyboardType:TextInputType.number ,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                          const BorderSide(color: Colors.white70),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: "Enter Amount",
                        prefixIcon: Icon(Icons.currency_exchange_rounded),
                        hintText: "1",
                        // label:Text("enter amount") ,
                      ),
                    ),
                    SizedBox(height: 23,),
                    ElevatedButton(onPressed: ()async{
                      double value=double.parse(amtController.text);
                      await convertor(value);
                      print(convertedAmt);
                    }, child: Text("convert Currency",style: TextStyle(color: Colors.white,fontSize: 18),),
                    style: ElevatedButton.styleFrom(
                    minimumSize: Size(Get.width/1.2, 41),
                      shape: RoundedRectangleBorder(borderRadius:
                      BorderRadius.circular(14)),
                      backgroundColor: Colors.blue
                    ),
                    ),
                    SizedBox(height: 23,),
                    Text("Converted Amount: ${convertedAmt?.toStringAsFixed(2)} ${toCurrenc} ",style: TextStyle(color: Colors.black,fontSize: 18),),
                  ],
                ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5,14,1,9),
                        child: Row(
                          children: [
                            DropdownMenu(
                              inputDecorationTheme: InputDecorationTheme(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  const BorderSide(color: Colors.white70),
                                ),

                              ),
                              initialSelection:CryptocurrencyList[0].code,
                              onSelected: (value){
                                fromCrypto=value??"";
                              },
                              dropdownMenuEntries:
                              CryptocurrencyList.map((e)=>DropdownMenuEntry<String>(value: e.code, label: e.code)).toList(),
                              // for(var curr in currencyList)
                              //   DropdownMenuEntry(
                              //     label: curr.code,
                              //     value: curr,
                              //   )

                            ),
                           SizedBox(width: 1,),
                            Icon(Icons.arrow_forward),
                            SizedBox(width: 1,),
                            DropdownMenu(
                              inputDecorationTheme: InputDecorationTheme(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  const BorderSide(color: Colors.white70),
                                ),

                              ),
                              initialSelection: CryptocurrencyList[1].code,
                              onSelected: (value){
                                toCrypto=value??"";
                              },
                              dropdownMenuEntries: CryptocurrencyList.map((e)=>DropdownMenuEntry(value:e.code, label: e.code)).toList(),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 23,),
                      TextField(
                        controller: cryptoamtController,
                        keyboardType:TextInputType.number ,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            const BorderSide(color: Colors.white70),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: "Enter Amount",
                          prefixIcon: Icon(Icons.currency_exchange_rounded),
                          hintText: "1",
                          // label:Text("enter amount") ,
                        ),
                      ),
                      SizedBox(height: 23,),
                      ElevatedButton(

                        onPressed: ()async{
                        double value=double.parse(cryptoamtController.text);
                        await convertorCry(value);
                        print(convertedCrypAmt);
                      },

                        child: Text("convert Crypto Currency",style: TextStyle(color: Colors.white,fontSize: 18),),
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(Get.width/1.2, 41),
                            shape: RoundedRectangleBorder(borderRadius:
                            BorderRadiusGeometry.circular(14)),
                            backgroundColor: Colors.blue
                        ),
                      ),
                      SizedBox(height: 23,),
                      Text("Converted Crypto Amount: ${convertedCrypAmt?.toStringAsFixed(2)} ${toCrypto} ",style: TextStyle(color: Colors.black,fontSize: 18),),
                    ],
                  ),

            ]))
          ],
        ),),
    );
  }
}