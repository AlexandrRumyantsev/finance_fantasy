import 'package:dio/dio.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';

import '../data/data_source/database/database.dart';
import '../infrastructure/base/api.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  AppDatabase get database => AppDatabase(NativeDatabase.memory());

  @lazySingleton
  Dio get dio => API.dio;
}
