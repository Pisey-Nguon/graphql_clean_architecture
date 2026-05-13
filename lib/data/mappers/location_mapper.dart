import '../../domain/entities/location.dart';
import '../graphql/__generated__/get_location.graphql.dart';
import '../graphql/__generated__/get_locations.graphql.dart';

extension GetLocationMapper on Query$GetLocation$location {
  Location toEntity() {
    return Location(
      id: id,
      name: name,
      type: type,
      dimension: dimension,
    );
  }
}

extension GetLocationsMapper on Query$GetLocations$locations$results {
  Location toEntity() {
    return Location(
      id: id,
      name: name,
      type: type,
      dimension: dimension,
    );
  }
}