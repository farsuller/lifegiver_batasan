import 'package:flutter/widgets.dart';
import 'package:lifegiver_batasan/locator.dart';
import 'package:lifegiver_batasan/models/batasan_user.dart';
import 'package:lifegiver_batasan/services/authentication_service.dart';

class BaseModel extends ChangeNotifier {

  final AuthenticationService _authenticationService =
  locator<AuthenticationService>();

  BatasanUser get currentUser => _authenticationService.currentUser;

  bool _busy = false;
  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
