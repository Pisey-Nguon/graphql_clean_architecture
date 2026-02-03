// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/datasources/character_remote_data_source.dart' as _i765;
import '../../data/datasources/episode_remote_data_source.dart' as _i697;
import '../../data/datasources/location_remote_data_source.dart' as _i458;
import '../../data/repositories/character_repository_impl.dart' as _i1071;
import '../../data/repositories/episode_repository_impl.dart' as _i990;
import '../../data/repositories/location_repository_impl.dart' as _i553;
import '../../domain/repositories/character_repository.dart' as _i863;
import '../../domain/repositories/episode_repository.dart' as _i264;
import '../../domain/repositories/location_repository.dart' as _i816;
import '../../domain/usecases/get_character.dart' as _i530;
import '../../domain/usecases/get_characters.dart' as _i606;
import '../../domain/usecases/get_episode.dart' as _i404;
import '../../domain/usecases/get_episodes.dart' as _i24;
import '../../domain/usecases/get_location.dart' as _i441;
import '../../domain/usecases/get_locations.dart' as _i863;
import '../../presentation/bloc/character_bloc.dart' as _i129;
import '../../presentation/bloc/episode_bloc.dart' as _i779;
import '../../presentation/bloc/location_bloc.dart' as _i678;
import '../network/graphql_client.dart' as _i788;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i788.GraphQLClientService>(
      () => _i788.GraphQLClientService(),
    );
    gh.lazySingleton<_i458.LocationRemoteDataSource>(
      () =>
          _i458.LocationRemoteDataSourceImpl(gh<_i788.GraphQLClientService>()),
    );
    gh.lazySingleton<_i765.CharacterRemoteDataSource>(
      () =>
          _i765.CharacterRemoteDataSourceImpl(gh<_i788.GraphQLClientService>()),
    );
    gh.lazySingleton<_i697.EpisodeRemoteDataSource>(
      () => _i697.EpisodeRemoteDataSourceImpl(gh<_i788.GraphQLClientService>()),
    );
    gh.lazySingleton<_i816.LocationRepository>(
      () => _i553.LocationRepositoryImpl(gh<_i458.LocationRemoteDataSource>()),
    );
    gh.lazySingleton<_i863.CharacterRepository>(
      () =>
          _i1071.CharacterRepositoryImpl(gh<_i765.CharacterRemoteDataSource>()),
    );
    gh.lazySingleton<_i264.EpisodeRepository>(
      () => _i990.EpisodeRepositoryImpl(gh<_i697.EpisodeRemoteDataSource>()),
    );
    gh.factory<_i404.GetEpisode>(
      () => _i404.GetEpisode(gh<_i264.EpisodeRepository>()),
    );
    gh.factory<_i24.GetEpisodes>(
      () => _i24.GetEpisodes(gh<_i264.EpisodeRepository>()),
    );
    gh.factory<_i441.GetLocation>(
      () => _i441.GetLocation(gh<_i816.LocationRepository>()),
    );
    gh.factory<_i863.GetLocations>(
      () => _i863.GetLocations(gh<_i816.LocationRepository>()),
    );
    gh.lazySingleton<_i530.GetCharacter>(
      () => _i530.GetCharacter(gh<_i863.CharacterRepository>()),
    );
    gh.lazySingleton<_i606.GetCharacters>(
      () => _i606.GetCharacters(gh<_i863.CharacterRepository>()),
    );
    gh.factory<_i129.CharacterBloc>(
      () => _i129.CharacterBloc(
        getCharactersUseCase: gh<_i606.GetCharacters>(),
        getCharacterUseCase: gh<_i530.GetCharacter>(),
      ),
    );
    gh.factory<_i779.EpisodeBloc>(
      () => _i779.EpisodeBloc(
        getEpisodes: gh<_i24.GetEpisodes>(),
        getEpisode: gh<_i404.GetEpisode>(),
      ),
    );
    gh.factory<_i678.LocationBloc>(
      () => _i678.LocationBloc(
        getLocations: gh<_i863.GetLocations>(),
        getLocation: gh<_i441.GetLocation>(),
      ),
    );
    return this;
  }
}
