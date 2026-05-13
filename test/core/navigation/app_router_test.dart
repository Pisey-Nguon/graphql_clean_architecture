import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_clean_architecture/core/di/injection_container.dart';
import 'package:graphql_clean_architecture/core/error/failures.dart';
import 'package:graphql_clean_architecture/core/navigation/app_router.dart';
import 'package:graphql_clean_architecture/domain/entities/character.dart';
import 'package:graphql_clean_architecture/domain/repositories/character_repository.dart';
import 'package:graphql_clean_architecture/domain/usecases/get_character.dart';
import 'package:graphql_clean_architecture/domain/usecases/get_characters.dart';
import 'package:graphql_clean_architecture/presentation/bloc/character_bloc.dart';
import 'package:graphql_clean_architecture/presentation/pages/character_detail_page.dart';
import 'package:graphql_clean_architecture/presentation/pages/character_list_page.dart';
import 'package:graphql_clean_architecture/presentation/pages/dashboard_page.dart';
import 'package:graphql_clean_architecture/presentation/pages/search_page.dart';
import 'package:graphql_clean_architecture/presentation/pages/settings_page.dart';

void main() {
  setUp(() async {
    await getIt.reset();
    _registerCharacterTestDependencies();
  });

  tearDown(() async {
    await getIt.reset();
  });

  testWidgets('settings is pushed so back returns to dashboard', (
    WidgetTester tester,
  ) async {
    await _pumpRouter(tester, AppRoutes.dashboard);

    expect(find.byType(DashboardPage), findsOneWidget);
    final dashboardContext = tester.element(find.byType(DashboardPage));
    expect(Navigator.of(dashboardContext).canPop(), isFalse);

    dashboardContext.pushSettings();
    await tester.pumpAndSettle();

    expect(find.byType(SettingsPage), findsOneWidget);
    final settingsContext = tester.element(find.byType(SettingsPage));
    expect(Navigator.of(settingsContext).canPop(), isTrue);

    await tester.pageBack();
    await tester.pumpAndSettle();

    expect(find.byType(DashboardPage), findsOneWidget);
    expect(find.byType(SettingsPage), findsNothing);
    expect(Navigator.of(dashboardContext).canPop(), isFalse);
  });

  testWidgets('character detail route builds from named route args', (
    WidgetTester tester,
  ) async {
    await _pumpRouter(tester, AppRoutes.dashboard);

    final dashboardContext = tester.element(find.byType(DashboardPage));
    Navigator.of(dashboardContext).pushNamed(
      AppRoutes.characterDetail,
      arguments: const CharacterDetailRouteArgs(characterId: _characterId),
    );
    await tester.pumpAndSettle();

    expect(find.byType(CharacterDetailPage), findsOneWidget);
    final detailContext = tester.element(find.byType(CharacterDetailPage));
    expect(Navigator.of(detailContext).canPop(), isTrue);
  });

  testWidgets('character detail is pushed so back returns to characters', (
    WidgetTester tester,
  ) async {
    await _pumpRouter(tester, AppRoutes.characters);

    expect(find.byType(CharacterListPage), findsOneWidget);
    final listContext = tester.element(find.byType(CharacterListPage));
    expect(Navigator.of(listContext).canPop(), isFalse);

    listContext.pushCharacterDetail(characterId: _characterId);
    await tester.pumpAndSettle();

    expect(find.byType(CharacterDetailPage), findsOneWidget);
    final detailContext = tester.element(find.byType(CharacterDetailPage));
    expect(Navigator.of(detailContext).canPop(), isTrue);

    await tester.pageBack();
    await tester.pumpAndSettle();

    expect(find.byType(CharacterListPage), findsOneWidget);
    expect(find.byType(CharacterDetailPage), findsNothing);
    expect(Navigator.of(listContext).canPop(), isFalse);
  });

  testWidgets('character detail is pushed so back returns to search', (
    WidgetTester tester,
  ) async {
    await _pumpRouter(tester, AppRoutes.search);

    expect(find.byType(SearchPage), findsOneWidget);
    final searchContext = tester.element(find.byType(SearchPage));
    expect(Navigator.of(searchContext).canPop(), isFalse);

    searchContext.pushCharacterDetail(characterId: _characterId);
    await tester.pumpAndSettle();

    expect(find.byType(CharacterDetailPage), findsOneWidget);
    final detailContext = tester.element(find.byType(CharacterDetailPage));
    expect(Navigator.of(detailContext).canPop(), isTrue);

    await tester.pageBack();
    await tester.pumpAndSettle();

    expect(find.byType(SearchPage), findsOneWidget);
    expect(find.byType(CharacterDetailPage), findsNothing);
    expect(Navigator.of(searchContext).canPop(), isFalse);
  });

  testWidgets('preloaded character skips detail fetch', (
    WidgetTester tester,
  ) async {
    await _pumpRouter(tester, AppRoutes.characters);

    final repository = getIt<CharacterRepository>() as _FakeCharacterRepository;
    repository.getCharacterCallCount = 0;

    final listContext = tester.element(find.byType(CharacterListPage));
    final character = repository.character(_characterId);

    listContext.pushCharacterDetail(
      characterId: character.id,
      character: character,
    );
    await tester.pumpAndSettle();

    expect(find.byType(CharacterDetailPage), findsOneWidget);
    expect(find.text('Rick Sanchez'), findsWidgets);
    expect(repository.getCharacterCallCount, 0);
  });
}

const _characterId = '1';

Future<void> _pumpRouter(WidgetTester tester, String location) async {
  await tester.pumpWidget(
    MaterialApp(
      initialRoute: location,
      onGenerateRoute: AppRouter.onGenerateRoute,
      onGenerateInitialRoutes: (initialRoute) => [
        AppRouter.onGenerateRoute(RouteSettings(name: initialRoute)),
      ],
    ),
  );
  await tester.pumpAndSettle();
}

void _registerCharacterTestDependencies() {
  getIt.registerLazySingleton<CharacterRepository>(
    _FakeCharacterRepository.new,
  );
  getIt.registerLazySingleton<GetCharacters>(
    () => GetCharacters(getIt<CharacterRepository>()),
  );
  getIt.registerLazySingleton<GetCharacter>(
    () => GetCharacter(getIt<CharacterRepository>()),
  );
  getIt.registerFactory<CharacterBloc>(
    () => CharacterBloc(
      getCharactersUseCase: getIt<GetCharacters>(),
      getCharacterUseCase: getIt<GetCharacter>(),
    ),
  );
}

class _FakeCharacterRepository implements CharacterRepository {
  int getCharacterCallCount = 0;

  @override
  Future<Either<Failure, Character>> getCharacter(String id) async {
    getCharacterCallCount++;
    return Right(character(id));
  }

  @override
  Future<Either<Failure, List<Character>>> getCharacters(int page) async {
    return Right([character(_characterId)]);
  }

  Character character(String id) {
    return Character(
      id: id,
      name: 'Rick Sanchez',
      status: 'Alive',
      species: 'Human',
      image: 'https://example.com/rick.png',
    );
  }
}
