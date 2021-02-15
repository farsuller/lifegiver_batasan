
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lifegiver_batasan/managers/lifecycle_manager.dart';
import 'package:lifegiver_batasan/ui/screens/errors/1_no_connection.dart';
import 'package:lifegiver_batasan/ui/screens/forgot/forgot_password.dart';
import 'package:lifegiver_batasan/ui/screens/home/home_screen.dart';
import 'base/locator.dart';
import 'constants/check_build_flavor.dart';
import 'helper/ui_helper.dart';
import 'ui/screens/home/profile/lifegroup/camera_screen.dart';
import 'ui/screens/home/profile/lifegroup/lifegroup_screen.dart';
import 'ui/screens/home/profile/satelife/satelife_profile.dart';
import 'ui/screens/home/profile/sunday_service/sunday_service_profile_screen.dart';
import 'ui/screens/login/login_screen.dart';
import 'ui/screens/signup/signup_screen.dart';
import 'ui/screens/startup_view.dart';

bool useFireStoreEmulator = false;

void main() async {
  BuildFlavor.checkDebugMode();
  WidgetsFlutterBinding.ensureInitialized();

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
        defaultTransition: Transition.fadeIn,
        debugShowCheckedModeBanner: BuildFlavor.isDebug,
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
          GetPage(name: "/forgotPassword", page: () => ForgotPasswordScreen()),
          GetPage(name: "/home", page: () => HomeScreen()),
          GetPage(name: "/service_profile", page: () => SundayServiceProfileScreen()),
          GetPage(name: "/lifegroup_profile", page: () => LifegroupProfileScreen()),
          GetPage(name: "/satelife_profile", page: () => SatelifeProfileScreen()),
          GetPage(name: "/detector_camera", page: () => CameraScreen()),
          GetPage(name: "/noConnection", page: () => NoConnectionScreen()),
        ],
        initialRoute: "/startView",
      ),
    );
  }
}


