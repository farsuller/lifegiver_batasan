
import 'package:get/get.dart';
import 'file:///C:/Users/Service%20Unit/Desktop/FlutterProjects/lifegiver_batasan/lib/base/locator.dart';
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
