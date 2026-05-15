import 'package:injectable/injectable.dart';
import '../../core/error/exceptions.dart';
import '../../core/network/graphql_client.dart';
import '../../domain/entities/episode.dart';
import '../graphql/__generated__/get_episode.graphql.dart';
import '../graphql/__generated__/get_episodes.graphql.dart';
import '../mappers/episode_mapper.dart';

abstract class EpisodeRemoteDataSource {
  Future<List<Episode>> getEpisodes({required int page});
  Future<Episode> getEpisode({required String id});
}

@LazySingleton(as: EpisodeRemoteDataSource)
class EpisodeRemoteDataSourceImpl implements EpisodeRemoteDataSource {
  final GraphQLClientService graphQLClient;

  EpisodeRemoteDataSourceImpl(this.graphQLClient);

  @override
  Future<List<Episode>> getEpisodes({required int page}) async {
    try {
      final result = await graphQLClient.client.query$GetEpisodes(
        Options$Query$GetEpisodes(
          variables: Variables$Query$GetEpisodes(page: page),
        ),
      );

      if (result.hasException) {
        throw ServerException(result.exception.toString());
      }

      final episodes = result.parsedData?.episodes?.results;
      if (episodes == null) {
        throw ServerException('No episodes data found');
      }

      return episodes
          .where((episode) => episode != null)
          .map((episode) => episode!.toEntity())
          .toList();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Episode> getEpisode({required String id}) async {
    try {
      final result = await graphQLClient.client.query$GetEpisode(
        Options$Query$GetEpisode(
          variables: Variables$Query$GetEpisode(id: id),
        ),
      );

      if (result.hasException) {
        throw ServerException(result.exception.toString());
      }

      final episode = result.parsedData?.episode;
      if (episode == null) {
        throw ServerException('Episode not found');
      }

      return episode.toEntity();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
