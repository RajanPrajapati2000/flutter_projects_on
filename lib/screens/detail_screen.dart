import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/providers/data_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class DetailScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 90),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: CircleAvatar(
              backgroundColor: Colors.black,
              child: Icon(Icons.menu),
            ),
            actions: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQn0EQn9cCXCHQQZefRsJnrzu5tpvDJFJ4GCg&usqp=CAU',
                ),
                backgroundColor: Colors.black,
                child: Icon(Icons.menu),
              ),
            ],
          ),
        ),
      ),
        body: Padding(
          padding: const EdgeInsets.only(top: 7, left: 17, right: 17),
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF232526),
                  borderRadius: BorderRadius.circular(20),
                ),
                width: double.infinity,
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Better Way\n'
                        'To Invest', style: TextStyle(color: Colors.white,
                        fontSize: 27,
                        wordSpacing: 7, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                   SizedBox(height: 10,),
                    Container(
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                          )
                        ),
                          onPressed: (){

                          }, child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Text('Invest Now', style: TextStyle(color: Colors.black, letterSpacing: 1),),
                          )),
                    ),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text('Popular Stocks', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
              ),

              Consumer(
               builder: (context, ref, child){
                 final data = ref.watch(dataProvider).stocks;
                 return Container(
                   height: 200,
                   child: ListView.builder(
                     shrinkWrap: true,
                     physics: BouncingScrollPhysics(),
                     scrollDirection: Axis.horizontal,
                       itemCount: data.length,
                       itemBuilder: (context, index){
                       final dat = data[index];
                         return Container(
                           width: 150,
                           margin: EdgeInsets.only(right: 15),
                           decoration: BoxDecoration(
                             color: dat.boxColor.withOpacity(0.4),
                             borderRadius: BorderRadius.circular(20)
                           ),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               CircleAvatar(
                                 backgroundColor: dat.circleColor.withOpacity(0.4),
                                 radius: 35,
                                 child: Icon(dat.logo, size: 30,),
                               ),
                               SizedBox(height: 10,),
                               Text(dat.label, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                               SizedBox(height: 10,),
                               Text(dat.data, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),)
                             ],
                           ),
                         );
                       }
                   ),
                 );
               }
              ),


            ],
          ),
        ),
    );
  }
}
