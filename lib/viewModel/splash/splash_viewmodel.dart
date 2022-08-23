import 'dart:async';

import 'package:empdet/helper/singleton.dart';
import 'package:flutter/widgets.dart';
import 'package:empdet/helper/config.dart';
import 'package:empdet/viewModel/base_model.dart';

class SplashScreenViewModel extends BaseModel {
  double size = 0.0;

  initilizeData(){
    startTimer();
    Singleton().initDB();
  }

  gotoDashboard() {
    Navigator.of(context).pushNamedAndRemoveUntil(
        RoutePaths.dashboard, (Route<dynamic> route) => false);
  }

  startTimer(){
    Timer(const Duration(seconds: 3), (){
      gotoDashboard();
      print("dashboard");
    });
  }
}
