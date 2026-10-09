// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/api/auth_api.dart' as _i302;
import '../../features/auth/data/datasources/auth_datasource.dart' as _i495;
import '../../features/auth/data/datasources/auth_remote.dart' as _i466;
import '../../features/auth/data/datasources/local_data.dart' as _i235;
import '../../features/auth/data/repositories/repo_implementaion.dart' as _i378;
import '../../features/auth/domain/repositories/repo_contract.dart' as _i1059;
import '../../features/auth/domain/usecases/login_usecase.dart' as _i188;
import '../../features/auth/domain/usecases/register_usecase.dart' as _i941;
import '../../features/auth/domain/usecases/user_caching.dart' as _i532;
import '../../features/auth/presentation/cubit/auth_cubit.dart' as _i117;
import 'apiinject.dart' as _i687;
import 'secuer_data.dart' as _i329;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioInject = _$DioInject();
    final secuerData = _$SecuerData();
    gh.singleton<_i361.Dio>(() => dioInject.getDio);
    gh.singleton<_i558.FlutterSecureStorage>(() => secuerData.getscuerstroage);
    gh.factory<_i302.AuthApi>(() => _i302.AuthApi(gh<_i361.Dio>()));
    gh.factory<_i235.LocalData>(
      () => _i235.Datalocalimpl(
        flutterSecureStorage: gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.factory<_i495.AuthDatasource>(
      () => _i466.AuthRemote(authApi: gh<_i302.AuthApi>()),
    );
    gh.factory<_i1059.Authrepository>(
      () => _i378.AuthrepoImplemntation(
        authDatasource: gh<_i495.AuthDatasource>(),
        localData: gh<_i235.LocalData>(),
      ),
    );
    gh.factory<_i188.LoginUsecase>(
      () => _i188.LoginUsecase(authrepository: gh<_i1059.Authrepository>()),
    );
    gh.factory<_i941.RegisterUsecase>(
      () => _i941.RegisterUsecase(authrepository: gh<_i1059.Authrepository>()),
    );
    gh.factory<_i532.UserCaching>(
      () => _i532.UserCaching(authrepository: gh<_i1059.Authrepository>()),
    );
    gh.lazySingleton<_i117.AuthCubit>(
      () => _i117.AuthCubit(
        loginUsecase: gh<_i188.LoginUsecase>(),
        registerUsecase: gh<_i941.RegisterUsecase>(),
        userCaching: gh<_i532.UserCaching>(),
      ),
    );
    return this;
  }
}

class _$DioInject extends _i687.DioInject {}

class _$SecuerData extends _i329.SecuerData {}
