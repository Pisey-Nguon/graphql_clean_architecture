import 'package:gql/ast.dart';

class Variables$Query$GetCharacter {
  factory Variables$Query$GetCharacter({required String id}) =>
      Variables$Query$GetCharacter._({r'id': id});

  Variables$Query$GetCharacter._(this._$data);

  factory Variables$Query$GetCharacter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$GetCharacter._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$GetCharacter<Variables$Query$GetCharacter>
  get copyWith => CopyWith$Variables$Query$GetCharacter(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetCharacter ||
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

abstract class CopyWith$Variables$Query$GetCharacter<TRes> {
  factory CopyWith$Variables$Query$GetCharacter(
    Variables$Query$GetCharacter instance,
    TRes Function(Variables$Query$GetCharacter) then,
  ) = _CopyWithImpl$Variables$Query$GetCharacter;

  factory CopyWith$Variables$Query$GetCharacter.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetCharacter;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$GetCharacter<TRes>
    implements CopyWith$Variables$Query$GetCharacter<TRes> {
  _CopyWithImpl$Variables$Query$GetCharacter(this._instance, this._then);

  final Variables$Query$GetCharacter _instance;

  final TRes Function(Variables$Query$GetCharacter) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Query$GetCharacter._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetCharacter<TRes>
    implements CopyWith$Variables$Query$GetCharacter<TRes> {
  _CopyWithStubImpl$Variables$Query$GetCharacter(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$GetCharacter {
  Query$GetCharacter({this.character, this.$__typename = 'Query'});

  factory Query$GetCharacter.fromJson(Map<String, dynamic> json) {
    final l$character = json['character'];
    final l$$__typename = json['__typename'];
    return Query$GetCharacter(
      character: l$character == null
          ? null
          : Query$GetCharacter$character.fromJson(
              (l$character as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetCharacter$character? character;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$character = character;
    _resultData['character'] = l$character?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$character = character;
    final l$$__typename = $__typename;
    return Object.hashAll([l$character, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetCharacter || runtimeType != other.runtimeType) {
      return false;
    }
    final l$character = character;
    final lOther$character = other.character;
    if (l$character != lOther$character) {
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

extension UtilityExtension$Query$GetCharacter on Query$GetCharacter {
  CopyWith$Query$GetCharacter<Query$GetCharacter> get copyWith =>
      CopyWith$Query$GetCharacter(this, (i) => i);
}

abstract class CopyWith$Query$GetCharacter<TRes> {
  factory CopyWith$Query$GetCharacter(
    Query$GetCharacter instance,
    TRes Function(Query$GetCharacter) then,
  ) = _CopyWithImpl$Query$GetCharacter;

  factory CopyWith$Query$GetCharacter.stub(TRes res) =
      _CopyWithStubImpl$Query$GetCharacter;

  TRes call({Query$GetCharacter$character? character, String? $__typename});
  CopyWith$Query$GetCharacter$character<TRes> get character;
}

class _CopyWithImpl$Query$GetCharacter<TRes>
    implements CopyWith$Query$GetCharacter<TRes> {
  _CopyWithImpl$Query$GetCharacter(this._instance, this._then);

  final Query$GetCharacter _instance;

  final TRes Function(Query$GetCharacter) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? character = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetCharacter(
      character: character == _undefined
          ? _instance.character
          : (character as Query$GetCharacter$character?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetCharacter$character<TRes> get character {
    final local$character = _instance.character;
    return local$character == null
        ? CopyWith$Query$GetCharacter$character.stub(_then(_instance))
        : CopyWith$Query$GetCharacter$character(
            local$character,
            (e) => call(character: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetCharacter<TRes>
    implements CopyWith$Query$GetCharacter<TRes> {
  _CopyWithStubImpl$Query$GetCharacter(this._res);

  TRes _res;

  call({Query$GetCharacter$character? character, String? $__typename}) => _res;

  CopyWith$Query$GetCharacter$character<TRes> get character =>
      CopyWith$Query$GetCharacter$character.stub(_res);
}

const documentNodeQueryGetCharacter = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetCharacter'),
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
            name: NameNode(value: 'character'),
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
  ],
);

class Query$GetCharacter$character {
  Query$GetCharacter$character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.image,
    this.$__typename = 'Character',
  });

  factory Query$GetCharacter$character.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$status = json['status'];
    final l$species = json['species'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$GetCharacter$character(
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
    if (other is! Query$GetCharacter$character ||
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

extension UtilityExtension$Query$GetCharacter$character
    on Query$GetCharacter$character {
  CopyWith$Query$GetCharacter$character<Query$GetCharacter$character>
  get copyWith => CopyWith$Query$GetCharacter$character(this, (i) => i);
}

abstract class CopyWith$Query$GetCharacter$character<TRes> {
  factory CopyWith$Query$GetCharacter$character(
    Query$GetCharacter$character instance,
    TRes Function(Query$GetCharacter$character) then,
  ) = _CopyWithImpl$Query$GetCharacter$character;

  factory CopyWith$Query$GetCharacter$character.stub(TRes res) =
      _CopyWithStubImpl$Query$GetCharacter$character;

  TRes call({
    String? id,
    String? name,
    String? status,
    String? species,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetCharacter$character<TRes>
    implements CopyWith$Query$GetCharacter$character<TRes> {
  _CopyWithImpl$Query$GetCharacter$character(this._instance, this._then);

  final Query$GetCharacter$character _instance;

  final TRes Function(Query$GetCharacter$character) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? status = _undefined,
    Object? species = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetCharacter$character(
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

class _CopyWithStubImpl$Query$GetCharacter$character<TRes>
    implements CopyWith$Query$GetCharacter$character<TRes> {
  _CopyWithStubImpl$Query$GetCharacter$character(this._res);

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
