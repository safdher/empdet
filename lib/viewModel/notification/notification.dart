import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:empdet/viewModel/base_model.dart';

class NotificationViewModel extends BaseModel {
  double size = 0.0;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  
  NotificationViewModel(){
    var initializationSettingsAndroid =
    const AndroidInitializationSettings('app_icon');
    var initializationSettingsIOs = const IOSInitializationSettings();
    var initSetttings = InitializationSettings(android: initializationSettingsAndroid,iOS: initializationSettingsIOs);
    flutterLocalNotificationsPlugin.initialize(initSetttings);
  }

}