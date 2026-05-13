import 'package:injectable/injectable.dart';
import '../../core/error/exceptions.dart';
import '../../core/network/graphql_client.dart';
import '../../domain/entities/location.dart';
import '../graphql/__generated__/get_location.graphql.dart';
import '../graphql/__generated__/get_locations.graphql.dart';
import '../mappers/location_mapper.dart';

abstract class LocationRemoteDataSource {
  Future<List<Location>> getLocations({required int page});
  Future<Location> getLocation({required String id});
}

@LazySingleton(as: LocationRemoteDataSource)
class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  final GraphQLClientService graphQLClient;

  LocationRemoteDataSourceImpl(this.graphQLClient);

  @override
  Future<List<Location>> getLocations({required int page}) async {
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
          .map((location) => location!.toEntity())
          .toList();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Location> getLocation({required String id}) async {
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

      return location.toEntity();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
