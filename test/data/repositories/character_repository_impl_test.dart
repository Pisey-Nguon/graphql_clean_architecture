import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_clean_architecture/core/error/exceptions.dart';
import 'package:graphql_clean_architecture/core/error/failures.dart';
import 'package:graphql_clean_architecture/data/datasources/character_remote_data_source.dart';
import 'package:graphql_clean_architecture/data/repositories/character_repository_impl.dart';
import 'package:graphql_clean_architecture/domain/entities/character.dart';

void main() {
  group('CharacterRepositoryImpl.getCharacters', () {
    test('returns characters when the remote data source succeeds', () async {
      const characters = [
        Character(
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
        equals(const Right<Failure, List<Character>>(characters)),
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
          const Left<Failure, List<Character>>(ServerFailure('boom')),
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
          const Left<Failure, List<Character>>(NetworkFailure('offline')),
        ),
      );
    });
  });
}

class _FakeCharacterRemoteDataSource implements CharacterRemoteDataSource {
  final Future<List<Character>> Function(int page)? getCharactersHandler;

  const _FakeCharacterRemoteDataSource({this.getCharactersHandler});

  @override
  Future<Character> getCharacter(String id) async {
    throw UnimplementedError();
  }

  @override
  Future<List<Character>> getCharacters(int page) async {
    if (getCharactersHandler != null) {
      return getCharactersHandler!(page);
    }

    throw UnimplementedError();
  }
}
