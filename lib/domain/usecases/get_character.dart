import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../core/error/failures.dart';
import '../../core/usecase/usecase.dart';
import '../entities/character.dart';
import '../repositories/character_repository.dart';

@lazySingleton
class GetCharacter implements UseCase<Character, GetCharacterParams> {
  final CharacterRepository repository;

  GetCharacter(this.repository);

  @override
  Future<Either<Failure, Character>> call(GetCharacterParams params) async {
    return await repository.getCharacter(params.id);
  }
}

class GetCharacterParams extends Equatable {
  final String id;

  const GetCharacterParams({required this.id});

  @override
  List<Object> get props => [id];
}
