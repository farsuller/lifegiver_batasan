import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:lifegiver_batasan/base/locator.dart';
import 'package:lifegiver_batasan/services/authentication_service.dart';
import '../../../../base/base_model.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();


  Future login({
    @required String email,
    @required String password,
  }) async {
    setBusy(true);

    var result = await _authenticationService.loginWithEmail(
      email: email,
      password: password,
    );

    setBusy(false);

    if (result is bool) {
      if (result) {
        Get.offNamed("/home");
      } else {
        Get.defaultDialog(
          title: 'General',
          radius: 5.0,
          middleText: 'General login failure. Please try again later',
        );
      }
    } else {
      Get.defaultDialog(
        title: 'Login Failure',
        radius: 5.0,
        middleText: result,
        actions: [
          RaisedButton(
            onPressed: () => Get.back(),
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.black,
          )
        ],
      );
    }
  }
  // Reset Password
  Future sendResetPassword({
    @required String email,
  }) async {
    setBusy(true);

    if (email.isEmail) {
      setBusy(false);

        Get.defaultDialog(
          title: 'Forgot Password Success',
          radius: 5.0,
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children:[
              Image.asset('assets/images/email_image.png',height: 170,),
              Text('Check your email to reset your password')]),
          ),
          actions: [
            RaisedButton(
              onPressed: () => Get.back(),
              child: Text(
                "OK",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.black,
            )
          ],
        );
      return _authenticationService.sendPasswordResetEmail(email);
    } else {
      Get.defaultDialog(
        title: 'Forgot Password',
        radius: 5.0,
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children:[
            Image.asset('assets/images/email_image.png',height: 170,),
            Text('Email format is not valid')]),
        ),
        actions: [
          RaisedButton(
            onPressed: () => Get.back(),
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.black,
          )
        ],
      );
    }

  }

  Future<bool> onBackPressed() {
    Get.offNamed("/login");
  }
  void navigateToSignUp() {
    Get.offNamed("/signUp");
  }

  void navigateToForgotPassword() {
    Get.offNamed("/forgotPassword");
  }
}
