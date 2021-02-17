
import 'package:get/get.dart';
import 'package:lifegiver_batasan/base/locator.dart';
import 'package:lifegiver_batasan/services/authentication_service.dart';
import 'package:lifegiver_batasan/services/firestore_service.dart';



import '../../../../base/base_model.dart';

class HomeViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
  locator<AuthenticationService>();

  final FirestoreService _firestoreService = locator<FirestoreService>();

  var _announcements;
  List<String> get announcements => _announcements;
  void listenAnnouncement(){
    setBusy(true);

    _firestoreService.listenAnnouncementImages().listen((event) {
      _announcements = event;
      setBusy(false);
    });
  }

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