import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../core/error/failures.dart';
import '../../core/usecase/usecase.dart';
import '../entities/episode.dart';
import '../repositories/episode_repository.dart';

@injectable
class GetEpisode implements UseCase<Episode, GetEpisodeParams> {
  final EpisodeRepository repository;

  GetEpisode(this.repository);

  @override
  Future<Either<Failure, Episode>> call(GetEpisodeParams params) async {
    return await repository.getEpisode(id: params.id);
  }
}

class GetEpisodeParams extends Equatable {
  final String id;

  const GetEpisodeParams({required this.id});

  @override
  List<Object?> get props => [id];
}
