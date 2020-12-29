
import 'package:get_it/get_it.dart';
import 'package:lifegiver_batasan/services/background_fetch_service.dart';
import 'package:lifegiver_batasan/services/location_service.dart';
import 'services/authentication_service.dart';
import 'services/dialog_service.dart';
import 'services/firestore_service.dart';
import 'services/navigation_service.dart';


GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => FirestoreService());
  locator.registerLazySingleton(() => LocationService());
  locator.registerLazySingleton(() => BackgroundFetchService());
}
