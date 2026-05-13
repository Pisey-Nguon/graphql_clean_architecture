import '../../domain/entities/episode.dart';
import '../graphql/get_episode.graphql.dart';
import '../graphql/__generated__/get_episodes.graphql.dart';

extension GetEpisodeMapper on Query$GetEpisode$episode {
  Episode toEntity() {
    return Episode(
      id: id,
      name: name,
      airDate: air_date,
      episode: episode,
      characters: (characters ?? [])
          .whereType<Query$GetEpisode$episode$characters>()
          .map((character) => character.toEntity())
          .toList(),
    );
  }
}

extension GetEpisodeCharacterMapper on Query$GetEpisode$episode$characters {
  EpisodeCharacter toEntity() {
    return EpisodeCharacter(id: id, name: name, image: image);
  }
}

extension GetEpisodesMapper on Query$GetEpisodes$episodes$results {
  Episode toEntity() {
    return Episode(
      id: id,
      name: name,
      airDate: air_date,
      episode: episode,
      characters: const [],
    );
  }
}
