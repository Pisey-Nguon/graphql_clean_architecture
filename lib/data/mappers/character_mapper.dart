import '../../domain/entities/character.dart';
import '../graphql/__generated__/get_character.graphql.dart';
import '../graphql/__generated__/get_characters.graphql.dart';

extension GetCharacterMapper on Query$GetCharacter$character {
  Character toEntity() {
    return Character(
      id: id,
      name: name,
      status: status,
      species: species,
      image: image,
    );
  }
}

extension GetCharactersMapper on Query$GetCharacters$characters$results {
  Character toEntity() {
    return Character(
      id: id,
      name: name,
      status: status,
      species: species,
      image: image,
    );
  }
}