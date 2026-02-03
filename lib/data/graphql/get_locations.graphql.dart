import 'package:gql/ast.dart';

class Variables$Query$GetLocations {
  factory Variables$Query$GetLocations({required int page}) =>
      Variables$Query$GetLocations._({r'page': page});

  Variables$Query$GetLocations._(this._$data);

  factory Variables$Query$GetLocations.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$page = data['page'];
    result$data['page'] = (l$page as int);
    return Variables$Query$GetLocations._(result$data);
  }

  Map<String, dynamic> _$data;

  int get page => (_$data['page'] as int);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$page = page;
    result$data['page'] = l$page;
    return result$data;
  }

  CopyWith$Variables$Query$GetLocations<Variables$Query$GetLocations>
  get copyWith => CopyWith$Variables$Query$GetLocations(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetLocations ||
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

abstract class CopyWith$Variables$Query$GetLocations<TRes> {
  factory CopyWith$Variables$Query$GetLocations(
    Variables$Query$GetLocations instance,
    TRes Function(Variables$Query$GetLocations) then,
  ) = _CopyWithImpl$Variables$Query$GetLocations;

  factory CopyWith$Variables$Query$GetLocations.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetLocations;

  TRes call({int? page});
}

class _CopyWithImpl$Variables$Query$GetLocations<TRes>
    implements CopyWith$Variables$Query$GetLocations<TRes> {
  _CopyWithImpl$Variables$Query$GetLocations(this._instance, this._then);

  final Variables$Query$GetLocations _instance;

  final TRes Function(Variables$Query$GetLocations) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? page = _undefined}) => _then(
    Variables$Query$GetLocations._({
      ..._instance._$data,
      if (page != _undefined && page != null) 'page': (page as int),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetLocations<TRes>
    implements CopyWith$Variables$Query$GetLocations<TRes> {
  _CopyWithStubImpl$Variables$Query$GetLocations(this._res);

  TRes _res;

  call({int? page}) => _res;
}

class Query$GetLocations {
  Query$GetLocations({this.locations, this.$__typename = 'Query'});

  factory Query$GetLocations.fromJson(Map<String, dynamic> json) {
    final l$locations = json['locations'];
    final l$$__typename = json['__typename'];
    return Query$GetLocations(
      locations: l$locations == null
          ? null
          : Query$GetLocations$locations.fromJson(
              (l$locations as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetLocations$locations? locations;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$locations = locations;
    _resultData['locations'] = l$locations?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$locations = locations;
    final l$$__typename = $__typename;
    return Object.hashAll([l$locations, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetLocations || runtimeType != other.runtimeType) {
      return false;
    }
    final l$locations = locations;
    final lOther$locations = other.locations;
    if (l$locations != lOther$locations) {
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

extension UtilityExtension$Query$GetLocations on Query$GetLocations {
  CopyWith$Query$GetLocations<Query$GetLocations> get copyWith =>
      CopyWith$Query$GetLocations(this, (i) => i);
}

abstract class CopyWith$Query$GetLocations<TRes> {
  factory CopyWith$Query$GetLocations(
    Query$GetLocations instance,
    TRes Function(Query$GetLocations) then,
  ) = _CopyWithImpl$Query$GetLocations;

  factory CopyWith$Query$GetLocations.stub(TRes res) =
      _CopyWithStubImpl$Query$GetLocations;

  TRes call({Query$GetLocations$locations? locations, String? $__typename});
  CopyWith$Query$GetLocations$locations<TRes> get locations;
}

class _CopyWithImpl$Query$GetLocations<TRes>
    implements CopyWith$Query$GetLocations<TRes> {
  _CopyWithImpl$Query$GetLocations(this._instance, this._then);

  final Query$GetLocations _instance;

  final TRes Function(Query$GetLocations) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? locations = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetLocations(
      locations: locations == _undefined
          ? _instance.locations
          : (locations as Query$GetLocations$locations?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetLocations$locations<TRes> get locations {
    final local$locations = _instance.locations;
    return local$locations == null
        ? CopyWith$Query$GetLocations$locations.stub(_then(_instance))
        : CopyWith$Query$GetLocations$locations(
            local$locations,
            (e) => call(locations: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetLocations<TRes>
    implements CopyWith$Query$GetLocations<TRes> {
  _CopyWithStubImpl$Query$GetLocations(this._res);

  TRes _res;

  call({Query$GetLocations$locations? locations, String? $__typename}) => _res;

  CopyWith$Query$GetLocations$locations<TRes> get locations =>
      CopyWith$Query$GetLocations$locations.stub(_res);
}

const documentNodeQueryGetLocations = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetLocations'),
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
            name: NameNode(value: 'locations'),
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
                        name: NameNode(value: 'type'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'dimension'),
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

class Query$GetLocations$locations {
  Query$GetLocations$locations({this.results, this.$__typename = 'Locations'});

  factory Query$GetLocations$locations.fromJson(Map<String, dynamic> json) {
    final l$results = json['results'];
    final l$$__typename = json['__typename'];
    return Query$GetLocations$locations(
      results: (l$results as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Query$GetLocations$locations$results.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetLocations$locations$results?>? results;

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
    if (other is! Query$GetLocations$locations ||
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

extension UtilityExtension$Query$GetLocations$locations
    on Query$GetLocations$locations {
  CopyWith$Query$GetLocations$locations<Query$GetLocations$locations>
  get copyWith => CopyWith$Query$GetLocations$locations(this, (i) => i);
}

abstract class CopyWith$Query$GetLocations$locations<TRes> {
  factory CopyWith$Query$GetLocations$locations(
    Query$GetLocations$locations instance,
    TRes Function(Query$GetLocations$locations) then,
  ) = _CopyWithImpl$Query$GetLocations$locations;

  factory CopyWith$Query$GetLocations$locations.stub(TRes res) =
      _CopyWithStubImpl$Query$GetLocations$locations;

  TRes call({
    List<Query$GetLocations$locations$results?>? results,
    String? $__typename,
  });
  TRes results(
    Iterable<Query$GetLocations$locations$results?>? Function(
      Iterable<
        CopyWith$Query$GetLocations$locations$results<
          Query$GetLocations$locations$results
        >?
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GetLocations$locations<TRes>
    implements CopyWith$Query$GetLocations$locations<TRes> {
  _CopyWithImpl$Query$GetLocations$locations(this._instance, this._then);

  final Query$GetLocations$locations _instance;

  final TRes Function(Query$GetLocations$locations) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? results = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetLocations$locations(
          results: results == _undefined
              ? _instance.results
              : (results as List<Query$GetLocations$locations$results?>?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  TRes results(
    Iterable<Query$GetLocations$locations$results?>? Function(
      Iterable<
        CopyWith$Query$GetLocations$locations$results<
          Query$GetLocations$locations$results
        >?
      >?,
    )
    _fn,
  ) => call(
    results: _fn(
      _instance.results?.map(
        (e) => e == null
            ? null
            : CopyWith$Query$GetLocations$locations$results(e, (i) => i),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Query$GetLocations$locations<TRes>
    implements CopyWith$Query$GetLocations$locations<TRes> {
  _CopyWithStubImpl$Query$GetLocations$locations(this._res);

  TRes _res;

  call({
    List<Query$GetLocations$locations$results?>? results,
    String? $__typename,
  }) => _res;

  results(_fn) => _res;
}

class Query$GetLocations$locations$results {
  Query$GetLocations$locations$results({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    this.$__typename = 'Location',
  });

  factory Query$GetLocations$locations$results.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$type = json['type'];
    final l$dimension = json['dimension'];
    final l$$__typename = json['__typename'];
    return Query$GetLocations$locations$results(
      id: (l$id as String),
      name: (l$name as String),
      type: (l$type as String),
      dimension: (l$dimension as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String type;

  final String dimension;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$type = type;
    _resultData['type'] = l$type;
    final l$dimension = dimension;
    _resultData['dimension'] = l$dimension;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$type = type;
    final l$dimension = dimension;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$type, l$dimension, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetLocations$locations$results ||
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
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$dimension = dimension;
    final lOther$dimension = other.dimension;
    if (l$dimension != lOther$dimension) {
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

extension UtilityExtension$Query$GetLocations$locations$results
    on Query$GetLocations$locations$results {
  CopyWith$Query$GetLocations$locations$results<
    Query$GetLocations$locations$results
  >
  get copyWith => CopyWith$Query$GetLocations$locations$results(this, (i) => i);
}

abstract class CopyWith$Query$GetLocations$locations$results<TRes> {
  factory CopyWith$Query$GetLocations$locations$results(
    Query$GetLocations$locations$results instance,
    TRes Function(Query$GetLocations$locations$results) then,
  ) = _CopyWithImpl$Query$GetLocations$locations$results;

  factory CopyWith$Query$GetLocations$locations$results.stub(TRes res) =
      _CopyWithStubImpl$Query$GetLocations$locations$results;

  TRes call({
    String? id,
    String? name,
    String? type,
    String? dimension,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetLocations$locations$results<TRes>
    implements CopyWith$Query$GetLocations$locations$results<TRes> {
  _CopyWithImpl$Query$GetLocations$locations$results(
    this._instance,
    this._then,
  );

  final Query$GetLocations$locations$results _instance;

  final TRes Function(Query$GetLocations$locations$results) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? type = _undefined,
    Object? dimension = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetLocations$locations$results(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      type: type == _undefined || type == null
          ? _instance.type
          : (type as String),
      dimension: dimension == _undefined || dimension == null
          ? _instance.dimension
          : (dimension as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GetLocations$locations$results<TRes>
    implements CopyWith$Query$GetLocations$locations$results<TRes> {
  _CopyWithStubImpl$Query$GetLocations$locations$results(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? type,
    String? dimension,
    String? $__typename,
  }) => _res;
}
