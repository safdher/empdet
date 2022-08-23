import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:empdet/viewModel/Dashboard/dashboard_viewmodel.dart';
import 'package:empdet/views/Dashboard/dashboard_mobile.dart';
import 'package:empdet/views/base_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late DashboardScreenViewModel viewModel;

    
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
    return BaseWidget<DashboardScreenViewModel>(
        viewModel: DashboardScreenViewModel(),
        onModelReady: (viewModel) {
          this.viewModel = viewModel;
          this.viewModel.initilizeData();
        },
        child: ScreenTypeLayout.builder(
          mobile: (BuildContext context) {
            viewModel.context = context;
            return OrientationLayoutBuilder(
              portrait: (context) => DashboardMobile(),
              landscape: (context) => DashboardMobile(),
            );
          },
        ));
  }
}
