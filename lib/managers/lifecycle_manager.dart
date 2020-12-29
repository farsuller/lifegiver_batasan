import 'package:flutter/material.dart';
import 'package:lifegiver_batasan/locator.dart';
import 'package:lifegiver_batasan/services/background_fetch_service.dart';
import 'package:lifegiver_batasan/services/location_service.dart';
import 'package:lifegiver_batasan/services/stoppable_service.dart';


class LifeCycleManager extends StatefulWidget{

  final Widget child;
  LifeCycleManager({Key key, this.child}): super (key: key);

  @override
  _LifeCycleManagerState createState() => _LifeCycleManagerState();
}

class _LifeCycleManagerState extends State<LifeCycleManager> with WidgetsBindingObserver {

  List<StoppableService> servicesToManage = [
    locator<LocationService>(),
    locator<BackgroundFetchService>(),
  ];
  @override
  Widget build(BuildContext context) {
   return widget.child;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state){
    super.didChangeAppLifecycleState(state);
    servicesToManage.forEach((service){
      if(state == AppLifecycleState.resumed){
        service.start();
      }
      else{
        service.stop();
      }
    });
  }
}