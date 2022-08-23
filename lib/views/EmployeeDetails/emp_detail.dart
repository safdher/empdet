import 'package:empdet/model/employee.dart';
import 'package:empdet/viewModel/EmployeeDetails/emp_details_viewmodel.dart';
import 'package:empdet/views/EmployeeDetails/emp_detail_mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:empdet/views/base_widget.dart';

class EmpDetailsScreen extends StatefulWidget {
  late Employee emp;

  EmpDetailsScreen({Key? key,required this.emp}) : super(key: key);

  @override
  _EmpDetailsScreenState createState() => _EmpDetailsScreenState();
}

class _EmpDetailsScreenState extends State<EmpDetailsScreen> {
  late EmpDetailsScreenViewModel viewModel;

    
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
    return BaseWidget<EmpDetailsScreenViewModel>(
        viewModel: EmpDetailsScreenViewModel(),
        onModelReady: (viewModel) {
          this.viewModel = viewModel;
          this.viewModel.initilizeData(widget.emp);
        },
        child: ScreenTypeLayout.builder(
          mobile: (BuildContext context) {
            viewModel.context = context;
            return OrientationLayoutBuilder(
              portrait: (context) => EmpDetailsMobile(),
              landscape: (context) => EmpDetailsMobile(),
            );
          },
        ));
  }
}
