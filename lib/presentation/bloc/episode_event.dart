import 'package:equatable/equatable.dart';

abstract class EpisodeEvent extends Equatable {
  const EpisodeEvent();

  @override
  List<Object?> get props => [];
}

class GetEpisodesEvent extends EpisodeEvent {
  final int page;

  const GetEpisodesEvent({required this.page});

  @override
  List<Object?> get props => [page];
}

class GetEpisodeEvent extends EpisodeEvent {
  final String id;

  const GetEpisodeEvent({required this.id});

  @override
  List<Object?> get props => [id];
}
