# 👨‍💻 Developer Guide - Onboarding Documentation

Welcome to the project! This guide will help you get started quickly and contribute effectively.

## Table of Contents
1. [Quick Start](#quick-start)
2. [Project Overview](#project-overview)
3. [Development Setup](#development-setup)
4. [Adding New Features](#adding-new-features)
5. [Common Tasks](#common-tasks)
6. [Troubleshooting](#troubleshooting)
7. [Resources](#resources)

---

## 🚀 Quick Start

### Prerequisites
```bash
# Required installations:
- Flutter SDK 3.10.0 or higher
- Dart SDK 3.0.0 or higher
- Android Studio / Xcode (for mobile development)
- Git
- VS Code (recommended) with Flutter extension
```

### Setup in 5 Minutes

**Step 1: Clone and Install**
```bash
# Clone the repository
git clone <repository-url>
cd jalat_driver_module

# Install dependencies
flutter pub get

# Generate code (DI, GraphQL, JSON serialization)
flutter pub run build_runner build --delete-conflicting-outputs
```

**Step 2: Verify Setup**
```bash
# Check for issues
flutter doctor -v

# Run analyzer
flutter analyze

# Run tests
flutter test
```

**Step 3: Run the App**
```bash
# List available devices
flutter devices

# Run on connected device
flutter run -d <device-id>

# Or run on all devices
flutter run
```

**Step 4: Verify Everything Works**
- ✅ App launches successfully
- ✅ Dashboard appears with 4 stat cards
- ✅ Can navigate to Characters, Episodes, Locations
- ✅ Data loads from Rick & Morty API

---

## 📖 Project Overview

### What This App Does
A Flutter app showcasing **Clean Architecture** with **GraphQL** integration, using the Rick & Morty API. Users can browse characters, episodes, and locations from the show.

### Tech Stack
| Technology | Purpose | Version |
|-----------|---------|---------|
| Flutter | UI Framework | ^3.10.8 |
| Dart | Programming Language | ^3.0.0 |
| graphql_flutter | GraphQL Client | ^5.1.2 |
| graphql_codegen | Type-safe GraphQL | ^3.0.1 |
| flutter_bloc | State Management | ^8.1.3 |
| get_it + injectable | Dependency Injection | ^7.6.4 / ^2.3.2 |
| dartz | Functional Programming | ^0.10.1 |
| equatable | Value Equality | ^2.0.5 |

### Architecture Overview
```
┌─────────────────────────────────────────┐
│         Presentation Layer              │
│  (Pages, Widgets, BLoC)                 │
│  - UI Components                        │
│  - State Management                     │
│  - User Interactions                    │
└────────────┬────────────────────────────┘
             │ Depends on
             ↓
┌─────────────────────────────────────────┐
│           Domain Layer                  │
│  (Entities, Use Cases, Repositories)    │
│  - Business Logic                       │
│  - Pure Dart (no Flutter)               │
│  - Repository Interfaces                │
└────────────┬────────────────────────────┘
             │ Implemented by
             ↓
┌─────────────────────────────────────────┐
│            Data Layer                   │
│  (Models, Data Sources, Repos Impl)     │
│  - API Communication                    │
│  - Data Transformation                  │
│  - Repository Implementation            │
└─────────────────────────────────────────┘
             │
             ↓
┌─────────────────────────────────────────┐
│            Core Layer                   │
│  (DI, Network, Errors, Base Classes)    │
│  - Dependency Injection                 │
│  - GraphQL Client                       │
│  - Error Handling                       │
└─────────────────────────────────────────┘
```

---

## 🛠️ Development Setup

### VS Code Extensions (Recommended)
```json
{
  "recommendations": [
    "dart-code.flutter",
    "dart-code.dart-code",
    "usernamehw.errorlens",
    "streetsidesoftware.code-spell-checker",
    "alexisvt.flutter-snippets"
  ]
}
```

### IDE Settings
**VS Code Settings (`.vscode/settings.json`):**
```json
{
  "editor.formatOnSave": true,
  "editor.codeActionsOnSave": {
    "source.fixAll": true
  },
  "dart.lineLength": 120,
  "[dart]": {
    "editor.rulers": [120],
    "editor.selectionHighlight": false
  }
}
```

### Environment Configuration
Currently uses public Rick & Morty API (no API key required).

For future API keys:
```bash
# Create .env file (don't commit!)
API_KEY=your_api_key_here
API_URL=https://api.example.com
```

---

## ➕ Adding New Features

### Feature Implementation Steps

Follow this exact process for every new feature:

### Step 1: Create Domain Layer (Pure Dart)

**1.1 Create Entity**
```bash
# Create file: lib/domain/entities/your_entity.dart
```
```dart
import 'package:equatable/equatable.dart';

class YourEntity extends Equatable {
  final String id;
  final String name;
  final String someField;

  const YourEntity({
    required this.id,
    required this.name,
    required this.someField,
  });

  @override
  List<Object?> get props => [id, name, someField];
}
```

**1.2 Create Repository Interface**
```bash
# Create file: lib/domain/repositories/your_repository.dart
```
```dart
import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../entities/your_entity.dart';

abstract class YourRepository {
  Future<Either<Failure, List<YourEntity>>> getItems({required int page});
  Future<Either<Failure, YourEntity>> getItem({required String id});
}
```

**1.3 Create Use Cases**
```bash
# Create files:
# lib/domain/usecases/get_items.dart
# lib/domain/usecases/get_item.dart
```
```dart
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../core/error/failures.dart';
import '../../core/usecase/usecase.dart';
import '../entities/your_entity.dart';
import '../repositories/your_repository.dart';

class GetItems implements UseCase<List<YourEntity>, GetItemsParams> {
  final YourRepository repository;

  GetItems(this.repository);

  @override
  Future<Either<Failure, List<YourEntity>>> call(GetItemsParams params) async {
    return await repository.getItems(page: params.page);
  }
}

class GetItemsParams extends Equatable {
  final int page;

  const GetItemsParams({required this.page});

  @override
  List<Object?> get props => [page];
}
```

### Step 2: Create Data Layer

**2.1 Create GraphQL Queries**
```bash
# Create files:
# lib/data/graphql/get_items.graphql
# lib/data/graphql/get_item.graphql
```
```graphql
# get_items.graphql
query GetItems($page: Int!) {
  items(page: $page) {
    results {
      id
      name
      someField
    }
  }
}

# get_item.graphql
query GetItem($id: ID!) {
  item(id: $id) {
    id
    name
    someField
  }
}
```

**2.2 Update GraphQL Schema**
```bash
# Edit: lib/data/graphql/schema.graphql
```
Add your types to the schema file.

**2.3 Generate GraphQL Code**
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

**2.4 Create Model**
```bash
# Create file: lib/data/models/your_model.dart
```
```dart
import '../../domain/entities/your_entity.dart';

class YourModel extends YourEntity {
  const YourModel({
    required super.id,
    required super.name,
    required super.someField,
  });

  factory YourModel.fromJson(Map<String, dynamic> json) {
    return YourModel(
      id: json['id'] as String,
      name: json['name'] as String,
      someField: json['someField'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'someField': someField,
    };
  }
}
```

**2.5 Create Data Source**
```bash
# Create file: lib/data/datasources/your_remote_data_source.dart
```
```dart
import 'package:injectable/injectable.dart';
import '../../core/error/exceptions.dart';
import '../../core/network/graphql_client.dart';
import '../graphql/__generated__/get_items.graphql.dart';
import '../graphql/__generated__/get_item.graphql.dart';
import '../models/your_model.dart';

abstract class YourRemoteDataSource {
  Future<List<YourModel>> getItems({required int page});
  Future<YourModel> getItem({required String id});
}

@LazySingleton(as: YourRemoteDataSource)
class YourRemoteDataSourceImpl implements YourRemoteDataSource {
  final GraphQLClientService graphQLClient;

  YourRemoteDataSourceImpl(this.graphQLClient);

  @override
  Future<List<YourModel>> getItems({required int page}) async {
    try {
      final result = await graphQLClient.client.query$GetItems(
        Options$Query$GetItems(
          variables: Variables$Query$GetItems(page: page),
        ),
      );

      if (result.hasException) {
        throw ServerException(result.exception.toString());
      }

      final items = result.parsedData?.items?.results;
      if (items == null) {
        throw ServerException('No items data found');
      }

      return items
          .where((item) => item != null)
          .map((item) => YourModel.fromJson({
                'id': item!.id,
                'name': item.name,
                'someField': item.someField,
              }))
          .toList();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<YourModel> getItem({required String id}) async {
    try {
      final result = await graphQLClient.client.query$GetItem(
        Options$Query$GetItem(
          variables: Variables$Query$GetItem(id: id),
        ),
      );

      if (result.hasException) {
        throw ServerException(result.exception.toString());
      }

      final item = result.parsedData?.item;
      if (item == null) {
        throw ServerException('Item not found');
      }

      return YourModel.fromJson({
        'id': item.id,
        'name': item.name,
        'someField': item.someField,
      });
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
```

**2.6 Create Repository Implementation**
```bash
# Create file: lib/data/repositories/your_repository_impl.dart
```
```dart
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../core/error/exceptions.dart';
import '../../core/error/failures.dart';
import '../../domain/entities/your_entity.dart';
import '../../domain/repositories/your_repository.dart';
import '../datasources/your_remote_data_source.dart';

@LazySingleton(as: YourRepository)
class YourRepositoryImpl implements YourRepository {
  final YourRemoteDataSource remoteDataSource;

  YourRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<YourEntity>>> getItems({required int page}) async {
    try {
      final items = await remoteDataSource.getItems(page: page);
      return Right(items);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected error occurred'));
    }
  }

  @override
  Future<Either<Failure, YourEntity>> getItem({required String id}) async {
    try {
      final item = await remoteDataSource.getItem(id: id);
      return Right(item);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected error occurred'));
    }
  }
}
```

**2.7 Register Dependencies**
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Step 3: Create Presentation Layer

**3.1 Create Events**
```bash
# Create file: lib/presentation/bloc/your_event.dart
```
```dart
import 'package:equatable/equatable.dart';

abstract class YourEvent extends Equatable {
  const YourEvent();

  @override
  List<Object?> get props => [];
}

class GetItemsEvent extends YourEvent {
  final int page;

  const GetItemsEvent({required this.page});

  @override
  List<Object?> get props => [page];
}

class GetItemEvent extends YourEvent {
  final String id;

  const GetItemEvent({required this.id});

  @override
  List<Object?> get props => [id];
}
```

**3.2 Create States**
```bash
# Create file: lib/presentation/bloc/your_state.dart
```
```dart
import 'package:equatable/equatable.dart';
import '../../domain/entities/your_entity.dart';

abstract class YourState extends Equatable {
  const YourState();

  @override
  List<Object?> get props => [];
}

class YourInitial extends YourState {}

class YourLoading extends YourState {}

class ItemsLoaded extends YourState {
  final List<YourEntity> items;

  const ItemsLoaded({required this.items});

  @override
  List<Object?> get props => [items];
}

class ItemLoaded extends YourState {
  final YourEntity item;

  const ItemLoaded({required this.item});

  @override
  List<Object?> get props => [item];
}

class YourError extends YourState {
  final String message;

  const YourError({required this.message});

  @override
  List<Object?> get props => [message];
}
```

**3.3 Create BLoC**
```bash
# Create file: lib/presentation/bloc/your_bloc.dart
```
```dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/get_items.dart';
import '../../domain/usecases/get_item.dart';
import 'your_event.dart';
import 'your_state.dart';

@injectable
class YourBloc extends Bloc<YourEvent, YourState> {
  final GetItems getItems;
  final GetItem getItem;

  YourBloc({
    required this.getItems,
    required this.getItem,
  }) : super(YourInitial()) {
    on<GetItemsEvent>(_onGetItems);
    on<GetItemEvent>(_onGetItem);
  }

  Future<void> _onGetItems(
    GetItemsEvent event,
    Emitter<YourState> emit,
  ) async {
    emit(YourLoading());
    final result = await getItems(GetItemsParams(page: event.page));
    result.fold(
      (failure) => emit(YourError(message: failure.message)),
      (items) => emit(ItemsLoaded(items: items)),
    );
  }

  Future<void> _onGetItem(
    GetItemEvent event,
    Emitter<YourState> emit,
  ) async {
    emit(YourLoading());
    final result = await getItem(GetItemParams(id: event.id));
    result.fold(
      (failure) => emit(YourError(message: failure.message)),
      (item) => emit(ItemLoaded(item: item)),
    );
  }
}
```

**3.4 Create Pages**
```bash
# Create files:
# lib/presentation/pages/your_list_page.dart
# lib/presentation/pages/your_detail_page.dart
```

Use existing pages (character_list_page.dart, episode_list_page.dart) as templates!

**3.5 Register BLoC**
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Step 4: Add to Dashboard

**4.1 Import New Page**
```dart
// In lib/presentation/pages/dashboard_page.dart
import 'your_list_page.dart';
```

**4.2 Add Navigation**
Add a new stat card or menu card with navigation to your new page.

### Step 5: Test Your Feature

```bash
# Run the app
flutter run

# Navigate to your new feature
# Test all scenarios:
# - Loading state
# - Success state
# - Error state
# - Pull to refresh
# - Navigation to detail
```

---

## 🔧 Common Tasks

### Task 1: Add a New GraphQL Query

1. Create `.graphql` file in `lib/data/graphql/`
2. Run `flutter pub run build_runner build --delete-conflicting-outputs`
3. Import generated file: `import '../graphql/__generated__/your_query.graphql.dart';`
4. Use in data source: `graphQLClient.client.query$YourQuery(...)`

### Task 2: Update an Existing Entity

1. Edit entity in `lib/domain/entities/`
2. Update model in `lib/data/models/`
3. Update GraphQL query in `lib/data/graphql/`
4. Regenerate: `flutter pub run build_runner build --delete-conflicting-outputs`
5. Update UI to display new fields

### Task 3: Add Dependency Injection

1. Add `@injectable` or `@LazySingleton` annotation to class
2. Make sure constructor parameters are also injectable
3. Run `flutter pub run build_runner build --delete-conflicting-outputs`
4. Use `getIt<YourClass>()` to retrieve instance

### Task 4: Fix Build Errors After Changes

```bash
# Clean everything
flutter clean

# Get dependencies
flutter pub get

# Regenerate all code
flutter pub run build_runner build --delete-conflicting-outputs

# If still issues, try:
rm -rf build/
flutter pub cache repair
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### Task 5: Update Dependencies

```bash
# Check for outdated packages
flutter pub outdated

# Update all dependencies
flutter pub upgrade

# Regenerate code (important after updates!)
flutter pub run build_runner build --delete-conflicting-outputs

# Test that everything still works
flutter test
flutter run
```

---

## 🐛 Troubleshooting

### Problem: Build Runner Fails

**Symptoms:**
```
Error: ... conflicts with ...
Failed to build with build_runner
```

**Solution:**
```bash
flutter clean
rm -rf .dart_tool/
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### Problem: GraphQL Type Not Found

**Symptoms:**
```
Error: Failed to find type for field 'yourField' on Query
```

**Solution:**
1. Check that field exists in `schema.graphql`
2. Verify spelling matches exactly
3. Regenerate: `flutter pub run build_runner build --delete-conflicting-outputs`

### Problem: GetIt Cannot Find Dependency

**Symptoms:**
```
Error: GetIt: Object of type SomeClass is not registered
```

**Solution:**
1. Add `@injectable` or `@LazySingleton` to the class
2. Ensure all constructor parameters are also injectable
3. Regenerate DI: `flutter pub run build_runner build --delete-conflicting-outputs`
4. Check that `configureDependencies()` is called in `main.dart`

### Problem: Hot Reload Not Working

**Symptoms:**
- Changes not reflecting in app
- Need to restart app to see changes

**Solution:**
- For code changes: Use hot reload (press `r` in terminal)
- For state changes: Use hot restart (press `R` in terminal)
- For DI/generated code changes: Full restart required
- For asset changes: Full restart required

### Problem: API Not Returning Data

**Symptoms:**
- Loading forever
- "No data found" error

**Solution:**
1. Check internet connection
2. Verify API endpoint in `graphql_client.dart`
3. Check GraphQL query syntax
4. Test query in GraphQL playground: https://rickandmortyapi.com/graphql
5. Check network logs in DevTools

---

## 📚 Resources

### Official Documentation
- **Flutter Docs:** https://docs.flutter.dev/
- **Dart Docs:** https://dart.dev/guides
- **BLoC Library:** https://bloclibrary.dev/
- **GraphQL Codegen:** https://pub.dev/packages/graphql_codegen
- **Injectable:** https://pub.dev/packages/injectable

### Internal Documentation
- **PROJECT_RULES.md** - Coding standards and conventions
- **CLEAN_ARCHITECTURE_README.md** - Architecture deep dive
- **ARCHITECTURE_DIAGRAM.md** - Visual architecture guide
- **CUSTOMIZATION_GUIDE.md** - How to extend features
- **NEW_FEATURES_SUMMARY.md** - Recently added features

### Learning Resources
- **Clean Architecture:** https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html
- **BLoC Pattern:** https://www.youtube.com/watch?v=THCkkQ-V1-8
- **Dependency Injection in Flutter:** https://medium.com/flutter-community/dependency-injection-in-flutter-f19fb66a0740

### API Documentation
- **Rick & Morty API:** https://rickandmortyapi.com/documentation
- **GraphQL Playground:** https://rickandmortyapi.com/graphql

---

## 💬 Getting Help

### When You're Stuck

1. **Check Documentation**
   - Read relevant section in this guide
   - Check PROJECT_RULES.md for standards
   - Look at existing similar features as examples

2. **Search Existing Code**
   - Find similar implementations (e.g., look at character feature for reference)
   - Use VS Code search: `Cmd+Shift+F` (Mac) or `Ctrl+Shift+F` (Windows/Linux)

3. **Debug**
   - Add print statements: `print('Debug: $variable');`
   - Use debugger breakpoints in VS Code
   - Check DevTools for network/performance issues

4. **Ask for Help**
   - Create detailed issue with:
     - What you're trying to do
     - What you've tried
     - Error messages
     - Code snippets
   - Tag relevant team members
   - Reference this guide section you've read

---

## ✅ Your First Contribution Checklist

Before submitting your first PR:

- [ ] I've read PROJECT_RULES.md
- [ ] I've read this DEVELOPER_GUIDE.md
- [ ] I understand the clean architecture structure
- [ ] I can run the app successfully
- [ ] I've completed the feature following the step-by-step guide
- [ ] My code follows naming conventions
- [ ] I've run `flutter analyze` with no errors
- [ ] I've run `dart format .`
- [ ] I've tested on at least one device
- [ ] I've updated documentation if needed
- [ ] My commit messages follow the format
- [ ] I've created a descriptive PR

---

## 🎓 Next Steps

After reading this guide:

1. **Set up your environment** (Step 1-4 in Quick Start)
2. **Explore the codebase** (Read existing features)
3. **Make a small change** (Update a text or color)
4. **Add a simple feature** (Follow "Adding New Features" guide)
5. **Review a PR** (Learn from others' code)
6. **Ask questions** (Better to ask than to guess!)

---

**Welcome to the team! Happy coding! 🚀**

*Last Updated: February 3, 2026*
*For questions or suggestions, contact the tech lead*
