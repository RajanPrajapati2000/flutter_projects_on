import 'package:flutter/material.dart';



class Stock{

  late Color boxColor;
  late Color circleColor;
  late IconData logo;
  late String label;
  late String data;


  Stock({
    required this.data,
    required this.label,
    required this.logo,
    required this.circleColor,
    required this.boxColor
});


}
