import 'package:get_it/get_it.dart';
import 'package:vogu/core/contollers/specialist-crud.dart';

import './core/services/api.dart';

GetIt locator = GetIt();

void setupLocator() {
  // locator.registerLazySingleton(() => Api('specialist'));
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => SpecialistCRUD()) ;
}