import 'package:flutter/material.dart';
import 'package:flutter_project/screens/detail_screen.dart';
import 'package:get/get.dart';




class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD3E8F1),
         body: SafeArea(
           child: Expanded(
             child: Container(
               padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
               child: Column(
                 children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('00 INVEST', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                          Icon(Icons.menu, ),
                        ],
                      ),
                   Expanded(
                     child: Container(
                         margin: EdgeInsets.only(top: 100),
                         child: Text('START YOUR  INVESTMENT JOURNEY WITH 00 INVESTING',
                             style: TextStyle(fontSize: 50, height: 1.4 ))),
                   ),

                   SizedBox(height: 170,),
                   Container(
                     width: 350,
                     height: 60,
                     child: ElevatedButton(
                       style: ElevatedButton.styleFrom(
                         primary: Color(0xFF0A031C),
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(40),
                         )
                       ),
                         onPressed: (){
                          Get.to(() => DetailScreen(), transition: Transition.leftToRight);
                         },
                         child: Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 10),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text('Start Investing now'),
                               CircleAvatar(
                                 backgroundColor: Colors.white,
                                 child: Icon(Icons.arrow_back_ios),
                               )
                             ],
                           ),
                         )),
                   )
                 ],
               ),
             ),
           ),
         ),
    );
  }
}
