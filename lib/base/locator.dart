
import 'package:get_it/get_it.dart';
import 'package:lifegiver_batasan/services/background_fetch_service.dart';
import 'package:lifegiver_batasan/services/connection_service.dart';
import 'package:lifegiver_batasan/services/location_service.dart';
import '../services/authentication_service.dart';
import '../services/firestore_service.dart';


GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => FirestoreService());
  locator.registerLazySingleton(() => LocationService());
  locator.registerLazySingleton(() => BackgroundFetchService());
  locator.registerLazySingleton(() => ConnectionHelper());
}
