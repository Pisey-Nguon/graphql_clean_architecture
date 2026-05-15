import '../../domain/entities/character.dart';
import '../graphql/__generated__/get_character.graphql.dart';
import '../graphql/__generated__/get_characters.graphql.dart';

extension GetCharacterMapper on Query$GetCharacter$character {
  Character toEntity() {
    return Character(
      id: id ?? '',
      name: name ?? 'N/A',
      status: status ?? 'N/A',
      species: species ?? 'N/A',
      image: image ?? 'N/A',
    );
  }
}

extension GetCharactersMapper on Query$GetCharacters$characters$results {
  Character toEntity() {
    return Character(
      id: id ?? '',
      name: name ?? 'N/A',
      status: status ?? 'N/A',
      species: species ?? 'N/A',
      image: image ?? 'N/A',
    );
  }
}