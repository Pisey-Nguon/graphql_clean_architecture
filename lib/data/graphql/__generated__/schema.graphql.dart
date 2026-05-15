// GENERATED CODE - DO NOT MODIFY BY HAND
class Input$FilterCharacter {
  factory Input$FilterCharacter({
    String? gender,
    String? name,
    String? species,
    String? status,
    String? type,
  }) => Input$FilterCharacter._({
    if (gender != null) r'gender': gender,
    if (name != null) r'name': name,
    if (species != null) r'species': species,
    if (status != null) r'status': status,
    if (type != null) r'type': type,
  });

  Input$FilterCharacter._(this._$data);

  factory Input$FilterCharacter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('gender')) {
      final l$gender = data['gender'];
      result$data['gender'] = (l$gender as String?);
    }
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('species')) {
      final l$species = data['species'];
      result$data['species'] = (l$species as String?);
    }
    if (data.containsKey('status')) {
      final l$status = data['status'];
      result$data['status'] = (l$status as String?);
    }
    if (data.containsKey('type')) {
      final l$type = data['type'];
      result$data['type'] = (l$type as String?);
    }
    return Input$FilterCharacter._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get gender => (_$data['gender'] as String?);

  String? get name => (_$data['name'] as String?);

  String? get species => (_$data['species'] as String?);

  String? get status => (_$data['status'] as String?);

  String? get type => (_$data['type'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('gender')) {
      final l$gender = gender;
      result$data['gender'] = l$gender;
    }
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('species')) {
      final l$species = species;
      result$data['species'] = l$species;
    }
    if (_$data.containsKey('status')) {
      final l$status = status;
      result$data['status'] = l$status;
    }
    if (_$data.containsKey('type')) {
      final l$type = type;
      result$data['type'] = l$type;
    }
    return result$data;
  }

  CopyWith$Input$FilterCharacter<Input$FilterCharacter> get copyWith =>
      CopyWith$Input$FilterCharacter(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$FilterCharacter || runtimeType != other.runtimeType) {
      return false;
    }
    final l$gender = gender;
    final lOther$gender = other.gender;
    if (_$data.containsKey('gender') != other._$data.containsKey('gender')) {
      return false;
    }
    if (l$gender != lOther$gender) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$species = species;
    final lOther$species = other.species;
    if (_$data.containsKey('species') != other._$data.containsKey('species')) {
      return false;
    }
    if (l$species != lOther$species) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (_$data.containsKey('status') != other._$data.containsKey('status')) {
      return false;
    }
    if (l$status != lOther$status) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (_$data.containsKey('type') != other._$data.containsKey('type')) {
      return false;
    }
    if (l$type != lOther$type) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$gender = gender;
    final l$name = name;
    final l$species = species;
    final l$status = status;
    final l$type = type;
    return Object.hashAll([
      _$data.containsKey('gender') ? l$gender : const {},
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('species') ? l$species : const {},
      _$data.containsKey('status') ? l$status : const {},
      _$data.containsKey('type') ? l$type : const {},
    ]);
  }
}

abstract class CopyWith$Input$FilterCharacter<TRes> {
  factory CopyWith$Input$FilterCharacter(
    Input$FilterCharacter instance,
    TRes Function(Input$FilterCharacter) then,
  ) = _CopyWithImpl$Input$FilterCharacter;

  factory CopyWith$Input$FilterCharacter.stub(TRes res) =
      _CopyWithStubImpl$Input$FilterCharacter;

  TRes call({
    String? gender,
    String? name,
    String? species,
    String? status,
    String? type,
  });
}

