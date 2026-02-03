part of 'character_bloc.dart';

abstract class CharacterEvent extends Equatable {
  const CharacterEvent();

  @override
  List<Object> get props => [];
}

class GetCharactersEvent extends CharacterEvent {
  final int page;

  const GetCharactersEvent({required this.page});

  @override
  List<Object> get props => [page];
}

class GetCharacterEvent extends CharacterEvent {
  final String id;

  const GetCharacterEvent({required this.id});

  @override
  List<Object> get props => [id];
}
