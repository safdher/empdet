
import 'package:flutter/material.dart';
import 'package:empdet/helper/config.dart';
import 'package:empdet/helper/utils/screen_layout.dart';
import 'package:empdet/viewModel/splash/splash_viewmodel.dart';
import 'package:empdet/views/base_model_widget.dart';

// ignore: must_be_immutable
class SplashMobile extends BaseModelWidget<SplashScreenViewModel> {
  SplashScreenViewModel model = SplashScreenViewModel();
  late BuildContext context;

  SplashMobile({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context, SplashScreenViewModel model) {
    this.context = context;
    this.model = model;
    QSize().init(context);
    return initializeUI();
  }

  Widget initializeUI() {
    return Container(
      color: Colors.white,
      width: QSize.screenWidth,
      height: QSize.screenHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        Expanded(
          child: SizedBox(
            width: QSize.screenWidth * 0.3,
            child: Image.asset(ImageFile.empdetLogo),
          ),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 20),
          width: QSize.screenWidth * .2,
          child: Image.asset(ImageFile.webncrafts),
        )
      ]),
    );
  }
}
