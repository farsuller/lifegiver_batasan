
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:lifegiver_batasan/locator.dart';
import 'package:lifegiver_batasan/services/authentication_service.dart';
import 'package:lifegiver_batasan/services/dialog_service.dart';
import 'base_model.dart';

class LoginViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();

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
        await _dialogService.showDialog(
          title: 'Login Failure',
          description: 'General login failure. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Login Failure',
        description: result,
      );
    }
  }

  void navigateToSignUp() {
    Get.offNamed("/signUp");
   // _navigationService.navigateTo(SignUpViewRoute);
  }
}
