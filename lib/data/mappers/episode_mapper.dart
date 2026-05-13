import '../../domain/entities/episode.dart';
import '../graphql/__generated__/get_episode.graphql.dart';
import '../graphql/__generated__/get_episodes.graphql.dart';

extension GetEpisodeMapper on Query$GetEpisode$episode {
  Episode toEntity() {
    return Episode(
      id: id,
      name: name,
      airDate: air_date,
      episode: episode,
    );
  }
}

extension GetEpisodesMapper on Query$GetEpisodes$episodes$results {
  Episode toEntity() {
    return Episode(
      id: id,
      name: name,
      airDate: air_date,
      episode: episode,
    );
  }
}