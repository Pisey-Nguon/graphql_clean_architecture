import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../entities/episode.dart';

abstract class EpisodeRepository {
  Future<Either<Failure, List<Episode>>> getEpisodes({required int page});
  Future<Either<Failure, Episode>> getEpisode({required String id});
}
