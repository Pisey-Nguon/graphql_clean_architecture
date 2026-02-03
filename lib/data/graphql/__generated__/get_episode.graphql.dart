import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$GetEpisode {
  factory Variables$Query$GetEpisode({required String id}) =>
      Variables$Query$GetEpisode._({r'id': id});

  Variables$Query$GetEpisode._(this._$data);

  factory Variables$Query$GetEpisode.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$GetEpisode._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$GetEpisode<Variables$Query$GetEpisode>
  get copyWith => CopyWith$Variables$Query$GetEpisode(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetEpisode ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Query$GetEpisode<TRes> {
  factory CopyWith$Variables$Query$GetEpisode(
    Variables$Query$GetEpisode instance,
    TRes Function(Variables$Query$GetEpisode) then,
  ) = _CopyWithImpl$Variables$Query$GetEpisode;

  factory CopyWith$Variables$Query$GetEpisode.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetEpisode;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$GetEpisode<TRes>
    implements CopyWith$Variables$Query$GetEpisode<TRes> {
  _CopyWithImpl$Variables$Query$GetEpisode(this._instance, this._then);

  final Variables$Query$GetEpisode _instance;

  final TRes Function(Variables$Query$GetEpisode) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Query$GetEpisode._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetEpisode<TRes>
    implements CopyWith$Variables$Query$GetEpisode<TRes> {
  _CopyWithStubImpl$Variables$Query$GetEpisode(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$GetEpisode {
  Query$GetEpisode({this.episode, this.$__typename = 'Query'});

  factory Query$GetEpisode.fromJson(Map<String, dynamic> json) {
    final l$episode = json['episode'];
    final l$$__typename = json['__typename'];
    return Query$GetEpisode(
      episode: l$episode == null
          ? null
          : Query$GetEpisode$episode.fromJson(
              (l$episode as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetEpisode$episode? episode;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$episode = episode;
    _resultData['episode'] = l$episode?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$episode = episode;
    final l$$__typename = $__typename;
    return Object.hashAll([l$episode, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetEpisode || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$GetEpisode on Query$GetEpisode {
  CopyWith$Query$GetEpisode<Query$GetEpisode> get copyWith =>
      CopyWith$Query$GetEpisode(this, (i) => i);
}

abstract class CopyWith$Query$GetEpisode<TRes> {
  factory CopyWith$Query$GetEpisode(
    Query$GetEpisode instance,
    TRes Function(Query$GetEpisode) then,
  ) = _CopyWithImpl$Query$GetEpisode;

  factory CopyWith$Query$GetEpisode.stub(TRes res) =
      _CopyWithStubImpl$Query$GetEpisode;

  TRes call({Query$GetEpisode$episode? episode, String? $__typename});
  CopyWith$Query$GetEpisode$episode<TRes> get episode;
}

class _CopyWithImpl$Query$GetEpisode<TRes>
    implements CopyWith$Query$GetEpisode<TRes> {
  _CopyWithImpl$Query$GetEpisode(this._instance, this._then);

  final Query$GetEpisode _instance;

  final TRes Function(Query$GetEpisode) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? episode = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetEpisode(
          episode: episode == _undefined
              ? _instance.episode
              : (episode as Query$GetEpisode$episode?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$GetEpisode$episode<TRes> get episode {
    final local$episode = _instance.episode;
    return local$episode == null
        ? CopyWith$Query$GetEpisode$episode.stub(_then(_instance))
        : CopyWith$Query$GetEpisode$episode(
            local$episode,
            (e) => call(episode: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetEpisode<TRes>
    implements CopyWith$Query$GetEpisode<TRes> {
  _CopyWithStubImpl$Query$GetEpisode(this._res);

  TRes _res;

  call({Query$GetEpisode$episode? episode, String? $__typename}) => _res;

  CopyWith$Query$GetEpisode$episode<TRes> get episode =>
      CopyWith$Query$GetEpisode$episode.stub(_res);
}

const documentNodeQueryGetEpisode = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetEpisode'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'episode'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              ),
            ],
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
  ],
);
Query$GetEpisode _parserFn$Query$GetEpisode(Map<String, dynamic> data) =>
    Query$GetEpisode.fromJson(data);
typedef OnQueryComplete$Query$GetEpisode =
    FutureOr<void> Function(Map<String, dynamic>?, Query$GetEpisode?);

class Options$Query$GetEpisode extends graphql.QueryOptions<Query$GetEpisode> {
  Options$Query$GetEpisode({
    String? operationName,
    required Variables$Query$GetEpisode variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetEpisode? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetEpisode? onComplete,
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
                 data == null ? null : _parserFn$Query$GetEpisode(data),
               ),
         onError: onError,
         document: documentNodeQueryGetEpisode,
         parserFn: _parserFn$Query$GetEpisode,
       );

  final OnQueryComplete$Query$GetEpisode? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$GetEpisode
    extends graphql.WatchQueryOptions<Query$GetEpisode> {
  WatchOptions$Query$GetEpisode({
    String? operationName,
    required Variables$Query$GetEpisode variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetEpisode? typedOptimisticResult,
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
         document: documentNodeQueryGetEpisode,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$GetEpisode,
       );
}

class FetchMoreOptions$Query$GetEpisode extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetEpisode({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetEpisode variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryGetEpisode,
       );
}

extension ClientExtension$Query$GetEpisode on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetEpisode>> query$GetEpisode(
    Options$Query$GetEpisode options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$GetEpisode> watchQuery$GetEpisode(
    WatchOptions$Query$GetEpisode options,
  ) => this.watchQuery(options);

  void writeQuery$GetEpisode({
    required Query$GetEpisode data,
    required Variables$Query$GetEpisode variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryGetEpisode),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetEpisode? readQuery$GetEpisode({
    required Variables$Query$GetEpisode variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetEpisode),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetEpisode.fromJson(result);
  }
}

class Query$GetEpisode$episode {
  Query$GetEpisode$episode({
    required this.id,
    required this.name,
    required this.air_date,
    required this.episode,
    this.$__typename = 'Episode',
  });

  factory Query$GetEpisode$episode.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$air_date = json['air_date'];
    final l$episode = json['episode'];
    final l$$__typename = json['__typename'];
    return Query$GetEpisode$episode(
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
    if (other is! Query$GetEpisode$episode ||
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

extension UtilityExtension$Query$GetEpisode$episode
    on Query$GetEpisode$episode {
  CopyWith$Query$GetEpisode$episode<Query$GetEpisode$episode> get copyWith =>
      CopyWith$Query$GetEpisode$episode(this, (i) => i);
}

abstract class CopyWith$Query$GetEpisode$episode<TRes> {
  factory CopyWith$Query$GetEpisode$episode(
    Query$GetEpisode$episode instance,
    TRes Function(Query$GetEpisode$episode) then,
  ) = _CopyWithImpl$Query$GetEpisode$episode;

  factory CopyWith$Query$GetEpisode$episode.stub(TRes res) =
      _CopyWithStubImpl$Query$GetEpisode$episode;

  TRes call({
    String? id,
    String? name,
    String? air_date,
    String? episode,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetEpisode$episode<TRes>
    implements CopyWith$Query$GetEpisode$episode<TRes> {
  _CopyWithImpl$Query$GetEpisode$episode(this._instance, this._then);

  final Query$GetEpisode$episode _instance;

  final TRes Function(Query$GetEpisode$episode) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? air_date = _undefined,
    Object? episode = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetEpisode$episode(
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

class _CopyWithStubImpl$Query$GetEpisode$episode<TRes>
    implements CopyWith$Query$GetEpisode$episode<TRes> {
  _CopyWithStubImpl$Query$GetEpisode$episode(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? air_date,
    String? episode,
    String? $__typename,
  }) => _res;
}
