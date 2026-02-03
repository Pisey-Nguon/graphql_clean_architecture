import 'package:gql/ast.dart';

class Variables$Query$GetCharacters {
  factory Variables$Query$GetCharacters({required int page}) =>
      Variables$Query$GetCharacters._({r'page': page});

  Variables$Query$GetCharacters._(this._$data);

  factory Variables$Query$GetCharacters.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$page = data['page'];
    result$data['page'] = (l$page as int);
    return Variables$Query$GetCharacters._(result$data);
  }

  Map<String, dynamic> _$data;

  int get page => (_$data['page'] as int);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$page = page;
    result$data['page'] = l$page;
    return result$data;
  }

  CopyWith$Variables$Query$GetCharacters<Variables$Query$GetCharacters>
  get copyWith => CopyWith$Variables$Query$GetCharacters(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetCharacters ||
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

abstract class CopyWith$Variables$Query$GetCharacters<TRes> {
  factory CopyWith$Variables$Query$GetCharacters(
    Variables$Query$GetCharacters instance,
    TRes Function(Variables$Query$GetCharacters) then,
  ) = _CopyWithImpl$Variables$Query$GetCharacters;

  factory CopyWith$Variables$Query$GetCharacters.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetCharacters;

  TRes call({int? page});
}

class _CopyWithImpl$Variables$Query$GetCharacters<TRes>
    implements CopyWith$Variables$Query$GetCharacters<TRes> {
  _CopyWithImpl$Variables$Query$GetCharacters(this._instance, this._then);

  final Variables$Query$GetCharacters _instance;

  final TRes Function(Variables$Query$GetCharacters) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? page = _undefined}) => _then(
    Variables$Query$GetCharacters._({
      ..._instance._$data,
      if (page != _undefined && page != null) 'page': (page as int),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetCharacters<TRes>
    implements CopyWith$Variables$Query$GetCharacters<TRes> {
  _CopyWithStubImpl$Variables$Query$GetCharacters(this._res);

  TRes _res;

  call({int? page}) => _res;
}

class Query$GetCharacters {
  Query$GetCharacters({this.characters, this.$__typename = 'Query'});

  factory Query$GetCharacters.fromJson(Map<String, dynamic> json) {
    final l$characters = json['characters'];
    final l$$__typename = json['__typename'];
    return Query$GetCharacters(
      characters: l$characters == null
          ? null
          : Query$GetCharacters$characters.fromJson(
              (l$characters as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetCharacters$characters? characters;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$characters = characters;
    _resultData['characters'] = l$characters?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$characters = characters;
    final l$$__typename = $__typename;
    return Object.hashAll([l$characters, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetCharacters || runtimeType != other.runtimeType) {
      return false;
    }
    final l$characters = characters;
    final lOther$characters = other.characters;
    if (l$characters != lOther$characters) {
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

extension UtilityExtension$Query$GetCharacters on Query$GetCharacters {
  CopyWith$Query$GetCharacters<Query$GetCharacters> get copyWith =>
      CopyWith$Query$GetCharacters(this, (i) => i);
}

abstract class CopyWith$Query$GetCharacters<TRes> {
  factory CopyWith$Query$GetCharacters(
    Query$GetCharacters instance,
    TRes Function(Query$GetCharacters) then,
  ) = _CopyWithImpl$Query$GetCharacters;

  factory CopyWith$Query$GetCharacters.stub(TRes res) =
      _CopyWithStubImpl$Query$GetCharacters;

  TRes call({Query$GetCharacters$characters? characters, String? $__typename});
  CopyWith$Query$GetCharacters$characters<TRes> get characters;
}

class _CopyWithImpl$Query$GetCharacters<TRes>
    implements CopyWith$Query$GetCharacters<TRes> {
  _CopyWithImpl$Query$GetCharacters(this._instance, this._then);

  final Query$GetCharacters _instance;

  final TRes Function(Query$GetCharacters) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? characters = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetCharacters(
      characters: characters == _undefined
          ? _instance.characters
          : (characters as Query$GetCharacters$characters?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetCharacters$characters<TRes> get characters {
    final local$characters = _instance.characters;
    return local$characters == null
        ? CopyWith$Query$GetCharacters$characters.stub(_then(_instance))
        : CopyWith$Query$GetCharacters$characters(
            local$characters,
            (e) => call(characters: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetCharacters<TRes>
    implements CopyWith$Query$GetCharacters<TRes> {
  _CopyWithStubImpl$Query$GetCharacters(this._res);

  TRes _res;

  call({Query$GetCharacters$characters? characters, String? $__typename}) =>
      _res;

  CopyWith$Query$GetCharacters$characters<TRes> get characters =>
      CopyWith$Query$GetCharacters$characters.stub(_res);
}

const documentNodeQueryGetCharacters = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetCharacters'),
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
            name: NameNode(value: 'characters'),
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
                        name: NameNode(value: 'status'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'species'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'image'),
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

class Query$GetCharacters$characters {
  Query$GetCharacters$characters({
    this.results,
    this.$__typename = 'Characters',
  });

  factory Query$GetCharacters$characters.fromJson(Map<String, dynamic> json) {
    final l$results = json['results'];
    final l$$__typename = json['__typename'];
    return Query$GetCharacters$characters(
      results: (l$results as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Query$GetCharacters$characters$results.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetCharacters$characters$results?>? results;

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
    if (other is! Query$GetCharacters$characters ||
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

extension UtilityExtension$Query$GetCharacters$characters
    on Query$GetCharacters$characters {
  CopyWith$Query$GetCharacters$characters<Query$GetCharacters$characters>
  get copyWith => CopyWith$Query$GetCharacters$characters(this, (i) => i);
}

abstract class CopyWith$Query$GetCharacters$characters<TRes> {
  factory CopyWith$Query$GetCharacters$characters(
    Query$GetCharacters$characters instance,
    TRes Function(Query$GetCharacters$characters) then,
  ) = _CopyWithImpl$Query$GetCharacters$characters;

  factory CopyWith$Query$GetCharacters$characters.stub(TRes res) =
      _CopyWithStubImpl$Query$GetCharacters$characters;

  TRes call({
    List<Query$GetCharacters$characters$results?>? results,
    String? $__typename,
  });
  TRes results(
    Iterable<Query$GetCharacters$characters$results?>? Function(
      Iterable<
        CopyWith$Query$GetCharacters$characters$results<
          Query$GetCharacters$characters$results
        >?
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GetCharacters$characters<TRes>
    implements CopyWith$Query$GetCharacters$characters<TRes> {
  _CopyWithImpl$Query$GetCharacters$characters(this._instance, this._then);

  final Query$GetCharacters$characters _instance;

  final TRes Function(Query$GetCharacters$characters) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? results = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetCharacters$characters(
          results: results == _undefined
              ? _instance.results
              : (results as List<Query$GetCharacters$characters$results?>?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  TRes results(
    Iterable<Query$GetCharacters$characters$results?>? Function(
      Iterable<
        CopyWith$Query$GetCharacters$characters$results<
          Query$GetCharacters$characters$results
        >?
      >?,
    )
    _fn,
  ) => call(
    results: _fn(
      _instance.results?.map(
        (e) => e == null
            ? null
            : CopyWith$Query$GetCharacters$characters$results(e, (i) => i),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Query$GetCharacters$characters<TRes>
    implements CopyWith$Query$GetCharacters$characters<TRes> {
  _CopyWithStubImpl$Query$GetCharacters$characters(this._res);

  TRes _res;

  call({
    List<Query$GetCharacters$characters$results?>? results,
    String? $__typename,
  }) => _res;

  results(_fn) => _res;
}

class Query$GetCharacters$characters$results {
  Query$GetCharacters$characters$results({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.image,
    this.$__typename = 'Character',
  });

  factory Query$GetCharacters$characters$results.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$status = json['status'];
    final l$species = json['species'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$GetCharacters$characters$results(
      id: (l$id as String),
      name: (l$name as String),
      status: (l$status as String),
      species: (l$species as String),
      image: (l$image as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String status;

  final String species;

  final String image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$species = species;
    _resultData['species'] = l$species;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$status = status;
    final l$species = species;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$status,
      l$species,
      l$image,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetCharacters$characters$results ||
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
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$species = species;
    final lOther$species = other.species;
    if (l$species != lOther$species) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
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

extension UtilityExtension$Query$GetCharacters$characters$results
    on Query$GetCharacters$characters$results {
  CopyWith$Query$GetCharacters$characters$results<
    Query$GetCharacters$characters$results
  >
  get copyWith =>
      CopyWith$Query$GetCharacters$characters$results(this, (i) => i);
}

abstract class CopyWith$Query$GetCharacters$characters$results<TRes> {
  factory CopyWith$Query$GetCharacters$characters$results(
    Query$GetCharacters$characters$results instance,
    TRes Function(Query$GetCharacters$characters$results) then,
  ) = _CopyWithImpl$Query$GetCharacters$characters$results;

  factory CopyWith$Query$GetCharacters$characters$results.stub(TRes res) =
      _CopyWithStubImpl$Query$GetCharacters$characters$results;

  TRes call({
    String? id,
    String? name,
    String? status,
    String? species,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetCharacters$characters$results<TRes>
    implements CopyWith$Query$GetCharacters$characters$results<TRes> {
  _CopyWithImpl$Query$GetCharacters$characters$results(
    this._instance,
    this._then,
  );

  final Query$GetCharacters$characters$results _instance;

  final TRes Function(Query$GetCharacters$characters$results) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? status = _undefined,
    Object? species = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetCharacters$characters$results(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as String),
      species: species == _undefined || species == null
          ? _instance.species
          : (species as String),
      image: image == _undefined || image == null
          ? _instance.image
          : (image as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GetCharacters$characters$results<TRes>
    implements CopyWith$Query$GetCharacters$characters$results<TRes> {
  _CopyWithStubImpl$Query$GetCharacters$characters$results(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? status,
    String? species,
    String? image,
    String? $__typename,
  }) => _res;
}
