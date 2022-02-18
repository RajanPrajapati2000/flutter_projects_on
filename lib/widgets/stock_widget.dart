import 'package:flutter/material.dart';
import 'package:flutter_project/provider/data_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




class StockWidget extends StatelessWidget {
final bool isPopular;
StockWidget({required this.isPopular});

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, ref, child) {
          final data = isPopular ?  ref.watch(dataProvider).popular_stocks : ref.watch(dataProvider).following_stocks;
          return Container(
            height: 200,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final dat = data[index];
                  return Container(
                    margin: EdgeInsets.only(right: 12),
                    width: 150,
                    decoration: BoxDecoration(
                      color: dat.boxColor.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 34,
                          backgroundColor: dat.circleColor
                              .withOpacity(0.5),
                          child: Icon(dat.logo, size: 30,),
                        ),
                        SizedBox(height: 10,),
                        Text(dat.label, style: TextStyle(fontSize: 17,
                            fontWeight: FontWeight.w500),),
                        SizedBox(height: 5,),
                        Text(dat.data, style: TextStyle(fontSize: 15,
                            fontWeight: FontWeight.w500),)
                      ],
                    ),
                  );
                }

            ),
          );
        }
    );
  }
}
