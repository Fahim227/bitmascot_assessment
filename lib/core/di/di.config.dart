// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bitmascot_assessment/core/network/network_client.dart'
    as _i1063;
import 'package:bitmascot_assessment/core/network/private_network_client.dart'
    as _i285;
import 'package:bitmascot_assessment/features/login/domain/use_case/login_usecase.dart'
    as _i85;
import 'package:bitmascot_assessment/features/login/presentation/bloc/login_cubit.dart'
    as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i85.LoginUseCase>(() => _i85.LoginUseCase());
    gh.singleton<_i1063.NetworkClient>(() => _i285.PrivateNetworkClient());
    gh.factory<_i59.LoginCubit>(() => _i59.LoginCubit(gh<_i85.LoginUseCase>()));
    return this;
  }
}
