import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RoutePaths {
  static const String dashboard = '/dashboard';
  static const String login = '/login';
  static const String empdetails = '/empdetails';
}


class ImageFile {
  static const String empdetLogo = "assets/images/empdet.png";
  static const String webncrafts = "assets/images/webandcrafts.png";
}

class ColorValues{
  static const Color baseColor = Color(0xff1070b2);
  static const Color white = Colors.white;
  static const Color darkGrey = Color.fromARGB(255, 49, 49, 49);
}

class FontSizeData{
  static const double h1 = 20;
  static const double h2 = 18;
  static const double h3 = 16;

  static const double p = 12;
}

class DateTimeFormat{
  static String dateTimeToStr(DateTime date){
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(date);
  }

  static DateTime strToDateTime(String str){
    return DateFormat('yyyy-MM-dd HH:mm:ss').parse(str);
  }
}