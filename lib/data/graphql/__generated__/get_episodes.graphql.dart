import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$GetEpisodes {
  factory Variables$Query$GetEpisodes({required int page}) =>
      Variables$Query$GetEpisodes._({r'page': page});

  Variables$Query$GetEpisodes._(this._$data);

  factory Variables$Query$GetEpisodes.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$page = data['page'];
    result$data['page'] = (l$page as int);
    return Variables$Query$GetEpisodes._(result$data);
  }

  Map<String, dynamic> _$data;

  int get page => (_$data['page'] as int);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$page = page;
    result$data['page'] = l$page;
    return result$data;
  }

  CopyWith$Variables$Query$GetEpisodes<Variables$Query$GetEpisodes>
  get copyWith => CopyWith$Variables$Query$GetEpisodes(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetEpisodes ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$page = page;
    final lOther$page = other.page;
    if (l$page != lOther$page) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$page = page;
    return Object.hashAll([l$page]);
  }
}

abstract class CopyWith$Variables$Query$GetEpisodes<TRes> {
  factory CopyWith$Variables$Query$GetEpisodes(
    Variables$Query$GetEpisodes instance,
    TRes Function(Variables$Query$GetEpisodes) then,
  ) = _CopyWithImpl$Variables$Query$GetEpisodes;

  factory CopyWith$Variables$Query$GetEpisodes.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetEpisodes;

  TRes call({int? page});
}

