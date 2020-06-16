import 'package:get_it/get_it.dart';

import 'package:covid19/core/viewmodels/CRUDModelProduct.dart';
import 'package:covid19/core/viewmodels/CRUDModelDepartment.dart';

import 'package:covid19/core/services/apiProduct.dart';
import 'package:covid19/core/services/apiDepartment.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => ApiProduct('products'));
  locator.registerLazySingleton(() => CRUDModelProduct()) ;

  locator.registerLazySingleton(() => ApiDepartment('bolivia'));
  locator.registerLazySingleton(() => CRUDModelDepartment()) ;
}