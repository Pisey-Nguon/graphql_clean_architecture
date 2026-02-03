import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../entities/character.dart';

abstract class CharacterRepository {
  Future<Either<Failure, List<Character>>> getCharacters(int page);
  Future<Either<Failure, Character>> getCharacter(String id);
}
