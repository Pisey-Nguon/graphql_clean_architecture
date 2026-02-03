import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/get_episode.dart';
import '../../domain/usecases/get_episodes.dart';
import 'episode_event.dart';
import 'episode_state.dart';

@injectable
class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  final GetEpisodes getEpisodes;
  final GetEpisode getEpisode;

  EpisodeBloc({
    required this.getEpisodes,
    required this.getEpisode,
  }) : super(EpisodeInitial()) {
    on<GetEpisodesEvent>(_onGetEpisodes);
    on<GetEpisodeEvent>(_onGetEpisode);
  }

  Future<void> _onGetEpisodes(
    GetEpisodesEvent event,
    Emitter<EpisodeState> emit,
  ) async {
    emit(EpisodeLoading());
    final result = await getEpisodes(GetEpisodesParams(page: event.page));
    result.fold(
      (failure) => emit(EpisodeError(message: failure.message)),
      (episodes) => emit(EpisodesLoaded(episodes: episodes)),
    );
  }

  Future<void> _onGetEpisode(
    GetEpisodeEvent event,
    Emitter<EpisodeState> emit,
  ) async {
    emit(EpisodeLoading());
    final result = await getEpisode(GetEpisodeParams(id: event.id));
    result.fold(
      (failure) => emit(EpisodeError(message: failure.message)),
      (episode) => emit(EpisodeLoaded(episode: episode)),
    );
  }
}
