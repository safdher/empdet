import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:empdet/viewModel/notification/notification.dart';
import 'package:empdet/viewModel/splash/splash_viewmodel.dart';
import 'package:empdet/views/base_widget.dart';
import 'package:empdet/views/splash/splash_mobile.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SplashScreenViewModel viewModel;

    
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<SplashScreenViewModel>(
        viewModel: SplashScreenViewModel(),
        onModelReady: (viewModel) {
          this.viewModel = viewModel;
          this.viewModel.initilizeData();
        },
        child: ScreenTypeLayout.builder(
          mobile: (BuildContext context) {
            viewModel.context = context;
            return OrientationLayoutBuilder(
              portrait: (context) => SplashMobile(),
              landscape: (context) => SplashMobile(),
            );
          },
        ));
  }
}
