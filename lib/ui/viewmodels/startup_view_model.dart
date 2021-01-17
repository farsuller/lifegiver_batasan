
import 'package:get/get.dart';
import 'package:lifegiver_batasan/locator.dart';
import 'package:lifegiver_batasan/services/authentication_service.dart';

import 'base_model.dart';

class StartUpViewModel extends BaseModel {
  final AuthenticationService _authenticationService = locator<AuthenticationService>();

  Future handleStartUpLogic() async {
    var hasLoggedInUser = await _authenticationService.isUserLoggedIn();

    if (hasLoggedInUser) {
      await Get.offNamed("/home");
    } else {
      await Get.offNamed("/login");
    }
  }
}
