import 'package:flutter_project/models/stock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


final dataProvider = Provider((ref) => DataProvider());

class DataProvider{

  List<Stock> stocks = [
     Stock(
         data: '+526%',
         label: 'Amazon',
         boxColor: Colors.blueGrey,
         circleColor: Colors.green,
         logo: FontAwesomeIcons.amazon,
     ),
    Stock(
      data: '+626%',
      label: 'Windows',
      boxColor: Colors.pinkAccent,
      circleColor: Colors.white,
      logo: FontAwesomeIcons.windows,
    ),
    Stock(
      data: '+426%',
      label: 'Apple',
      boxColor: Colors.black26,
      circleColor: Colors.white70,
      logo: FontAwesomeIcons.apple,
    ),
    Stock(
      data: '+726%',
      label: 'Linux',
      boxColor: Colors.teal,
      circleColor: Colors.grey,
      logo: FontAwesomeIcons.linux,
    ),

  ];



}