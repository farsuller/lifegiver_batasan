
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'file:///C:/Users/Service%20Unit/Desktop/FlutterProjects/lifegiver_batasan/lib/base/locator.dart';
import 'package:lifegiver_batasan/services/authentication_service.dart';
import 'package:flutter/material.dart';
import '../../../../base/base_model.dart';

class SignUpViewModel extends BaseModel {
  final AuthenticationService _authenticationService = locator<AuthenticationService>();

  // ignore: missing_return
  Future<bool> onBackPressed() {
     Get.offNamed("/login");
  }

  Future signUp({
    @required String email,
    @required String password,
  }) async {
    setBusy(true);

    var result = await _authenticationService.signUpWithEmail(
        email: email,
        password: password,);

    setBusy(false);

    if (result is bool) {
      if (result) {
        //when signUp is success
        Get.offNamed("/home");
      } else {
        Get.defaultDialog(
          title: 'Sign Up Failure',
          radius: 5.0,
          middleText: 'General sign up failure. Please try again later',
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
    } else {
      Get.defaultDialog(
        title: 'Sign Up Failure',
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
}
