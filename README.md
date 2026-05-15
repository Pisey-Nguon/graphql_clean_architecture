# GraphQL Clean Architecture Sample

A Flutter sample that demonstrates how to build a GraphQL application with Clean Architecture, generated GraphQL operation models, dependency injection, and BLoC-driven presentation.

This repository is intentionally small enough to study, but structured the same way you would structure a production feature-based app: clear layer boundaries, generated integration code kept isolated, and app-wide concerns such as theme and routing centralized.

## What This Project Shows

- Clean Architecture with `presentation`, `domain`, `data`, and `core` layers
- GraphQL integration using `graphql_flutter` and `graphql_codegen`
- Dependency injection with `get_it` and `injectable`
- `Either<Failure, T>`-based repository results
- Route registration in one place with typed route arguments
- A generated-model workflow that stays out of the domain layer

## Architecture Snapshot

```text
main.dart
  -> app/app.dart
    -> core/navigation/app_router.dart
    -> core/config/app_theme.dart

presentation/
  -> blocs receive UI events
  -> pages/widgets render state and dispatch events

domain/
  -> entities, repository contracts, use cases

data/
  -> GraphQL documents, generated operation types, models, data sources,
     repository implementations

core/
  -> DI, app config, navigation, network, errors, base use cases
```

## `lib/` Structure

```text
lib/
├── app/
│   └── app.dart                       # Root MaterialApp configuration
├── core/
│   ├── config/
│   │   ├── app_endpoint.dart         # Endpoint and flavor selection
│   │   └── app_theme.dart            # Shared theme
│   ├── di/
│   │   ├── injection_container.dart
│   │   └── injection_container.config.dart   # generated
│   ├── error/
│   │   ├── exceptions.dart
│   │   └── failures.dart
│   ├── navigation/
│   │   └── app_router.dart           # Named routes and typed args
│   ├── network/
│   │   └── graphql_client.dart
│   └── usecase/
│       └── usecase.dart
├── data/
│   ├── datasources/
│   ├── graphql/
│   │   ├── *.graphql                 # Source documents for codegen
│   │   ├── schema.graphql            # Local SDL snapshot of the backend schema
│   │   └── __generated__/            # generated, do not edit
│   ├── models/
│   └── repositories/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
├── presentation/
│   ├── bloc/
│   ├── pages/
│   └── widgets/
└── main.dart
```

## Request Flow

1. A page or widget dispatches a BLoC event.
2. The BLoC calls a domain use case.
3. The use case calls a domain repository contract.
4. The data-layer repository implementation delegates to a data source.
5. The data source executes a generated GraphQL query and maps the response into domain entities.
6. The repository converts exceptions into `Failure` values.
7. The BLoC emits the next UI state.

The important constraint is that the domain layer never knows anything about Flutter widgets, GraphQL client types, or generated operation classes.

## Quick Start

### Prerequisites

- Flutter 3.10+
- Dart 3.10+
- Xcode or Android Studio for target platforms

### Install And Run

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

### Useful Validation Commands

```bash
flutter analyze
flutter test
dart format lib test
dart run build_runner build --delete-conflicting-outputs
```

### Refresh `schema.graphql` after backend updates

The generated Dart operation types come from your `.graphql` documents plus the codegen configuration. The committed `lib/data/graphql/schema.graphql` file is a local SDL snapshot that is useful for inspection and for keeping the repository aligned with the backend contract.

To download the latest schema into this project:

```bash
npx --yes @graphql-inspector/cli introspect https://rickandmortyapi.com/graphql --write lib/data/graphql/schema.graphql
dart run build_runner build --delete-conflicting-outputs
```

If your backend requires authentication, add one or more headers:

```bash
npx --yes @graphql-inspector/cli introspect https://your-backend/graphql \
  -h "Authorization: Bearer <token>" \
  --write lib/data/graphql/schema.graphql
dart run build_runner build --delete-conflicting-outputs
```

Use `dart run`, not `flutter pub run`, for build runner commands.

### Optional Auth Token

This sample uses the public Rick and Morty GraphQL API and does not need auth.

If another project built from this structure does need a token, pass it explicitly instead of hardcoding credentials:

```bash
flutter run --dart-define=GRAPHQL_AUTH_TOKEN=<token>
```

## How To Add Work In This Structure

### Add A New Screen Using Existing Data

Use this path when the domain and data layers already exist and you only need a new page or flow.

1. Create the page in `presentation/pages/`.
2. Extract reusable UI into `presentation/widgets/` if it is shared by more than one page.
3. If the screen needs state transitions, add or extend the relevant BLoC in `presentation/bloc/`.
4. Register the route in `lib/core/navigation/app_router.dart`.
5. Navigate with `Navigator.of(context).pushNamed(...)` instead of creating pages inline.
6. Keep page-specific colors and layout details local, but keep app-wide theme decisions in `lib/core/config/app_theme.dart`.

### Add A New Feature End To End

Use this path when the app needs a new vertical slice, for example `residents`, `favorites`, or `episodes by character`.

1. Create the domain entity in `domain/entities/`.
2. Add the domain repository contract in `domain/repositories/`.
3. Add one or more use cases in `domain/usecases/`.
4. Create GraphQL documents in `data/graphql/`.
5. Run code generation.
6. Map generated GraphQL types into data models in `data/models/`.
7. Implement the remote data source in `data/datasources/`.
8. Implement the repository in `data/repositories/` and convert exceptions to failures.
9. Add the presentation BLoC, page, and widgets.
10. Register the new route and expose entry points from the dashboard or an existing detail page.
11. Run formatter, analyzer, and tests.

## Working With Generated GraphQL Code

- Edit only the source GraphQL document files and handwritten model/data-source files.
- Do not edit files in `__generated__/`, `.g.dart`, or `.config.dart` directly.
- Re-run build runner after changing GraphQL operations, injectable annotations, or json serializable models.
- Keep generated GraphQL response classes in the data layer. Convert them before crossing into domain.

## Project Conventions

- Use `Failure` in repositories and `Exception` in data sources.
- Keep BLoCs thin. Domain rules belong in use cases.
- Keep entities framework-agnostic.
- Prefer adding shared app behavior to `core/` or `app/`, not to individual pages.
- Route names and route argument types live in one place: `lib/core/navigation/app_router.dart`.

## Suggested Feature Checklist

Before opening a PR for a new feature, verify:

- New GraphQL documents compile through codegen.
- DI generation still succeeds.
- The feature route is registered.
- Repository methods return `Either<Failure, T>`.
- The UI handles loading, success, and error states.
- `flutter analyze` and `flutter test` pass.

## Supporting Docs

- `DEVELOPER_GUIDE.md`: local setup, daily workflow, code generation, and schema refresh
- `PROJECT_RULES.md`: architecture boundaries and project conventions
- `CLEAN_ARCHITECTURE_README.md`: the deeper explanation of why this repo is structured this way
- `CONTRIBUTING.md`: contribution process