import 'package:empdet/model/employee.dart';
import 'package:empdet/views/EmployeeDetails/emp_detail.dart';
import 'package:flutter/material.dart';
import 'package:empdet/helper/config.dart';
import 'package:empdet/views/Dashboard/dashboard.dart';
import 'package:empdet/views/splash/splash.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case RoutePaths.login:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RoutePaths.dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case RoutePaths.empdetails:
        Employee emp = args as Employee;
        return MaterialPageRoute(builder: (_) => EmpDetailsScreen(emp: emp,));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
