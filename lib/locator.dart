import 'package:covid19/core/services/apiLaboratorio.dart';
import 'package:covid19/core/viewmodels/CRUDModelLaboratorio.dart';
import 'package:get_it/get_it.dart';

import 'package:covid19/core/viewmodels/CRUDModelProduct.dart';
import 'package:covid19/core/viewmodels/CRUDModelDepartment.dart';
import 'package:covid19/core/viewmodels/CRUDModelNoticias.dart';

import 'package:covid19/core/services/apiProduct.dart';
import 'package:covid19/core/services/apiDepartment.dart';
import 'package:covid19/core/services/apiNoticias.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => ApiProduct('products'));
  locator.registerLazySingleton(() => CRUDModelProduct()) ;

  locator.registerLazySingleton(() => ApiDepartment('bolivia'));
  locator.registerLazySingleton(() => CRUDModelDepartment()) ;

  locator.registerLazySingleton(() => ApiNoticias('noticias'));
  locator.registerLazySingleton(() => CRUDModelNoticias()) ;

  locator.registerLazySingleton(() => ApiLaboratorio('laboratorios'));
  locator.registerLazySingleton(() => CRUDModelLaboratorio()) ;
}