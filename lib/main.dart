import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lifegiver_batasan/managers/lifecycle_manager.dart';
import 'package:lifegiver_batasan/ui/screens/home/home_screen.dart';
import 'package:lifegiver_batasan/ui/screens/login_screen.dart';
import 'package:lifegiver_batasan/ui/screens/profile/sunday_service/sunday_service_profile_screen.dart';
import 'package:lifegiver_batasan/ui/screens/signup_screen.dart';
import 'package:lifegiver_batasan/ui/screens/startup_view.dart';
import 'locator.dart';
import 'ui/screens/profile/lifegroup/camera_screen.dart';
import 'ui/screens/profile/lifegroup/lifegroup_screen.dart';
import 'ui/screens/profile/satelife/satelife_profile.dart';

bool useFireStoreEmulator = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Register all the models and services before the app starts
  await Firebase.initializeApp();
  if (useFireStoreEmulator) {
    FirebaseFirestore.instance.settings = Settings(
        host: 'localhost:8080', sslEnabled: false, persistenceEnabled: false);
  }
  setupLocator();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
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
        getPages: [
          GetPage(name: "/startView", page: () => StartUpView()),
          GetPage(name: "/login", page: () => LoginView()),
          GetPage(name: "/signUp", page: () => SignUpView()),
          GetPage(name: "/home", page: () => HomeScreen()),
          GetPage(name: "/service_profile", page: () => SundayServiceProfileScreen()),
          GetPage(name: "/lifegroup_profile", page: () => LifegroupProfileScreen()),
          GetPage(name: "/satelife_profile", page: () => SatelifeProfileScreen()),
          GetPage(name: "/detector_camera", page: () => CameraScreen())
        ],
        initialRoute: "/startView",
      ),
    );
  }
}
