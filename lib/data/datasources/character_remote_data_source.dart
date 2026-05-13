import 'package:injectable/injectable.dart';
import '../../core/error/exceptions.dart';
import '../../core/network/graphql_client.dart';
import '../../domain/entities/character.dart';
import '../graphql/__generated__/get_characters.graphql.dart';
import '../graphql/__generated__/get_character.graphql.dart';
import '../mappers/character_mapper.dart';

abstract class CharacterRemoteDataSource {
  Future<List<Character>> getCharacters(int page);
  Future<Character> getCharacter(String id);
}

@LazySingleton(as: CharacterRemoteDataSource)
class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  final GraphQLClientService graphQLClient;

  CharacterRemoteDataSourceImpl(this.graphQLClient);

  @override
  Future<List<Character>> getCharacters(int page) async {
    try {
      final result = await graphQLClient.client.query$GetCharacters(
        Options$Query$GetCharacters(
          variables: Variables$Query$GetCharacters(page: page),
        ),
      );

      if (result.hasException) {
        throw ServerException(result.exception.toString());
      }

      final characters = result.parsedData?.characters?.results ?? [];
      return characters
          .where((character) => character != null)
          .map((character) => character!.toEntity())
          .toList();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Character> getCharacter(String id) async {
    try {
      final result = await graphQLClient.client.query$GetCharacter(
        Options$Query$GetCharacter(
          variables: Variables$Query$GetCharacter(id: id),
        ),
      );

      if (result.hasException) {
        throw ServerException(result.exception.toString());
      }

      final character = result.parsedData?.character;
      if (character == null) {
        throw ServerException('Character not found');
      }

      return character.toEntity();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
