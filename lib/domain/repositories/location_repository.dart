import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../entities/location.dart';

abstract class LocationRepository {
  Future<Either<Failure, List<Location>>> getLocations({required int page});
  Future<Either<Failure, Location>> getLocation({required String id});
}
