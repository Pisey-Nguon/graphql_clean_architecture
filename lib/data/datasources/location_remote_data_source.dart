import 'package:injectable/injectable.dart';
import '../../core/error/exceptions.dart';
import '../../core/network/graphql_client.dart';
import '../graphql/__generated__/get_location.graphql.dart';
import '../graphql/__generated__/get_locations.graphql.dart';
import '../models/location_model.dart';

abstract class LocationRemoteDataSource {
  Future<List<LocationModel>> getLocations({required int page});
  Future<LocationModel> getLocation({required String id});
}

@LazySingleton(as: LocationRemoteDataSource)
class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  final GraphQLClientService graphQLClient;

  LocationRemoteDataSourceImpl(this.graphQLClient);

  @override
  Future<List<LocationModel>> getLocations({required int page}) async {
    try {
      final result = await graphQLClient.client.query$GetLocations(
        Options$Query$GetLocations(
          variables: Variables$Query$GetLocations(page: page),
        ),
      );

      if (result.hasException) {
        throw ServerException(result.exception.toString());
      }

      final locations = result.parsedData?.locations?.results;
      if (locations == null) {
        throw ServerException('No locations data found');
      }

      return locations
          .where((location) => location != null)
          .map((location) => LocationModel.fromJson({
                'id': location!.id,
                'name': location.name,
                'type': location.type,
                'dimension': location.dimension,
              }))
          .toList();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<LocationModel> getLocation({required String id}) async {
    try {
      final result = await graphQLClient.client.query$GetLocation(
        Options$Query$GetLocation(
          variables: Variables$Query$GetLocation(id: id),
        ),
      );

      if (result.hasException) {
        throw ServerException(result.exception.toString());
      }

      final location = result.parsedData?.location;
      if (location == null) {
        throw ServerException('Location not found');
      }

      return LocationModel.fromJson({
        'id': location.id,
        'name': location.name,
        'type': location.type,
        'dimension': location.dimension,
      });
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
