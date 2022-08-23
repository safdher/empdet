import 'dart:convert';

import 'package:empdet/helper/singleton.dart';
import 'package:empdet/model/employee.dart';
import 'package:empdet/services/dashboard.dart';
import 'package:flutter/widgets.dart';
import 'package:empdet/helper/config.dart';
import 'package:empdet/viewModel/base_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DashboardScreenViewModel extends BaseModel {
  double size = 0.0;
  List<Employee> employees = [];

  initilizeData() async{
    setBusy(true);
    List<Map<String, Object?>> data = await Singleton().isDbEmpty();
    if(data.isEmpty){
      // Call API Service
      if(!await Singleton().isConnected()){
        setBusy(false);
        Fluttertoast.showToast(msg: "Please connect internet!");
        return;
      }

      await DashboardService().fetchData();
      data = await Singleton().isDbEmpty();
    }

    for(var d in data){
      Map<String,dynamic> empData = jsonDecode(d["sync_data"] as String);
      dynamic img = null;
      if(empData["profile_image"] != null){
        img = await Singleton().getImage(empData["profile_image"]);
      }
      
      empData["profile_image"] = img;
      employees.add(Employee.fromJson(empData));
    }
    setBusy(false);
  }

  gotoDetails(int index) {
    Navigator.of(context).pushNamed(RoutePaths.empdetails,arguments: employees[index]);
  }
}
