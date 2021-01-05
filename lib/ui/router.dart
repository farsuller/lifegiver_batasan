
import 'package:flutter/material.dart';
import 'package:lifegiver_batasan/constants/route_names.dart';
import 'package:lifegiver_batasan/ui/screens/home/home_screen.dart';
import 'file:///C:/Users/Service%20Unit/Desktop/FlutterProjects/lifegiver_batasan/lib/ui/screens/login_screen.dart';
import 'file:///C:/Users/Service%20Unit/Desktop/FlutterProjects/lifegiver_batasan/lib/ui/screens/signup_screen.dart';
import 'package:lifegiver_batasan/ui/screens/profile/sunday_service_profile_screen.dart';


Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: LoginView(),
      );
    case SignUpViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SignUpView(),
      );
    case HomeViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: HomeScreen(),
      );
    case ProfileViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SundayServiceProfileScreen(),
      );
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}