class _CopyWithImpl$Input$FilterCharacter<TRes>
    implements CopyWith$Input$FilterCharacter<TRes> {
  _CopyWithImpl$Input$FilterCharacter(this._instance, this._then);

  final Input$FilterCharacter _instance;

  final TRes Function(Input$FilterCharacter) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? gender = _undefined,
    Object? name = _undefined,
    Object? species = _undefined,
    Object? status = _undefined,
    Object? type = _undefined,
  }) => _then(
    Input$FilterCharacter._({
      ..._instance._$data,
      if (gender != _undefined) 'gender': (gender as String?),
      if (name != _undefined) 'name': (name as String?),
      if (species != _undefined) 'species': (species as String?),
      if (status != _undefined) 'status': (status as String?),
      if (type != _undefined) 'type': (type as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$FilterCharacter<TRes>
    implements CopyWith$Input$FilterCharacter<TRes> {
  _CopyWithStubImpl$Input$FilterCharacter(this._res);

  TRes _res;

  call({
    String? gender,
    String? name,
    String? species,
    String? status,
    String? type,
  }) => _res;
}

class Input$FilterEpisode {
  factory Input$FilterEpisode({String? episode, String? name}) =>
      Input$FilterEpisode._({
        if (episode != null) r'episode': episode,
        if (name != null) r'name': name,
      });

  Input$FilterEpisode._(this._$data);

  factory Input$FilterEpisode.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('episode')) {
      final l$episode = data['episode'];
      result$data['episode'] = (l$episode as String?);
    }
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    return Input$FilterEpisode._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get episode => (_$data['episode'] as String?);

  String? get name => (_$data['name'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('episode')) {
      final l$episode = episode;
      result$data['episode'] = l$episode;
    }
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    return result$data;
  }

  CopyWith$Input$FilterEpisode<Input$FilterEpisode> get copyWith =>
      CopyWith$Input$FilterEpisode(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$FilterEpisode || runtimeType != other.runtimeType) {
      return false;
    }
    final l$episode = episode;
    final lOther$episode = other.episode;
    if (_$data.containsKey('episode') != other._$data.containsKey('episode')) {
      return false;
    }
    if (l$episode != lOther$episode) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$episode = episode;
    final l$name = name;
    return Object.hashAll([
      _$data.containsKey('episode') ? l$episode : const {},
      _$data.containsKey('name') ? l$name : const {},
    ]);
  }
}

abstract class CopyWith$Input$FilterEpisode<TRes> {
  factory CopyWith$Input$FilterEpisode(
    Input$FilterEpisode instance,
    TRes Function(Input$FilterEpisode) then,
  ) = _CopyWithImpl$Input$FilterEpisode;

  factory CopyWith$Input$FilterEpisode.stub(TRes res) =
      _CopyWithStubImpl$Input$FilterEpisode;

  TRes call({String? episode, String? name});
}

class _CopyWithImpl$Input$FilterEpisode<TRes>
    implements CopyWith$Input$FilterEpisode<TRes> {
  _CopyWithImpl$Input$FilterEpisode(this._instance, this._then);

  final Input$FilterEpisode _instance;

  final TRes Function(Input$FilterEpisode) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? episode = _undefined, Object? name = _undefined}) => _then(
    Input$FilterEpisode._({
      ..._instance._$data,
      if (episode != _undefined) 'episode': (episode as String?),
      if (name != _undefined) 'name': (name as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$FilterEpisode<TRes>
    implements CopyWith$Input$FilterEpisode<TRes> {
  _CopyWithStubImpl$Input$FilterEpisode(this._res);

  TRes _res;

  call({String? episode, String? name}) => _res;
}

class Input$FilterLocation {
  factory Input$FilterLocation({
    String? dimension,
    String? name,
    String? type,
  }) => Input$FilterLocation._({
    if (dimension != null) r'dimension': dimension,
    if (name != null) r'name': name,
    if (type != null) r'type': type,
  });

  Input$FilterLocation._(this._$data);

  factory Input$FilterLocation.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('dimension')) {
      final l$dimension = data['dimension'];
      result$data['dimension'] = (l$dimension as String?);
    }
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('type')) {
      final l$type = data['type'];
      result$data['type'] = (l$type as String?);
    }
    return Input$FilterLocation._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get dimension => (_$data['dimension'] as String?);

  String? get name => (_$data['name'] as String?);

  String? get type => (_$data['type'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('dimension')) {
      final l$dimension = dimension;
      result$data['dimension'] = l$dimension;
    }
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('type')) {
      final l$type = type;
      result$data['type'] = l$type;
    }
    return result$data;
  }

  CopyWith$Input$FilterLocation<Input$FilterLocation> get copyWith =>
      CopyWith$Input$FilterLocation(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$FilterLocation || runtimeType != other.runtimeType) {
      return false;
    }
    final l$dimension = dimension;
    final lOther$dimension = other.dimension;
    if (_$data.containsKey('dimension') !=
        other._$data.containsKey('dimension')) {
      return false;
    }
    if (l$dimension != lOther$dimension) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (_$data.containsKey('type') != other._$data.containsKey('type')) {
      return false;
    }
    if (l$type != lOther$type) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$dimension = dimension;
    final l$name = name;
    final l$type = type;
    return Object.hashAll([
      _$data.containsKey('dimension') ? l$dimension : const {},
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('type') ? l$type : const {},
    ]);
  }
}

abstract class CopyWith$Input$FilterLocation<TRes> {
  factory CopyWith$Input$FilterLocation(
    Input$FilterLocation instance,
    TRes Function(Input$FilterLocation) then,
  ) = _CopyWithImpl$Input$FilterLocation;

  factory CopyWith$Input$FilterLocation.stub(TRes res) =
      _CopyWithStubImpl$Input$FilterLocation;

  TRes call({String? dimension, String? name, String? type});
}

class _CopyWithImpl$Input$FilterLocation<TRes>
    implements CopyWith$Input$FilterLocation<TRes> {
  _CopyWithImpl$Input$FilterLocation(this._instance, this._then);

  final Input$FilterLocation _instance;

  final TRes Function(Input$FilterLocation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? dimension = _undefined,
    Object? name = _undefined,
    Object? type = _undefined,
  }) => _then(
    Input$FilterLocation._({
      ..._instance._$data,
      if (dimension != _undefined) 'dimension': (dimension as String?),
      if (name != _undefined) 'name': (name as String?),
      if (type != _undefined) 'type': (type as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$FilterLocation<TRes>
    implements CopyWith$Input$FilterLocation<TRes> {
  _CopyWithStubImpl$Input$FilterLocation(this._res);

  TRes _res;

  call({String? dimension, String? name, String? type}) => _res;
}

enum Enum$CacheControlScope {
  PRIVATE,
  PUBLIC,
  $unknown;

  factory Enum$CacheControlScope.fromJson(String value) =>
      fromJson$Enum$CacheControlScope(value);

  String toJson() => toJson$Enum$CacheControlScope(this);
}

String toJson$Enum$CacheControlScope(Enum$CacheControlScope e) {
  switch (e) {
    case Enum$CacheControlScope.PRIVATE:
      return r'PRIVATE';
    case Enum$CacheControlScope.PUBLIC:
      return r'PUBLIC';
    case Enum$CacheControlScope.$unknown:
      return r'$unknown';
  }
}

Enum$CacheControlScope fromJson$Enum$CacheControlScope(String value) {
  switch (value) {
    case r'PRIVATE':
      return Enum$CacheControlScope.PRIVATE;
    case r'PUBLIC':
      return Enum$CacheControlScope.PUBLIC;
    default:
      return Enum$CacheControlScope.$unknown;
  }
}

enum Enum$__TypeKind {
  SCALAR,
  OBJECT,
  INTERFACE,
  UNION,
  ENUM,
  INPUT_OBJECT,
  LIST,
  NON_NULL,
  $unknown;

  factory Enum$__TypeKind.fromJson(String value) =>
      fromJson$Enum$__TypeKind(value);

  String toJson() => toJson$Enum$__TypeKind(this);
}

String toJson$Enum$__TypeKind(Enum$__TypeKind e) {
  switch (e) {
    case Enum$__TypeKind.SCALAR:
      return r'SCALAR';
    case Enum$__TypeKind.OBJECT:
      return r'OBJECT';
    case Enum$__TypeKind.INTERFACE:
      return r'INTERFACE';
    case Enum$__TypeKind.UNION:
      return r'UNION';
    case Enum$__TypeKind.ENUM:
      return r'ENUM';
    case Enum$__TypeKind.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__TypeKind.LIST:
      return r'LIST';
    case Enum$__TypeKind.NON_NULL:
      return r'NON_NULL';
    case Enum$__TypeKind.$unknown:
      return r'$unknown';
  }
}

Enum$__TypeKind fromJson$Enum$__TypeKind(String value) {
  switch (value) {
    case r'SCALAR':
      return Enum$__TypeKind.SCALAR;
    case r'OBJECT':
      return Enum$__TypeKind.OBJECT;
    case r'INTERFACE':
      return Enum$__TypeKind.INTERFACE;
    case r'UNION':
      return Enum$__TypeKind.UNION;
    case r'ENUM':
      return Enum$__TypeKind.ENUM;
    case r'INPUT_OBJECT':
      return Enum$__TypeKind.INPUT_OBJECT;
    case r'LIST':
      return Enum$__TypeKind.LIST;
    case r'NON_NULL':
      return Enum$__TypeKind.NON_NULL;
    default:
      return Enum$__TypeKind.$unknown;
  }
}

enum Enum$__DirectiveLocation {
  QUERY,
  MUTATION,
  SUBSCRIPTION,
  FIELD,
  FRAGMENT_DEFINITION,
  FRAGMENT_SPREAD,
  INLINE_FRAGMENT,
  VARIABLE_DEFINITION,
  SCHEMA,
  SCALAR,
  OBJECT,
  FIELD_DEFINITION,
  ARGUMENT_DEFINITION,
  INTERFACE,
  UNION,
  ENUM,
  ENUM_VALUE,
  INPUT_OBJECT,
  INPUT_FIELD_DEFINITION,
  $unknown;

  factory Enum$__DirectiveLocation.fromJson(String value) =>
      fromJson$Enum$__DirectiveLocation(value);

  String toJson() => toJson$Enum$__DirectiveLocation(this);
}

String toJson$Enum$__DirectiveLocation(Enum$__DirectiveLocation e) {
  switch (e) {
    case Enum$__DirectiveLocation.QUERY:
      return r'QUERY';
    case Enum$__DirectiveLocation.MUTATION:
      return r'MUTATION';
    case Enum$__DirectiveLocation.SUBSCRIPTION:
      return r'SUBSCRIPTION';
    case Enum$__DirectiveLocation.FIELD:
      return r'FIELD';
    case Enum$__DirectiveLocation.FRAGMENT_DEFINITION:
      return r'FRAGMENT_DEFINITION';
    case Enum$__DirectiveLocation.FRAGMENT_SPREAD:
      return r'FRAGMENT_SPREAD';
    case Enum$__DirectiveLocation.INLINE_FRAGMENT:
      return r'INLINE_FRAGMENT';
    case Enum$__DirectiveLocation.VARIABLE_DEFINITION:
      return r'VARIABLE_DEFINITION';
    case Enum$__DirectiveLocation.SCHEMA:
      return r'SCHEMA';
    case Enum$__DirectiveLocation.SCALAR:
      return r'SCALAR';
    case Enum$__DirectiveLocation.OBJECT:
      return r'OBJECT';
    case Enum$__DirectiveLocation.FIELD_DEFINITION:
      return r'FIELD_DEFINITION';
    case Enum$__DirectiveLocation.ARGUMENT_DEFINITION:
      return r'ARGUMENT_DEFINITION';
    case Enum$__DirectiveLocation.INTERFACE:
      return r'INTERFACE';
    case Enum$__DirectiveLocation.UNION:
      return r'UNION';
    case Enum$__DirectiveLocation.ENUM:
      return r'ENUM';
    case Enum$__DirectiveLocation.ENUM_VALUE:
      return r'ENUM_VALUE';
    case Enum$__DirectiveLocation.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION:
      return r'INPUT_FIELD_DEFINITION';
    case Enum$__DirectiveLocation.$unknown:
      return r'$unknown';
  }
}

Enum$__DirectiveLocation fromJson$Enum$__DirectiveLocation(String value) {
  switch (value) {
    case r'QUERY':
      return Enum$__DirectiveLocation.QUERY;
    case r'MUTATION':
      return Enum$__DirectiveLocation.MUTATION;
    case r'SUBSCRIPTION':
      return Enum$__DirectiveLocation.SUBSCRIPTION;
    case r'FIELD':
      return Enum$__DirectiveLocation.FIELD;
    case r'FRAGMENT_DEFINITION':
      return Enum$__DirectiveLocation.FRAGMENT_DEFINITION;
    case r'FRAGMENT_SPREAD':
      return Enum$__DirectiveLocation.FRAGMENT_SPREAD;
    case r'INLINE_FRAGMENT':
      return Enum$__DirectiveLocation.INLINE_FRAGMENT;
    case r'VARIABLE_DEFINITION':
      return Enum$__DirectiveLocation.VARIABLE_DEFINITION;
    case r'SCHEMA':
      return Enum$__DirectiveLocation.SCHEMA;
    case r'SCALAR':
      return Enum$__DirectiveLocation.SCALAR;
    case r'OBJECT':
      return Enum$__DirectiveLocation.OBJECT;
    case r'FIELD_DEFINITION':
      return Enum$__DirectiveLocation.FIELD_DEFINITION;
    case r'ARGUMENT_DEFINITION':
      return Enum$__DirectiveLocation.ARGUMENT_DEFINITION;
    case r'INTERFACE':
      return Enum$__DirectiveLocation.INTERFACE;
    case r'UNION':
      return Enum$__DirectiveLocation.UNION;
    case r'ENUM':
      return Enum$__DirectiveLocation.ENUM;
    case r'ENUM_VALUE':
      return Enum$__DirectiveLocation.ENUM_VALUE;
    case r'INPUT_OBJECT':
      return Enum$__DirectiveLocation.INPUT_OBJECT;
    case r'INPUT_FIELD_DEFINITION':
      return Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION;
    default:
      return Enum$__DirectiveLocation.$unknown;
  }
}

const possibleTypesMap = <String, Set<String>>{};