class _CopyWithImpl$Variables$Query$GetEpisodes<TRes>
    implements CopyWith$Variables$Query$GetEpisodes<TRes> {
  _CopyWithImpl$Variables$Query$GetEpisodes(this._instance, this._then);

  final Variables$Query$GetEpisodes _instance;

  final TRes Function(Variables$Query$GetEpisodes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? page = _undefined}) => _then(
    Variables$Query$GetEpisodes._({
      ..._instance._$data,
      if (page != _undefined && page != null) 'page': (page as int),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetEpisodes<TRes>
    implements CopyWith$Variables$Query$GetEpisodes<TRes> {
  _CopyWithStubImpl$Variables$Query$GetEpisodes(this._res);

  TRes _res;

  call({int? page}) => _res;
}

class Query$GetEpisodes {
  Query$GetEpisodes({this.episodes, this.$__typename = 'Query'});

  factory Query$GetEpisodes.fromJson(Map<String, dynamic> json) {
    final l$episodes = json['episodes'];
    final l$$__typename = json['__typename'];
    return Query$GetEpisodes(
      episodes: l$episodes == null
          ? null
          : Query$GetEpisodes$episodes.fromJson(
              (l$episodes as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetEpisodes$episodes? episodes;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$episodes = episodes;
    _resultData['episodes'] = l$episodes?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$episodes = episodes;
    final l$$__typename = $__typename;
    return Object.hashAll([l$episodes, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetEpisodes || runtimeType != other.runtimeType) {
      return false;
    }
    final l$episodes = episodes;
    final lOther$episodes = other.episodes;
    if (l$episodes != lOther$episodes) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetEpisodes on Query$GetEpisodes {
  CopyWith$Query$GetEpisodes<Query$GetEpisodes> get copyWith =>
      CopyWith$Query$GetEpisodes(this, (i) => i);
}

abstract class CopyWith$Query$GetEpisodes<TRes> {
  factory CopyWith$Query$GetEpisodes(
    Query$GetEpisodes instance,
    TRes Function(Query$GetEpisodes) then,
  ) = _CopyWithImpl$Query$GetEpisodes;

  factory CopyWith$Query$GetEpisodes.stub(TRes res) =
      _CopyWithStubImpl$Query$GetEpisodes;

  TRes call({Query$GetEpisodes$episodes? episodes, String? $__typename});
  CopyWith$Query$GetEpisodes$episodes<TRes> get episodes;
}

class _CopyWithImpl$Query$GetEpisodes<TRes>
    implements CopyWith$Query$GetEpisodes<TRes> {
  _CopyWithImpl$Query$GetEpisodes(this._instance, this._then);

  final Query$GetEpisodes _instance;

  final TRes Function(Query$GetEpisodes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? episodes = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetEpisodes(
      episodes: episodes == _undefined
          ? _instance.episodes
          : (episodes as Query$GetEpisodes$episodes?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetEpisodes$episodes<TRes> get episodes {
    final local$episodes = _instance.episodes;
    return local$episodes == null
        ? CopyWith$Query$GetEpisodes$episodes.stub(_then(_instance))
        : CopyWith$Query$GetEpisodes$episodes(
            local$episodes,
            (e) => call(episodes: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetEpisodes<TRes>
    implements CopyWith$Query$GetEpisodes<TRes> {
  _CopyWithStubImpl$Query$GetEpisodes(this._res);

  TRes _res;

  call({Query$GetEpisodes$episodes? episodes, String? $__typename}) => _res;

  CopyWith$Query$GetEpisodes$episodes<TRes> get episodes =>
      CopyWith$Query$GetEpisodes$episodes.stub(_res);
}

const documentNodeQueryGetEpisodes = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetEpisodes'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'page')),
          type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'episodes'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'page'),
                value: VariableNode(name: NameNode(value: 'page')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'results'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'air_date'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'episode'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ],
                  ),
                ),
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
  ],
);
Query$GetEpisodes _parserFn$Query$GetEpisodes(Map<String, dynamic> data) =>
    Query$GetEpisodes.fromJson(data);
typedef OnQueryComplete$Query$GetEpisodes =
    FutureOr<void> Function(Map<String, dynamic>?, Query$GetEpisodes?);

class Options$Query$GetEpisodes
    extends graphql.QueryOptions<Query$GetEpisodes> {
  Options$Query$GetEpisodes({
    String? operationName,
    required Variables$Query$GetEpisodes variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetEpisodes? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetEpisodes? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) => onComplete(
                 data,
                 data == null ? null : _parserFn$Query$GetEpisodes(data),
               ),
         onError: onError,
         document: documentNodeQueryGetEpisodes,
         parserFn: _parserFn$Query$GetEpisodes,
       );

  final OnQueryComplete$Query$GetEpisodes? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$GetEpisodes
    extends graphql.WatchQueryOptions<Query$GetEpisodes> {
  WatchOptions$Query$GetEpisodes({
    String? operationName,
    required Variables$Query$GetEpisodes variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetEpisodes? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryGetEpisodes,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$GetEpisodes,
       );
}

class FetchMoreOptions$Query$GetEpisodes extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetEpisodes({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetEpisodes variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryGetEpisodes,
       );
}

extension ClientExtension$Query$GetEpisodes on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetEpisodes>> query$GetEpisodes(
    Options$Query$GetEpisodes options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$GetEpisodes> watchQuery$GetEpisodes(
    WatchOptions$Query$GetEpisodes options,
  ) => this.watchQuery(options);

  void writeQuery$GetEpisodes({
    required Query$GetEpisodes data,
    required Variables$Query$GetEpisodes variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryGetEpisodes),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetEpisodes? readQuery$GetEpisodes({
    required Variables$Query$GetEpisodes variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetEpisodes),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetEpisodes.fromJson(result);
  }
}

class Query$GetEpisodes$episodes {
  Query$GetEpisodes$episodes({this.results, this.$__typename = 'Episodes'});

  factory Query$GetEpisodes$episodes.fromJson(Map<String, dynamic> json) {
    final l$results = json['results'];
    final l$$__typename = json['__typename'];
    return Query$GetEpisodes$episodes(
      results: (l$results as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Query$GetEpisodes$episodes$results.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetEpisodes$episodes$results?>? results;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$results = results;
    _resultData['results'] = l$results?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$results = results;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$results == null ? null : Object.hashAll(l$results.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetEpisodes$episodes ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$results = results;
    final lOther$results = other.results;
    if (l$results != null && lOther$results != null) {
      if (l$results.length != lOther$results.length) {
        return false;
      }
      for (int i = 0; i < l$results.length; i++) {
        final l$results$entry = l$results[i];
        final lOther$results$entry = lOther$results[i];
        if (l$results$entry != lOther$results$entry) {
          return false;
        }
      }
    } else if (l$results != lOther$results) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetEpisodes$episodes
    on Query$GetEpisodes$episodes {
  CopyWith$Query$GetEpisodes$episodes<Query$GetEpisodes$episodes>
  get copyWith => CopyWith$Query$GetEpisodes$episodes(this, (i) => i);
}

abstract class CopyWith$Query$GetEpisodes$episodes<TRes> {
  factory CopyWith$Query$GetEpisodes$episodes(
    Query$GetEpisodes$episodes instance,
    TRes Function(Query$GetEpisodes$episodes) then,
  ) = _CopyWithImpl$Query$GetEpisodes$episodes;

  factory CopyWith$Query$GetEpisodes$episodes.stub(TRes res) =
      _CopyWithStubImpl$Query$GetEpisodes$episodes;

  TRes call({
    List<Query$GetEpisodes$episodes$results?>? results,
    String? $__typename,
  });
  TRes results(
    Iterable<Query$GetEpisodes$episodes$results?>? Function(
      Iterable<
        CopyWith$Query$GetEpisodes$episodes$results<
          Query$GetEpisodes$episodes$results
        >?
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GetEpisodes$episodes<TRes>
    implements CopyWith$Query$GetEpisodes$episodes<TRes> {
  _CopyWithImpl$Query$GetEpisodes$episodes(this._instance, this._then);

  final Query$GetEpisodes$episodes _instance;

  final TRes Function(Query$GetEpisodes$episodes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? results = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetEpisodes$episodes(
          results: results == _undefined
              ? _instance.results
              : (results as List<Query$GetEpisodes$episodes$results?>?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  TRes results(
    Iterable<Query$GetEpisodes$episodes$results?>? Function(
      Iterable<
        CopyWith$Query$GetEpisodes$episodes$results<
          Query$GetEpisodes$episodes$results
        >?
      >?,
    )
    _fn,
  ) => call(
    results: _fn(
      _instance.results?.map(
        (e) => e == null
            ? null
            : CopyWith$Query$GetEpisodes$episodes$results(e, (i) => i),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Query$GetEpisodes$episodes<TRes>
    implements CopyWith$Query$GetEpisodes$episodes<TRes> {
  _CopyWithStubImpl$Query$GetEpisodes$episodes(this._res);

  TRes _res;

  call({
    List<Query$GetEpisodes$episodes$results?>? results,
    String? $__typename,
  }) => _res;

  results(_fn) => _res;
}

class Query$GetEpisodes$episodes$results {
  Query$GetEpisodes$episodes$results({
    required this.id,
    required this.name,
    required this.air_date,
    required this.episode,
    this.$__typename = 'Episode',
  });

  factory Query$GetEpisodes$episodes$results.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$air_date = json['air_date'];
    final l$episode = json['episode'];
    final l$$__typename = json['__typename'];
    return Query$GetEpisodes$episodes$results(
      id: (l$id as String),
      name: (l$name as String),
      air_date: (l$air_date as String),
      episode: (l$episode as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String air_date;

  final String episode;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$air_date = air_date;
    _resultData['air_date'] = l$air_date;
    final l$episode = episode;
    _resultData['episode'] = l$episode;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$air_date = air_date;
    final l$episode = episode;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$air_date, l$episode, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetEpisodes$episodes$results ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$air_date = air_date;
    final lOther$air_date = other.air_date;
    if (l$air_date != lOther$air_date) {
      return false;
    }
    final l$episode = episode;
    final lOther$episode = other.episode;
    if (l$episode != lOther$episode) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetEpisodes$episodes$results
    on Query$GetEpisodes$episodes$results {
  CopyWith$Query$GetEpisodes$episodes$results<
    Query$GetEpisodes$episodes$results
  >
  get copyWith => CopyWith$Query$GetEpisodes$episodes$results(this, (i) => i);
}

abstract class CopyWith$Query$GetEpisodes$episodes$results<TRes> {
  factory CopyWith$Query$GetEpisodes$episodes$results(
    Query$GetEpisodes$episodes$results instance,
    TRes Function(Query$GetEpisodes$episodes$results) then,
  ) = _CopyWithImpl$Query$GetEpisodes$episodes$results;

  factory CopyWith$Query$GetEpisodes$episodes$results.stub(TRes res) =
      _CopyWithStubImpl$Query$GetEpisodes$episodes$results;

  TRes call({
    String? id,
    String? name,
    String? air_date,
    String? episode,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetEpisodes$episodes$results<TRes>
    implements CopyWith$Query$GetEpisodes$episodes$results<TRes> {
  _CopyWithImpl$Query$GetEpisodes$episodes$results(this._instance, this._then);

  final Query$GetEpisodes$episodes$results _instance;

  final TRes Function(Query$GetEpisodes$episodes$results) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? air_date = _undefined,
    Object? episode = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetEpisodes$episodes$results(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      air_date: air_date == _undefined || air_date == null
          ? _instance.air_date
          : (air_date as String),
      episode: episode == _undefined || episode == null
          ? _instance.episode
          : (episode as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GetEpisodes$episodes$results<TRes>
    implements CopyWith$Query$GetEpisodes$episodes$results<TRes> {
  _CopyWithStubImpl$Query$GetEpisodes$episodes$results(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? air_date,
    String? episode,
    String? $__typename,
  }) => _res;
}
