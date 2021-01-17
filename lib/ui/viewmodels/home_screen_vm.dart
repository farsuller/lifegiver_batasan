import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifegiver_batasan/locator.dart';
import 'package:lifegiver_batasan/services/authentication_service.dart';
import 'package:lifegiver_batasan/services/dialog_service.dart';


import 'base_model.dart';

class HomeViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
  locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();

  Future signOut() async {
    _authenticationService.signOutUser();
    Get.offNamed("/login");
    setBusy(false);
  }
}