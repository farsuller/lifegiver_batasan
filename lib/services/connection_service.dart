import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';

class ConnectionHelper {
  static ConnectivityResult _connectivityResult;

  Future connect() async {
    _connectivityResult = await Connectivity().checkConnectivity();
  }

  Future<bool> hasConnection() async {
    await connect();
    if (_connectivityResult == ConnectivityResult.mobile) {
      print("Connected to Mobile");
      return true;
    }
    if (_connectivityResult == ConnectivityResult.wifi) {
      print("Connected to Wifi");
      return true;
    }
    if (_connectivityResult == ConnectivityResult.none) print("No Internet");
    return false;
  }

  Stream<ConnectivityResult> connectionListener() {
    return Connectivity().onConnectivityChanged;
  }
}
