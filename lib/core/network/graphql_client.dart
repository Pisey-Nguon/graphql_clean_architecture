import 'package:graphql_clean_architecture/core/config/app_endpoint.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';

const _graphqlAuthToken = String.fromEnvironment(
  'GRAPHQL_AUTH_TOKEN',
  defaultValue: '',
);

@lazySingleton
class GraphQLClientService {
  late GraphQLClient _client;

  GraphQLClientService() {
    _initializeClient();
  }

  void _initializeClient() {
    final httpLink = HttpLink(AppEndpoint.getEndpoint());
    final link = _graphqlAuthToken.isEmpty
        ? httpLink
        : AuthLink(
            getToken: () async => 'Bearer $_graphqlAuthToken',
          ).concat(httpLink);

    _client = GraphQLClient(
      cache: GraphQLCache(store: InMemoryStore()),
      link: link,
      defaultPolicies: DefaultPolicies(
        query: Policies(fetch: FetchPolicy.networkOnly),
        mutate: Policies(fetch: FetchPolicy.networkOnly),
      ),
    );
  }

  GraphQLClient get client => _client;
}
