import 'package:flutter/material.dart';
import 'package:lifegiver_batasan/constants/route_names.dart';
import 'package:lifegiver_batasan/locator.dart';
import 'package:lifegiver_batasan/models/lifegroup.dart';
import 'package:lifegiver_batasan/models/profile.dart';
import 'package:lifegiver_batasan/services/dialog_service.dart';
import 'package:lifegiver_batasan/services/firestore_service.dart';
import 'package:lifegiver_batasan/services/navigation_service.dart';
import 'package:lifegiver_batasan/ui/viewmodels/base_model.dart';


class ProfileViewModel extends BaseModel{

  final FirestoreService _firestoreService = locator<FirestoreService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Profile _setupProfile;

  bool get _profiling => _setupProfile != null;

  String _selectedLifegroup = 'Select Lifegroup';
  String _selectedLeader = 'Select Lifegroup Leader';
  String _selectedNetwork = 'Select Network';
  String _selectedPlatform = 'Select Platform';

  String get selectedLifegroup => _selectedLifegroup;
  String get selectedLeader => _selectedLeader;
  String get selectedNetwork => _selectedNetwork;
  String get selectedPlatform => _selectedPlatform;

  var _leaders;
  List<String> get leaders => _leaders;

  var _lifegroup;
  List<dynamic> get lifegroup => _lifegroup;

  var _network;
  List<String> get network => _network;

  bool doneSetup = false;
  void listenToData() {
    setBusy(true);

    _firestoreService.listenLeadersData().listen((leadersData) {
      _leaders = leadersData;
     setBusy(false);
    });

    _firestoreService.listenLifegroupData().listen((lifegroupData) {
        _lifegroup = lifegroupData;
     setBusy(false);
    });

    _firestoreService.listenNetworkData().listen((network) {
      _network = network;
      setBusy(false);
    });
  }

  void setSelectedLifeGroup(dynamic lifegroup) {
    _selectedLifegroup = lifegroup;
    notifyListeners();
  }

  void setSelectedLeader(dynamic leader){
    _selectedLeader = leader;
    notifyListeners();
  }

  void setSelectedNetwork(dynamic network) {
    _selectedNetwork = network;
    notifyListeners();
  }

  void setSelectedPlatform(dynamic platform){
    _selectedPlatform = platform;
    notifyListeners();
  }


  Future completeProfile({
    @required String fullname,
    @required String leader,
    @required String lifegroup,
    @required String network,
    @required String platform,
  }) async {
    setBusy(true);

    var result;
    if (!_profiling) {
      result = await _firestoreService.completeProfile(Profile(fullName: fullname,
          leader: leader,
          lifegroup:lifegroup,
          network: network,
          platform: platform,
          userId: currentUser.id,
          documentId: null));
    } else {
      result = await _firestoreService.updateProfile(Profile(
        fullName: fullname,
        leader: leader,
        lifegroup: lifegroup,
        network: network,
        platform: platform,
        userId: _setupProfile.userId,
        documentId: _setupProfile.documentId,
      ));
    }

    setBusy(false);

    if (result is String) {
      await _dialogService.showDialog(
        title: 'Cound not create User Profile',
        description: result,
      );
    } else {
      await _dialogService.showDialog(
        title: 'User Profile',
        description: 'Your profile has been created for immediate report.',
      );
    }

    _navigationService.navigateTo(HomeViewRoute);
  }

  void setProfileSetup(Profile profileSetup) {
    _setupProfile = profileSetup;
  }
}
