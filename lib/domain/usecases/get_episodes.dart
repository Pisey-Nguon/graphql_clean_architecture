import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../core/error/failures.dart';
import '../../core/usecase/usecase.dart';
import '../entities/episode.dart';
import '../repositories/episode_repository.dart';

@injectable
class GetEpisodes implements UseCase<List<Episode>, GetEpisodesParams> {
  final EpisodeRepository repository;

  GetEpisodes(this.repository);

  @override
  Future<Either<Failure, List<Episode>>> call(GetEpisodesParams params) async {
    return await repository.getEpisodes(page: params.page);
  }
}

class GetEpisodesParams extends Equatable {
  final int page;

  const GetEpisodesParams({required this.page});

  @override
  List<Object?> get props => [page];
}
