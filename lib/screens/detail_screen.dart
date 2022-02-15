import 'package:flutter/material.dart';




class DetailScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBFDFF),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 80),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: AppBar(
            elevation: 0,
            backgroundColor: Color(0xFFFBFDFF),
          leading: CircleAvatar(
            radius: 35,
            backgroundColor: Color(0xFF0C041D),
            child: Icon(Icons.menu),
          ),

            actions: [
              CircleAvatar(
                radius: 35,
               backgroundImage: NetworkImage('https://images.unsplash.com/photo-1644207072264-61e9bd2507a2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDI4fHRvd0paRnNrcEdnfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
              ),
            ],

          ),
        ),
      ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
          child: ListView(
            children: [
               Container(
                 height: 200,
                 width: double.infinity,
                 decoration: BoxDecoration(
                color: Color(0xFF101215),
                   borderRadius: BorderRadius.circular(20)
                 ),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text('Better Way To Invest', style: TextStyle(color: Colors.white),),
                     ElevatedButton(onPressed: (){}, child: Text('Invest Now')),
                   ],
                 ),
               ),
            ],
          ),
        ),
    );
  }
}
