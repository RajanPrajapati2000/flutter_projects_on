import 'package:flutter_project/models/stock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final dataProvider = Provider((ref) => DataProvider());

class DataProvider{


  List<Stock>  get stocks{
    return _stocks;
  }


List<Stock> _stocks = [


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
    data: '+426%',
    label: 'Bmw',
    logo: FontAwesomeIcons.car,
    circleColor: Colors.green,
    boxColor: Colors.blue,
  ),
  Stock(
    data: '+926%',
    label: 'Tesla',
    logo: FontAwesomeIcons.wizardsOfTheCoast,
    circleColor: Colors.white,
    boxColor: Colors.pink,
  ),
  Stock(
    data: '+1726%',
    label: 'Google',
    logo: FontAwesomeIcons.google,
    circleColor: Colors.purple,
    boxColor: Colors.lightGreenAccent,
  ),
  Stock(
    data: '+540%',
    label: 'Reliance',
    logo: FontAwesomeIcons.mobile,
    circleColor: Colors.teal,
    boxColor: Colors.amberAccent,
  ),

];






}
