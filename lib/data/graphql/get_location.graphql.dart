import 'package:gql/ast.dart';

class Variables$Query$GetLocation {
  factory Variables$Query$GetLocation({required String id}) =>
      Variables$Query$GetLocation._({r'id': id});

  Variables$Query$GetLocation._(this._$data);

  factory Variables$Query$GetLocation.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$GetLocation._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$GetLocation<Variables$Query$GetLocation>
  get copyWith => CopyWith$Variables$Query$GetLocation(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetLocation ||
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

abstract class CopyWith$Variables$Query$GetLocation<TRes> {
  factory CopyWith$Variables$Query$GetLocation(
    Variables$Query$GetLocation instance,
    TRes Function(Variables$Query$GetLocation) then,
  ) = _CopyWithImpl$Variables$Query$GetLocation;

  factory CopyWith$Variables$Query$GetLocation.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetLocation;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$GetLocation<TRes>
    implements CopyWith$Variables$Query$GetLocation<TRes> {
  _CopyWithImpl$Variables$Query$GetLocation(this._instance, this._then);

  final Variables$Query$GetLocation _instance;

  final TRes Function(Variables$Query$GetLocation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Query$GetLocation._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetLocation<TRes>
    implements CopyWith$Variables$Query$GetLocation<TRes> {
  _CopyWithStubImpl$Variables$Query$GetLocation(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$GetLocation {
  Query$GetLocation({this.location, this.$__typename = 'Query'});

  factory Query$GetLocation.fromJson(Map<String, dynamic> json) {
    final l$location = json['location'];
    final l$$__typename = json['__typename'];
    return Query$GetLocation(
      location: l$location == null
          ? null
          : Query$GetLocation$location.fromJson(
              (l$location as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetLocation$location? location;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$location = location;
    _resultData['location'] = l$location?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$location = location;
    final l$$__typename = $__typename;
    return Object.hashAll([l$location, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetLocation || runtimeType != other.runtimeType) {
      return false;
    }
    final l$location = location;
    final lOther$location = other.location;
    if (l$location != lOther$location) {
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

extension UtilityExtension$Query$GetLocation on Query$GetLocation {
  CopyWith$Query$GetLocation<Query$GetLocation> get copyWith =>
      CopyWith$Query$GetLocation(this, (i) => i);
}

abstract class CopyWith$Query$GetLocation<TRes> {
  factory CopyWith$Query$GetLocation(
    Query$GetLocation instance,
    TRes Function(Query$GetLocation) then,
  ) = _CopyWithImpl$Query$GetLocation;

  factory CopyWith$Query$GetLocation.stub(TRes res) =
      _CopyWithStubImpl$Query$GetLocation;

  TRes call({Query$GetLocation$location? location, String? $__typename});
  CopyWith$Query$GetLocation$location<TRes> get location;
}

class _CopyWithImpl$Query$GetLocation<TRes>
    implements CopyWith$Query$GetLocation<TRes> {
  _CopyWithImpl$Query$GetLocation(this._instance, this._then);

  final Query$GetLocation _instance;

  final TRes Function(Query$GetLocation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? location = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetLocation(
      location: location == _undefined
          ? _instance.location
          : (location as Query$GetLocation$location?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetLocation$location<TRes> get location {
    final local$location = _instance.location;
    return local$location == null
        ? CopyWith$Query$GetLocation$location.stub(_then(_instance))
        : CopyWith$Query$GetLocation$location(
            local$location,
            (e) => call(location: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetLocation<TRes>
    implements CopyWith$Query$GetLocation<TRes> {
  _CopyWithStubImpl$Query$GetLocation(this._res);

  TRes _res;

  call({Query$GetLocation$location? location, String? $__typename}) => _res;

  CopyWith$Query$GetLocation$location<TRes> get location =>
      CopyWith$Query$GetLocation$location.stub(_res);
}

const documentNodeQueryGetLocation = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetLocation'),
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
            name: NameNode(value: 'location'),
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
  ],
);

class Query$GetLocation$location {
  Query$GetLocation$location({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    this.$__typename = 'Location',
  });

  factory Query$GetLocation$location.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$type = json['type'];
    final l$dimension = json['dimension'];
    final l$$__typename = json['__typename'];
    return Query$GetLocation$location(
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
    if (other is! Query$GetLocation$location ||
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

extension UtilityExtension$Query$GetLocation$location
    on Query$GetLocation$location {
  CopyWith$Query$GetLocation$location<Query$GetLocation$location>
  get copyWith => CopyWith$Query$GetLocation$location(this, (i) => i);
}

abstract class CopyWith$Query$GetLocation$location<TRes> {
  factory CopyWith$Query$GetLocation$location(
    Query$GetLocation$location instance,
    TRes Function(Query$GetLocation$location) then,
  ) = _CopyWithImpl$Query$GetLocation$location;

  factory CopyWith$Query$GetLocation$location.stub(TRes res) =
      _CopyWithStubImpl$Query$GetLocation$location;

  TRes call({
    String? id,
    String? name,
    String? type,
    String? dimension,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetLocation$location<TRes>
    implements CopyWith$Query$GetLocation$location<TRes> {
  _CopyWithImpl$Query$GetLocation$location(this._instance, this._then);

  final Query$GetLocation$location _instance;

  final TRes Function(Query$GetLocation$location) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? type = _undefined,
    Object? dimension = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetLocation$location(
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

class _CopyWithStubImpl$Query$GetLocation$location<TRes>
    implements CopyWith$Query$GetLocation$location<TRes> {
  _CopyWithStubImpl$Query$GetLocation$location(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? type,
    String? dimension,
    String? $__typename,
  }) => _res;
}
