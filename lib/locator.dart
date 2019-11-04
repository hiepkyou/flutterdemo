import 'package:flutter_kyou_app/services/api.dart';
import 'models/crud_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => Api('products'));
  locator.registerLazySingleton(() => CrudModel()) ;
}