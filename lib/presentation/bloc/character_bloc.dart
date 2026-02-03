import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/character.dart';
import '../../domain/usecases/get_character.dart';
import '../../domain/usecases/get_characters.dart';

part 'character_event.dart';
part 'character_state.dart';

@injectable
class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final GetCharacters getCharactersUseCase;
  final GetCharacter getCharacterUseCase;

  CharacterBloc({
    required this.getCharactersUseCase,
    required this.getCharacterUseCase,
  }) : super(CharacterInitial()) {
    on<GetCharactersEvent>(_onGetCharacters);
    on<GetCharacterEvent>(_onGetCharacter);
  }

  Future<void> _onGetCharacters(
    GetCharactersEvent event,
    Emitter<CharacterState> emit,
  ) async {
    emit(CharacterLoading());
    final result = await getCharactersUseCase(
      GetCharactersParams(page: event.page),
    );
    result.fold(
      (failure) => emit(CharacterError(message: failure.message)),
      (characters) => emit(CharactersLoaded(characters: characters)),
    );
  }

  Future<void> _onGetCharacter(
    GetCharacterEvent event,
    Emitter<CharacterState> emit,
  ) async {
    emit(CharacterLoading());
    final result = await getCharacterUseCase(
      GetCharacterParams(id: event.id),
    );
    result.fold(
      (failure) => emit(CharacterError(message: failure.message)),
      (character) => emit(CharacterLoaded(character: character)),
    );
  }
}
