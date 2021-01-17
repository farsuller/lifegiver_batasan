import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lifegiver_batasan/managers/lifecycle_manager.dart';
import 'package:lifegiver_batasan/ui/screens/home/home_screen.dart';
import 'package:lifegiver_batasan/ui/screens/login_screen.dart';
import 'package:lifegiver_batasan/ui/screens/profile/sunday_service_profile_screen.dart';
import 'package:lifegiver_batasan/ui/screens/signup_screen.dart';
import 'package:lifegiver_batasan/ui/screens/startup_view.dart';
import 'locator.dart';
import 'managers/dialog_manager.dart';
import 'services/dialog_service.dart';



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
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
          builder: (context, child) => Navigator(
            key: locator<DialogService>().dialogNavigationKey,
            onGenerateRoute: (settings) => MaterialPageRoute(
                builder: (context) => DialogManager(child: child)),
          ),
        theme: ThemeData(
            primarySwatch: Colors.amber,
            appBarTheme: const AppBarTheme(color: Colors.white,
              textTheme: TextTheme(
                headline6: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 20.0,
                ),
              ),
            )),
        getPages: [
          GetPage(name: "/startView", page: ()=>StartUpView()),
          GetPage(name: "/login", page: ()=>LoginView()),
          GetPage(name: "/signUp", page: ()=>SignUpView()),
          GetPage(name: "/home", page: ()=>HomeScreen()),
          GetPage(name: "/sunday_service_profile", page: ()=>SundayServiceProfileScreen())
        ],
        initialRoute: "startView",

      ),
    );
  }
}
