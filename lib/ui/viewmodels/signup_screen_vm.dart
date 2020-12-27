
import 'package:flutter/foundation.dart';
import 'package:lifegiver_batasan/constants/route_names.dart';
import 'package:lifegiver_batasan/locator.dart';
import 'package:lifegiver_batasan/services/authentication_service.dart';
import 'package:lifegiver_batasan/services/dialog_service.dart';
import 'package:lifegiver_batasan/services/navigation_service.dart';

import 'base_model.dart';

class SignUpViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  String _selectedLifegroup = 'Select Lifegroup';
  String _selectedLeader = 'Select Lifegroup Leader';
  String get selectedLifegroup => _selectedLifegroup;
  String get selectedLeader => _selectedLeader;
  void setSelectedLifeGroup(dynamic lifegroup) {
    _selectedLifegroup = lifegroup;
    notifyListeners();
  }

  void setSelectedLeader(dynamic leader){
    _selectedLeader = leader;
    notifyListeners();
  }

  Future signUp({
    @required String email,
    @required String password,
    @required String fullName,
  }) async {
    setBusy(true);

    var result = await _authenticationService.signUpWithEmail(
        email: email,
        password: password,
        fullName: fullName,
        role: null);

    setBusy(false);

    if (result is bool) {
      if (result) {
        _navigationService.navigateTo(HomeViewRoute);
      } else {
        await _dialogService.showDialog(
          title: 'Sign Up Failure',
          description: 'General sign up failure. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Sign Up Failure',
        description: result,
      );
    }
  }
}
