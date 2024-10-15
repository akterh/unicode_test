// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:unicode_test_app/core/app/app_dependency.dart' as _i681;
import 'package:unicode_test_app/core/app/app_preference.dart' as _i979;
import 'package:unicode_test_app/data/network/api_client.dart' as _i513;
import 'package:unicode_test_app/features/screens/theme/theme_cubit.dart'
    as _i316;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.factory<_i979.AppPreferences>(() => _i979.AppPreferences());
  await gh.factoryAsync<_i460.SharedPreferences>(
    () => appModule.prefs,
    preResolve: true,
  );
  gh.factory<_i361.Dio>(() => appModule.dio);
  gh.factory<_i316.ThemeCubit>(() => _i316.ThemeCubit());
  gh.factory<_i513.ApiClient>(() => _i513.ApiClient(gh<_i361.Dio>()));
  return getIt;
}

class _$AppModule extends _i681.AppModule {}
