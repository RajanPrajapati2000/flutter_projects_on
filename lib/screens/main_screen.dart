import 'package:flutter/material.dart';
import 'package:flutter_project/screens/detail_screen.dart';
import 'package:get/get.dart';





class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD3E8F3),
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text('00 INVEST', style: TextStyle(fontSize: 27, fontWeight: FontWeight.w500),),
                   Icon(Icons.menu, size: 30),
                 ],
               ),
                Expanded(
                  child: Center(
                    child: Container(
                      child: Text('START YOUR INVESTMENT JOURNEY\n'
                          ' WITH\n'
                          ' 00 INVESTINH',
                      style: TextStyle(fontSize: 48, height: 1.5),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF030014),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      )
                    ),
                      onPressed: (){
                       Get.to(() => DetailScreen(), transition: Transition.leftToRight);
                      }, child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Text('Start Investing now'),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.mail, color: Colors.black,),
                        )
                    ],
                  ),
                      )),
                )
              ],
            ),
          ),
        )
    );
  }
}
