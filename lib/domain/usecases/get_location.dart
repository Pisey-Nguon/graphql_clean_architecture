import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../core/error/failures.dart';
import '../../core/usecase/usecase.dart';
import '../entities/location.dart';
import '../repositories/location_repository.dart';

@injectable
class GetLocation implements UseCase<Location, GetLocationParams> {
  final LocationRepository repository;

  GetLocation(this.repository);

  @override
  Future<Either<Failure, Location>> call(GetLocationParams params) async {
    return await repository.getLocation(id: params.id);
  }
}

class GetLocationParams extends Equatable {
  final String id;

  const GetLocationParams({required this.id});

  @override
  List<Object?> get props => [id];
}
