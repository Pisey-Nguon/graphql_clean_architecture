import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../core/error/failures.dart';
import '../../core/usecase/usecase.dart';
import '../entities/location.dart';
import '../repositories/location_repository.dart';

@injectable
class GetLocations implements UseCase<List<Location>, GetLocationsParams> {
  final LocationRepository repository;

  GetLocations(this.repository);

  @override
  Future<Either<Failure, List<Location>>> call(GetLocationsParams params) async {
    return await repository.getLocations(page: params.page);
  }
}

class GetLocationsParams extends Equatable {
  final int page;

  const GetLocationsParams({required this.page});

  @override
  List<Object?> get props => [page];
}
