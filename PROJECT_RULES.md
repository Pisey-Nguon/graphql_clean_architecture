# 📋 Project Rules & Coding Standards

## Table of Contents
1. [Architecture Rules](#architecture-rules)
2. [Naming Conventions](#naming-conventions)
3. [File Organization](#file-organization)
4. [Code Style](#code-style)
5. [Git Workflow](#git-workflow)
6. [Testing Requirements](#testing-requirements)
7. [Documentation Standards](#documentation-standards)

---

## 🏗️ Architecture Rules

### Clean Architecture Layers (MANDATORY)

**Rule 1: Layer Dependencies Flow Inward**
```
Presentation → Domain ← Data
     ↓           ↑
   Core  ←──────┘
```

- ✅ Presentation can depend on Domain
- ✅ Data can depend on Domain
- ✅ Domain can depend on Core
- ❌ Domain CANNOT depend on Data or Presentation
- ❌ Core CANNOT depend on any other layer

**Rule 2: Domain Layer Must Be Pure Dart**
```dart
// ✅ GOOD - Domain layer
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

// ❌ BAD - Domain layer
import 'package:flutter/material.dart'; // NO Flutter imports!
import '../data/models/user_model.dart'; // NO Data layer imports!
```

**Rule 3: Use Dependency Injection**
- ALL repositories, data sources, and BLoCs MUST be registered with `@injectable`
- Use `@LazySingleton` for services that should live for app lifetime
- Use `@injectable` for short-lived objects like BLoCs
- Run `flutter pub run build_runner build` after adding new injectable classes

**Rule 4: Error Handling Pattern**
```dart
// ✅ MANDATORY pattern for all repository methods
Future<Either<Failure, T>> someMethod() async {
  try {
    final result = await dataSource.fetch();
    return Right(result);
  } on ServerException catch (e) {
    return Left(ServerFailure(e.message));
  } catch (e) {
    return Left(ServerFailure('Unexpected error occurred'));
  }
}
```

---

## 📝 Naming Conventions

### Files and Folders
```
✅ CORRECT:
lib/domain/entities/character.dart
lib/presentation/pages/character_list_page.dart
lib/data/datasources/character_remote_data_source.dart

❌ WRONG:
lib/domain/entities/Character.dart  // No PascalCase for files
lib/presentation/pages/CharacterList.dart
lib/data/datasources/characterRemoteDataSource.dart  // No camelCase
```

**Rule 5: File Naming**
- Use `snake_case` for all file names
- Suffix pattern files: `_page.dart`, `_bloc.dart`, `_model.dart`, `_repository.dart`
- One class per file (except for small private helper classes)

### Classes
```dart
// ✅ GOOD
class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {}
class CharacterListPage extends StatelessWidget {}
class GetCharacters implements UseCase<List<Character>, GetCharactersParams> {}

// ❌ BAD
class characterBloc {}  // Must be PascalCase
class Character_Bloc {}  // No underscores
class characterlist {}  // Not descriptive enough
```

**Rule 6: Class Naming**
- PascalCase for all class names
- Entities: Singular noun (e.g., `Character`, `Episode`)
- Models: Entity name + `Model` (e.g., `CharacterModel`)
- BLoCs: Feature name + `Bloc` (e.g., `CharacterBloc`)
- Pages: Feature name + `Page` (e.g., `CharacterListPage`)
- Data Sources: Feature + `RemoteDataSource` or `LocalDataSource`
- Repositories: Interface has no suffix, implementation has `Impl` suffix

### Variables and Methods
```dart
// ✅ GOOD
final characterName = 'Rick';
Future<void> fetchCharacters() async {}
const maxRetryAttempts = 3;

// ❌ BAD
final CharacterName = 'Rick';  // Use camelCase
Future<void> FetchCharacters() async {}  // Use camelCase
const MAX_RETRY_ATTEMPTS = 3;  // Use camelCase, not SCREAMING_SNAKE_CASE
```

**Rule 7: Variable/Method Naming**
- camelCase for variables, methods, and parameters
- lowerCamelCase for constants (not SCREAMING_SNAKE_CASE in Dart)
- Boolean variables should start with `is`, `has`, `can` (e.g., `isLoading`, `hasError`)
- Private members start with `_` (e.g., `_privateMethod()`)

---

## 📁 File Organization

### Directory Structure (MANDATORY)
```
lib/
├── core/                          # Shared utilities
│   ├── di/                        # Dependency injection
│   │   └── injection_container.dart
│   ├── error/                     # Error handling
│   │   ├── exceptions.dart
│   │   └── failures.dart
│   ├── network/                   # Network services
│   │   └── graphql_client.dart
│   └── usecase/
│       └── usecase.dart
├── domain/                        # Business logic (Pure Dart)
│   ├── entities/                  # Business objects
│   │   ├── character.dart
│   │   ├── episode.dart
│   │   └── location.dart
│   ├── repositories/              # Repository interfaces
│   │   ├── character_repository.dart
│   │   ├── episode_repository.dart
│   │   └── location_repository.dart
│   └── usecases/                  # Business use cases
│       ├── get_character.dart
│       ├── get_characters.dart
│       └── ...
├── data/                          # Data access
│   ├── models/                    # Data models (extends entities)
│   │   ├── character_model.dart
│   │   └── ...
│   ├── datasources/               # Data sources
│   │   ├── character_remote_data_source.dart
│   │   └── ...
│   ├── repositories/              # Repository implementations
│   │   ├── character_repository_impl.dart
│   │   └── ...
│   └── graphql/                   # GraphQL queries
│       ├── schema.graphql
│       ├── get_characters.graphql
│       └── __generated__/         # Auto-generated (don't edit!)
└── presentation/                  # UI layer
    ├── bloc/                      # State management
    │   ├── character_bloc.dart
    │   ├── character_event.dart
    │   ├── character_state.dart
    │   └── ...
    ├── pages/                     # Full screens
    │   ├── dashboard_page.dart
    │   ├── character_list_page.dart
    │   └── ...
    └── widgets/                   # Reusable components
        └── character_card.dart
```

**Rule 8: Never Edit Generated Files**
- Files in `__generated__/` folders are auto-generated
- Files ending with `.g.dart`, `.config.dart` are auto-generated
- Changes will be overwritten on next build
- Edit source files and regenerate instead

---

## 💅 Code Style

### Formatting
**Rule 9: Use Dart Formatter**
```bash
# Before committing, always run:
dart format .

# Or in your IDE: Save with format on save enabled
```

### Imports
**Rule 10: Import Organization**
```dart
// ✅ CORRECT ORDER:
// 1. Dart SDK imports
import 'dart:async';
import 'dart:convert';

// 2. Flutter imports  
import 'package:flutter/material.dart';

// 3. Package imports (alphabetically)
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 4. Relative imports (alphabetically)
import '../../core/error/failures.dart';
import '../../domain/entities/character.dart';
import '../bloc/character_bloc.dart';
```

### Constants
**Rule 11: Define Constants at the Top**
```dart
// ✅ GOOD
class CharacterListPage extends StatelessWidget {
  static const double cardPadding = 8.0;
  static const int pageSize = 20;
  
  const CharacterListPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    // ...
  }
}

// ❌ BAD - magic numbers scattered in code
Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),  // What is 8.0?
    // ...
  );
}
```

### Widget Structure
**Rule 12: Widget Organization**
```dart
class MyWidget extends StatelessWidget {
  // 1. Static constants
  static const double padding = 16.0;
  
  // 2. Final fields
  final String title;
  final VoidCallback onTap;
  
  // 3. Constructor
  const MyWidget({
    super.key,
    required this.title,
    required this.onTap,
  });
  
  // 4. Build method
  @override
  Widget build(BuildContext context) {
    return Container();
  }
  
  // 5. Private helper methods (if needed)
  void _handleTap() {
    onTap();
  }
}
```

---

## 🔀 Git Workflow

### Branch Naming
**Rule 13: Branch Naming Convention**
```bash
# Feature branches
feature/add-episodes-list
feature/implement-caching

# Bug fix branches
bugfix/fix-character-loading
bugfix/resolve-memory-leak

# Hotfix branches (production)
hotfix/critical-api-error

# ❌ BAD
my-branch
test
feature
```

### Commit Messages
**Rule 14: Commit Message Format**
```bash
# Format: <type>: <subject>
# Types: feat, fix, docs, style, refactor, test, chore

✅ GOOD:
feat: add episodes list page with BLoC
fix: resolve null safety issue in character model
docs: update README with setup instructions
refactor: extract common widget to reusable component
test: add unit tests for character repository
chore: update dependencies to latest versions

❌ BAD:
updated files
fix bug
changes
wip
```

### Pull Request Rules
**Rule 15: Pull Request Requirements**

Before creating PR:
- [ ] Code builds without errors
- [ ] All existing tests pass
- [ ] New features have tests (if applicable)
- [ ] Code is formatted (`dart format .`)
- [ ] No analyzer warnings (`flutter analyze`)
- [ ] Documentation is updated
- [ ] Screenshots added (for UI changes)

PR Title Format:
```
[TYPE] Short description

Types: FEAT, FIX, DOCS, REFACTOR, TEST, CHORE
Example: [FEAT] Add episode list and detail pages
```

---

## 🧪 Testing Requirements

### Test Coverage
**Rule 16: Minimum Test Coverage**
- Domain layer: 90%+ coverage (use cases, entities)
- Data layer: 80%+ coverage (repositories, data sources)
- Presentation layer: 70%+ coverage (BLoCs)

### Test Organization
```
test/
├── domain/
│   ├── entities/
│   │   └── character_test.dart
│   └── usecases/
│       └── get_characters_test.dart
├── data/
│   ├── models/
│   │   └── character_model_test.dart
│   └── repositories/
│       └── character_repository_impl_test.dart
└── presentation/
    └── bloc/
        └── character_bloc_test.dart
```

**Rule 17: Test Naming**
```dart
// ✅ GOOD
test('should return list of characters when call is successful', () {});
test('should emit [Loading, Error] when fetching fails', () {});

// ❌ BAD
test('test1', () {});
test('works', () {});
```

---

## 📚 Documentation Standards

### Code Documentation
**Rule 18: Document Public APIs**
```dart
/// Fetches a paginated list of characters from the API.
///
/// Returns [Right<List<Character>>] on success.
/// Returns [Left<Failure>] on error.
///
/// Example:
/// ```dart
/// final result = await getCharacters(GetCharactersParams(page: 1));
/// result.fold(
///   (failure) => print('Error: ${failure.message}'),
///   (characters) => print('Got ${characters.length} characters'),
/// );
/// ```
Future<Either<Failure, List<Character>>> getCharacters(
  GetCharactersParams params,
);
```

### README Updates
**Rule 19: Keep README Current**
- Update setup instructions when adding dependencies
- Document new features in feature list
- Add new environment variables
- Update screenshots for UI changes

---

## ⚡ Performance Rules

**Rule 20: BLoC Lifecycle**
- Always close BLoCs in dispose methods
- Don't create new BLoC instances in build method
- Use BlocProvider.of or context.read for existing BLoCs

**Rule 21: Image Optimization**
- Use `cached_network_image` for remote images
- Specify image dimensions to avoid layout shifts
- Use placeholder images while loading

**Rule 22: List Performance**
- Use ListView.builder for long lists (not ListView with children)
- Implement pagination for API data
- Use const constructors where possible

---

## 🚫 Common Mistakes to Avoid

### ❌ DON'T DO THIS:

1. **Don't mix layers**
   ```dart
   // ❌ BAD - Domain depending on Data
   import '../data/models/character_model.dart'; // in domain layer
   ```

2. **Don't use context outside build**
   ```dart
   // ❌ BAD
   class MyWidget extends StatelessWidget {
     final BuildContext context; // Don't store context
   }
   ```

3. **Don't ignore errors**
   ```dart
   // ❌ BAD
   try {
     await api.fetch();
   } catch (e) {
     // Empty catch block!
   }
   ```

4. **Don't use setState in StatelessWidget**
   ```dart
   // ❌ BAD - This won't work
   class MyWidget extends StatelessWidget {
     int counter = 0;
     void increment() => setState(() => counter++); // ERROR!
   }
   ```

5. **Don't hardcode strings**
   ```dart
   // ❌ BAD
   Text('Welcome back'); // Use localization or constants
   
   // ✅ GOOD
   Text(AppStrings.welcomeBack);
   ```

---

## 📋 Pre-Commit Checklist

Before every commit:
- [ ] Code compiles: `flutter build apk` (or `flutter run`)
- [ ] No warnings: `flutter analyze`
- [ ] Formatted: `dart format .`
- [ ] Tests pass: `flutter test`
- [ ] Generated files updated: `flutter pub run build_runner build`
- [ ] No TODOs or commented code (unless intentional)
- [ ] Console logs removed (except intentional debugging)

---

## 🎯 Summary

**Top 5 Rules to Remember:**
1. ✅ **Keep layers separated** - Domain is pure, no cross-dependencies
2. ✅ **Use dependency injection** - All services via @injectable
3. ✅ **Follow naming conventions** - snake_case files, PascalCase classes
4. ✅ **Handle errors properly** - Always use Either<Failure, T>
5. ✅ **Document and test** - Code should be self-explanatory with tests

---

*Last Updated: February 3, 2026*
*Questions? Ask the tech lead or refer to DEVELOPER_GUIDE.md*
