import '../../domain/entities/location.dart';

class LocationModel extends Location {
  const LocationModel({
    required super.id,
    required super.name,
    required super.type,
    required super.dimension,
  });
}
