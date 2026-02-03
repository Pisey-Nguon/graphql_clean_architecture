import 'package:graphql_clean_architecture/core/config/app_endpoint.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GraphQLClientService {
  late GraphQLClient _client;

  GraphQLClientService() {
    _initializeClient();
  }

  void _initializeClient() {
    final httpLink = HttpLink(
      // Replace with your GraphQL endpoint
      AppEndpoint.getEndpoint(),
    );

    final authLink = AuthLink(
      getToken: () async => 'Bearer YOUR_TOKEN_HERE',
    );

    final link = authLink.concat(httpLink);

    _client = GraphQLClient(
      cache: GraphQLCache(store: InMemoryStore()),
      link: link,
      defaultPolicies: DefaultPolicies(
        query: Policies(
          fetch: FetchPolicy.networkOnly,
        ),
        mutate: Policies(
          fetch: FetchPolicy.networkOnly,
        ),
      ),
    );
  }

  // Expose the client directly for use with generated code
  GraphQLClient get client => _client;

  Future<QueryResult> query(String query, {Map<String, dynamic>? variables}) async {
    final result = await _client.query(
      QueryOptions(
        document: gql(query),
        variables: variables ?? {},
      ),
    );
    return result;
  }

  Future<QueryResult> mutate(String mutation, {Map<String, dynamic>? variables}) async {
    final result = await _client.mutate(
      MutationOptions(
        document: gql(mutation),
        variables: variables ?? {},
      ),
    );
    return result;
  }
}
