import 'package:equatable/equatable.dart';

class EpisodeCharacter extends Equatable {
  final String id;
  final String name;
  final String image;

  const EpisodeCharacter({
    required this.id,
    required this.name,
    required this.image,
  });

  @override
  List<Object?> get props => [id, name, image];
}

class Episode extends Equatable {
  final String id;
  final String name;
  final String airDate;
  final String episode;
  final List<EpisodeCharacter> characters;

  const Episode({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
    this.characters = const [],
  });

  @override
  List<Object?> get props => [id, name, airDate, episode, characters];
}
