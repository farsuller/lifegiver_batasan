
import 'package:get/get.dart';
import 'package:lifegiver_batasan/base/locator.dart';
import 'package:lifegiver_batasan/services/authentication_service.dart';



import '../../../../base/base_model.dart';

class HomeViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
  locator<AuthenticationService>();


  Future signOut() async {
    _authenticationService.signOutUser();
    Get.offNamed("/login");
    setBusy(false);
  }

  Future navigateToLifegroupProfile() async {
    Get.toNamed("/lifegroup_profile");

    setBusy(false);
  }
  Future navigateToServiceProfile() async {
    Get.toNamed("/service_profile");
    setBusy(false);
  }
    Future navigateToSatelifeProfile() async {
      Get.toNamed("/satelife_profile");
      setBusy(false);
    }
}