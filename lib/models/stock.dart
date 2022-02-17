import 'package:flutter/material.dart';




class Stock{

  late IconData logo;
  late String label;
  late Color boxColor;
  late Color circleColor;
  late String data;


  Stock({
    required this.data,
    required this.label,
    required this.boxColor,
    required this.circleColor,
    required this.logo,
});


}