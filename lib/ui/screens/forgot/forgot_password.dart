import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ForgotPasswordScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: Center(
          child: Text("Forgot Password Screen"),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    Get.offNamed("/login",);
  }
}