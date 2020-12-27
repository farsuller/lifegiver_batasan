import 'package:flutter/material.dart';
import 'package:lifegiver_batasan/constants/route_names.dart';
import 'package:lifegiver_batasan/locator.dart';
import 'package:lifegiver_batasan/services/authentication_service.dart';
import 'package:lifegiver_batasan/services/dialog_service.dart';
import 'package:lifegiver_batasan/services/navigation_service.dart';

import 'base_model.dart';

class HomeViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
  locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future signOut() async {
    _authenticationService.signOutUser();
    setBusy(false);
  }
}