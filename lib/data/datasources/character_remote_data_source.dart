import 'package:injectable/injectable.dart';
import '../../core/error/exceptions.dart';
import '../../core/network/graphql_client.dart';
import '../models/character_model.dart';
import '../graphql/__generated__/get_characters.graphql.dart';
import '../graphql/__generated__/get_character.graphql.dart';

abstract class CharacterRemoteDataSource {
  Future<List<CharacterModel>> getCharacters(int page);
  Future<CharacterModel> getCharacter(String id);
}

@LazySingleton(as: CharacterRemoteDataSource)
class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  final GraphQLClientService graphQLClient;

  CharacterRemoteDataSourceImpl(this.graphQLClient);

  @override
  Future<List<CharacterModel>> getCharacters(int page) async {
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
          .map((character) => CharacterModel(
                id: character!.id,
                name: character.name,
                status: character.status,
                species: character.species,
                image: character.image,
              ))
          .toList();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<CharacterModel> getCharacter(String id) async {
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

      return CharacterModel(
        id: character.id,
        name: character.name,
        status: character.status,
        species: character.species,
        image: character.image,
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
