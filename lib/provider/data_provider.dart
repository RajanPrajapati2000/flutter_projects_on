import 'package:flutter_project/models/stock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final dataProvider = Provider((ref) => DataProvider());

class DataProvider{


List<Stock> popular_stocks = [

 Stock(
     data: '+526%',
     label: 'Amazon',
     logo: FontAwesomeIcons.amazon,
     circleColor: Colors.green,
     boxColor: Colors.blue,
 ),
  Stock(
    data: '+626%',
    label: 'Windows',
    logo: FontAwesomeIcons.windows,
    circleColor: Colors.white,
    boxColor: Colors.pink,
  ),
  Stock(
    data: '+726%',
    label: 'Facebook',
    logo: FontAwesomeIcons.facebook,
    circleColor: Colors.purple,
    boxColor: Colors.lightGreenAccent,
  ),
  Stock(
    data: '+826%',
    label: 'Apple',
    logo: FontAwesomeIcons.apple,
    circleColor: Colors.teal,
    boxColor: Colors.amberAccent,
  ),

];


List<Stock> following_stocks = [

  Stock(
    data: '+626%',
    label: 'Tesla',
    logo: FontAwesomeIcons.yandex,
    circleColor: Colors.green,
    boxColor: Colors.blue,
  ),
  Stock(
    data: '+326%',
    label: 'Yahoo',
    logo: FontAwesomeIcons.yahoo,
    circleColor: Colors.white,
    boxColor: Colors.pink,
  ),
  Stock(
    data: '+726%',
    label: 'Xing',
    logo: FontAwesomeIcons.xing,
    circleColor: Colors.purple,
    boxColor: Colors.lightGreenAccent,
  ),
  Stock(
    data: '+726%',
    label: 'Yinyang',
    logo: FontAwesomeIcons.yinYang,
    circleColor: Colors.teal,
    boxColor: Colors.amberAccent,
  ),

];





}
