import 'package:empdet/model/employee.dart';
import 'package:flutter/material.dart';
import 'package:empdet/viewModel/base_model.dart';

class EmpDetailsScreenViewModel extends BaseModel {
  double size = 0.0;
  late Employee emp;

  initilizeData(Employee data){
    emp = data;
    notifyListeners();
  }
}
