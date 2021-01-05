import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lifegiver_batasan/managers/lifecycle_manager.dart';
import 'package:lifegiver_batasan/ui/router.dart';
import 'package:lifegiver_batasan/ui/screens/startup_view.dart';
import 'locator.dart';
import 'managers/dialog_manager.dart';
import 'services/dialog_service.dart';
import 'services/navigation_service.dart';



void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  // Register all the models and services before the app starts
  setupLocator();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LifeCycleManager(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          builder: (context, child) => Navigator(
            key: locator<DialogService>().dialogNavigationKey,
            onGenerateRoute: (settings) => MaterialPageRoute(
                builder: (context) => DialogManager(child: child)),
          ),
        navigatorKey: locator<NavigationService>().navigationKey,
        theme: ThemeData(
            primarySwatch: Colors.amber,
            appBarTheme: const AppBarTheme(
              color: Colors.white,
              textTheme: TextTheme(
                headline6: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 20.0,
                ),
              ),
            )),
        home: StartUpView(),
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
