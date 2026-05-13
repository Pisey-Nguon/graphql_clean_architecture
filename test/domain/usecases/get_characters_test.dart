import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_clean_architecture/core/error/failures.dart';
import 'package:graphql_clean_architecture/domain/entities/character.dart';
import 'package:graphql_clean_architecture/domain/repositories/character_repository.dart';
import 'package:graphql_clean_architecture/domain/usecases/get_characters.dart';

void main() {
  group('GetCharacters', () {
    test('delegates to the repository with the provided page', () async {
      const expectedCharacters = [
        Character(
          id: '1',
          name: 'Morty Smith',
          status: 'Alive',
          species: 'Human',
          image: 'https://example.com/morty.png',
        ),
      ];
      final repository = _FakeCharacterRepository(
        response: const Right<Failure, List<Character>>(expectedCharacters),
      );
      final useCase = GetCharacters(repository);

      final result = await useCase(const GetCharactersParams(page: 3));

      expect(repository.lastRequestedPage, 3);
      expect(
        result,
        equals(const Right<Failure, List<Character>>(expectedCharacters)),
      );
    });
  });
}

class _FakeCharacterRepository implements CharacterRepository {
  final Either<Failure, List<Character>> response;
  int? lastRequestedPage;

  _FakeCharacterRepository({required this.response});

  @override
  Future<Either<Failure, Character>> getCharacter(String id) async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Character>>> getCharacters(int page) async {
    lastRequestedPage = page;
    return response;
  }
}
