import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ui/screens/home/home_screen.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: HomeScreen(),
    );
  }
}
