import 'package:flutter/material.dart';
import 'package:flutter_project/provider/data_provider.dart';
import 'package:flutter_project/widgets/stock_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




class DetailScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Colors.black,
      drawer: Drawer(
        child: ListView(
          children: [
           DrawerHeader(
               decoration: BoxDecoration(
                 image: DecorationImage(
                   image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQn0EQn9cCXCHQQZefRsJnrzu5tpvDJFJ4GCg&usqp=CAU')
                 )
               ),
               child: Container(

           ))
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 90),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: AppBar(
            backgroundColor: Colors.black,
            elevation: 0,
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
          child: Consumer(
            builder: (context, ref, child) {
              return ListView(
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
                              onPressed: () {

                              }, child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Text('Invest Now', style: TextStyle(
                                color: Colors.black, letterSpacing: 1),),
                          )),
                        ),

                      ],
                    ),
                  ),
                  _buildPadding(label: 'Popular Stocks'),

                  StockWidget(data: ref.read(dataProvider).stocks),

                  SizedBox(height: 17,),

                  _buildPadding(label: 'Following Stocks'),
                  StockWidget(data: ref.watch(dataProvider).following_stocks,),

                ],
              );
            }
          ),
        ),
    );
  }

  Padding _buildPadding({required String label}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Text(label, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
    );
  }
}
