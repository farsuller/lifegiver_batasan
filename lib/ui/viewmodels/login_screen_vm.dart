
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:lifegiver_batasan/base/locator.dart';
import 'package:lifegiver_batasan/services/authentication_service.dart';
import 'base_model.dart';
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
        Get.toNamed("/home");
      } else {
        Get.defaultDialog(
            title: 'General',
            radius: 5.0,
            middleText: 'General login failure. Please try again later',);
      }
    } else {
       Get.defaultDialog(title: 'Login Failure',
          radius: 5.0,
          middleText: result,
          actions: [
            RaisedButton(
              onPressed: ()=>Get.back(),
              child: Text("OK",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.black,)
          ],
          );
    }
  }

  void navigateToSignUp() {
    Get.offNamed("/signUp");
  }
}
