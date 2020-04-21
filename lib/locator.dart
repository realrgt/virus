import 'package:get_it/get_it.dart';
import 'package:vogu/core/contollers/client-crud.dart';
import 'package:vogu/core/contollers/service-crud.dart';
import 'package:vogu/core/contollers/specialist-crud.dart';
import 'package:vogu/core/contollers/task_crud.dart';
import 'package:vogu/core/models/service.dart';
import 'package:vogu/core/services/api.dart';
import 'package:vogu/models/categories-services.dart';

GetIt locator = GetIt();

void setupLocator() {
  // locator.registerLazySingleton(() => Api('specialist'));
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => SpecialistCRUD());
  locator.registerLazySingleton(() => ClientCRUD());
  locator.registerLazySingleton(() => TaskCRUD());
  locator.registerLazySingleton(() => ServiceCRUD());
  locator.registerLazySingleton(() => Service());
  locator.registerLazySingleton(() => Servico());
}