import 'package:equatable/equatable.dart';
import '../../domain/entities/episode.dart';

abstract class EpisodeState extends Equatable {
  const EpisodeState();

  @override
  List<Object?> get props => [];
}

class EpisodeInitial extends EpisodeState {}

class EpisodeLoading extends EpisodeState {}

class EpisodesLoaded extends EpisodeState {
  final List<Episode> episodes;

  const EpisodesLoaded({required this.episodes});

  @override
  List<Object?> get props => [episodes];
}

class EpisodeLoaded extends EpisodeState {
  final Episode episode;

  const EpisodeLoaded({required this.episode});

  @override
  List<Object?> get props => [episode];
}

class EpisodeError extends EpisodeState {
  final String message;

  const EpisodeError({required this.message});

  @override
  List<Object?> get props => [message];
}
