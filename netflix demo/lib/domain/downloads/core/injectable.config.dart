// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../application/downloads/download/downloads_bloc.dart' as _i12;
import '../../../application/FastLaugh/fast_laugh_bloc.dart' as _i13;
import '../../../application/home/bloc/trending_bloc.dart' as _i11;
import '../../../application/hot_and_new/hot_and_new_bloc.dart' as _i14;
import '../../../application/search/search/search_bloc.dart' as _i15;
import '../../../infrastructure/downloads/downloads_repo.dart' as _i8;
import '../../../infrastructure/home/trending_response.dart' as _i6;
import '../../../infrastructure/new_and_hot.dart/hot_and_new_impl.dart' as _i4;
import '../../../infrastructure/search/search_impl.dart' as _i10;
import '../../home/i_trending_repo.dart' as _i5;
import '../../newandhot/new_and_hot_service.dart' as _i3;
import '../../search/model/search_service.dart' as _i9;
import '../i_downloads.dart' as _i7; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i3.HotAndNewService>(() => _i4.NewAndHotImplimentation());
  gh.lazySingleton<_i5.ITrendingRepo>(() => _i6.TrendingRepository());
  gh.lazySingleton<_i7.IdownloadsRepo>(() => _i8.Downloadsrepository());
  gh.lazySingleton<_i9.SearchService>(() => _i10.SearchImpl());
  gh.factory<_i11.TrendingBloc>(
      () => _i11.TrendingBloc(get<_i5.ITrendingRepo>()));
  gh.factory<_i12.DownloadsBloc>(
      () => _i12.DownloadsBloc(get<_i7.IdownloadsRepo>()));
  gh.factory<_i13.FastLaughBloc>(
      () => _i13.FastLaughBloc(get<_i7.IdownloadsRepo>()));
  gh.factory<_i14.HotAndNewBloc>(
      () => _i14.HotAndNewBloc(get<_i3.HotAndNewService>()));
  gh.factory<_i15.SearchBloc>(() => _i15.SearchBloc(
        get<_i7.IdownloadsRepo>(),
        get<_i9.SearchService>(),
      ));
  return get;
}
