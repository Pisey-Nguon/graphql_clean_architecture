import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../core/error/failures.dart';
import '../../core/usecase/usecase.dart';
import '../entities/character.dart';
import '../repositories/character_repository.dart';

@lazySingleton
class GetCharacters implements UseCase<List<Character>, GetCharactersParams> {
  final CharacterRepository repository;

  GetCharacters(this.repository);

  @override
  Future<Either<Failure, List<Character>>> call(GetCharactersParams params) async {
    return await repository.getCharacters(params.page);
  }
}

class GetCharactersParams extends Equatable {
  final int page;

  const GetCharactersParams({required this.page});

  @override
  List<Object> get props => [page];
}
