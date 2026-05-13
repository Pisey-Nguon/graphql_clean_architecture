import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_clean_architecture/core/error/exceptions.dart';
import 'package:graphql_clean_architecture/core/error/failures.dart';
import 'package:graphql_clean_architecture/data/datasources/character_remote_data_source.dart';
import 'package:graphql_clean_architecture/data/models/character_model.dart';
import 'package:graphql_clean_architecture/data/repositories/character_repository_impl.dart';

void main() {
  group('CharacterRepositoryImpl.getCharacters', () {
    test('returns characters when the remote data source succeeds', () async {
      const characters = [
        CharacterModel(
          id: '1',
          name: 'Rick Sanchez',
          status: 'Alive',
          species: 'Human',
          image: 'https://example.com/rick.png',
        ),
      ];

      final repository = CharacterRepositoryImpl(
        _FakeCharacterRemoteDataSource(
          getCharactersHandler: (_) async => characters,
        ),
      );

      final result = await repository.getCharacters(1);

      expect(
        result,
        equals(const Right<Failure, List<CharacterModel>>(characters)),
      );
    });

    test('maps server exceptions to server failures', () async {
      final repository = CharacterRepositoryImpl(
        _FakeCharacterRemoteDataSource(
          getCharactersHandler: (_) async => throw ServerException('boom'),
        ),
      );

      final result = await repository.getCharacters(1);

      expect(
        result,
        equals(
          const Left<Failure, List<CharacterModel>>(ServerFailure('boom')),
        ),
      );
    });

    test('maps network exceptions to network failures', () async {
      final repository = CharacterRepositoryImpl(
        _FakeCharacterRemoteDataSource(
          getCharactersHandler: (_) async => throw NetworkException('offline'),
        ),
      );

      final result = await repository.getCharacters(1);

      expect(
        result,
        equals(
          const Left<Failure, List<CharacterModel>>(NetworkFailure('offline')),
        ),
      );
    });
  });
}

class _FakeCharacterRemoteDataSource implements CharacterRemoteDataSource {
  final Future<List<CharacterModel>> Function(int page)? getCharactersHandler;

  const _FakeCharacterRemoteDataSource({this.getCharactersHandler});

  @override
  Future<CharacterModel> getCharacter(String id) async {
    throw UnimplementedError();
  }

  @override
  Future<List<CharacterModel>> getCharacters(int page) async {
    if (getCharactersHandler != null) {
      return getCharactersHandler!(page);
    }

    throw UnimplementedError();
  }
}
