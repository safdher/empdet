import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:empdet/helper/route_generator.dart';
import 'package:empdet/helper/utils/theme_notifer.dart';
import 'package:empdet/viewModel/notification/notification.dart';
import 'package:empdet/views/splash/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => NotificationViewModel()),
    ], child: const MyApp()));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'empdet',
            themeMode: themeProvider.themeMode,
            home: const SplashScreen(),
            onGenerateRoute: RouteGenerator.generateRoute,
          );
        },
      );
}
