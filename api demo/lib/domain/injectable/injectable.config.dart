// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../applications/bloc/trending_bloc.dart' as _i5;
import '../../constant/trending_repository.dart' as _i4;
import '../i_trending_repo.dart' as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.ITrendingRepo>(() => _i4.TrendingRepository());
  gh.factory<_i5.TrendingBloc>(
      () => _i5.TrendingBloc(get<_i3.ITrendingRepo>()));
  return get;
}
