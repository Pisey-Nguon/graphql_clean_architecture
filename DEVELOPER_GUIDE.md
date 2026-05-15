# Developer Guide

This guide is for day-to-day work in the repository: setup, code generation, feature development, and schema refresh.

## Prerequisites

- Flutter 3.10 or newer
- Dart 3.10 or newer
- Xcode or Android Studio for device builds
- Node.js and npm only if you want to refresh the checked-in `schema.graphql` snapshot from the command line

## First-Time Setup

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

Recommended validation commands:

```bash
flutter analyze
flutter test
dart format lib test
dart run build_runner build --delete-conflicting-outputs
```

Prefer `dart run build_runner ...` over `flutter pub run build_runner ...`.

## Daily Workflow

### When you change GraphQL documents

If you edit any file in `lib/data/graphql/*.graphql`:

1. Update the operation fields or variables.
2. Run code generation.
3. Update the mapper if the returned shape changed.
4. Update the data source or repository if the behavior changed.
5. Run `flutter analyze` and the relevant tests.

Command:

```bash
dart run build_runner build --delete-conflicting-outputs
```

### When you change DI annotations

If you add or change `@injectable`, `@lazySingleton`, or related DI wiring, rerun build runner so `injection_container.config.dart` stays in sync.

### When you add or change entities, repositories, or use cases

No generator is required for plain domain changes unless those changes also touch DI or JSON serialization.

## Feature Development Workflow

For a new backend-backed feature, follow this order:

1. Add or extend domain entities in `lib/domain/entities/`.
2. Define the repository contract in `lib/domain/repositories/`.
3. Add use cases in `lib/domain/usecases/`.
4. Create the GraphQL operation in `lib/data/graphql/`.
5. Run build runner.
6. Add mapper extensions in `lib/data/mappers/`.
7. Implement the remote data source in `lib/data/datasources/`.
8. Implement the repository in `lib/data/repositories/`.
9. Add the BLoC, page, and widgets in `lib/presentation/`.
10. Register routes and route args in `lib/core/navigation/app_router.dart`.
11. Run formatter, analyzer, and tests.

For a UI-only screen that reuses existing domain data, you usually only need the presentation layer plus route registration.

## GraphQL File Ownership

Edit these files:

- `lib/data/graphql/*.graphql`
- `lib/data/datasources/*.dart`
- `lib/data/mappers/*.dart`
- `lib/data/repositories/*.dart`

Do not edit these files by hand:

- `lib/data/graphql/__generated__/*.dart`
- `lib/core/di/injection_container.config.dart`
- `*.g.dart`

## How To Refresh `schema.graphql`

Use this when the backend schema changes and you want to update the checked-in schema snapshot inside the project.

### Public endpoint

```bash
npx --yes @graphql-inspector/cli introspect https://rickandmortyapi.com/graphql --write lib/data/graphql/schema.graphql
dart run build_runner build --delete-conflicting-outputs
```

### Authenticated endpoint

```bash
npx --yes @graphql-inspector/cli introspect https://your-backend/graphql \
  -h "Authorization: Bearer <token>" \
  --write lib/data/graphql/schema.graphql
dart run build_runner build --delete-conflicting-outputs
```

Notes:

- The schema file is an SDL snapshot committed to the repo.
- Build runner should be rerun after a schema refresh so generated operations stay aligned with the backend contract.
- If the backend adds breaking schema changes, expect mapper, data source, or operation-document updates before code generation succeeds cleanly.

## Runtime Configuration

The project supports endpoint flavor selection and optional GraphQL auth:

```bash
flutter run --dart-define=FLAVOR=dev
flutter run --dart-define=GRAPHQL_AUTH_TOKEN=<token>
flutter run --dart-define=FLAVOR=prod --dart-define=GRAPHQL_AUTH_TOKEN=<token>
```

Right now both `dev` and `prod` point to the same Rick and Morty endpoint. In a real project, replace those constants in `lib/core/config/app_endpoint.dart`.

## Troubleshooting

### Build runner says everything is skipped

That is normal when nothing changed.

### GraphQL generated types do not match your mapper

The usual causes are:

- The `.graphql` document changed and build runner was not rerun.
- The backend schema changed and the local snapshot was not refreshed.
- The mapper still assumes fields that are no longer selected in the operation.

### The app compiles but detail pages refetch unnecessarily

Check route arguments first. `CharacterDetailRouteArgs` supports an optional preloaded `Character`, which avoids a second request when navigating from a list item.

### You are unsure where to start reading the codebase

Start from the character slice. It is the clearest example of the intended architecture and has the most complete test coverage in the repository.