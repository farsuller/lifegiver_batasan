
import 'package:flutter/material.dart';
import 'package:lifegiver_batasan/services/stoppable_service.dart';

class BackgroundFetchService extends StoppableService{
  @override
  void start(){
    super.start();
    print('BackgroundFetchService Stopped $serviceStopped');
  }

  @override
  void stop(){
    super.stop();
    print('BackgroundFetchService Stopped $serviceStopped');
  }
}