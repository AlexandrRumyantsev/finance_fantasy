import 'package:dio/dio.dart';
import 'package:drift/native.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/data_source/database/database.dart';
import '../infrastructure/base/api.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  AppDatabase get database => AppDatabase(NativeDatabase.memory());

  @lazySingleton
  Dio get dio {
    API.initialize();
    return API.dio;
  }

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();
}
