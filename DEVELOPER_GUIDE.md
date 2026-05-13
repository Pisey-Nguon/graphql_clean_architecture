# Developer Guide

This guide is for engineers who need to extend this sample or use it as a template for another GraphQL + Clean Architecture Flutter project.

## 1. First-Time Setup

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter analyze
flutter test
flutter run
```

If you change injectable annotations, GraphQL documents, or serializable models, run build runner again.

## 2. The Responsibility Of Each Layer

### `app/`

- Owns the root `MaterialApp`
- Pulls together theme and route generation
- Should not contain feature logic

### `presentation/`

- Pages, widgets, and BLoCs
- Converts user actions into events
- Renders loading, success, empty, and error states
- Can depend on domain and core

### `domain/`

- Entities
- Repository interfaces
- Use cases
- Must remain pure Dart

### `data/`

- GraphQL documents and generated operation classes
- Data models
- Remote data sources
- Repository implementations
- Can depend on domain and core

### `core/`

- Cross-cutting concerns used by multiple features
- DI, network, theme config, routes, failures, exceptions, base abstractions

## 3. The Standard Feature Shape

Every new feature should follow the same sequence:

```text
presentation -> domain -> data -> remote GraphQL
```

Recommended file checklist:

```text
domain/entities/<feature>.dart
domain/repositories/<feature>_repository.dart
domain/usecases/get_<feature>.dart
data/graphql/get_<feature>.graphql.dart
data/graphql/__generated__/get_<feature>.graphql.dart   # generated
data/models/<feature>_model.dart
data/datasources/<feature>_remote_data_source.dart
data/repositories/<feature>_repository_impl.dart
presentation/bloc/<feature>_bloc.dart
presentation/pages/<feature>_page.dart
presentation/widgets/<feature>_*.dart
```

If a screen only reuses an existing feature, you do not need the whole stack. Add only the presentation pieces and route registration.

## 4. Adding A New Screen

Use this workflow for a new page that uses already-existing repositories and use cases.

1. Create the page in `presentation/pages/`.
2. If the page needs local reusable UI, extract it to `presentation/widgets/`.
3. If the page needs event/state coordination, reuse or extend the feature BLoC.
4. Register the page in `lib/core/navigation/app_router.dart`.
5. Navigate with named routes and typed route arguments.
6. Keep the route entrypoint small. Heavy logic belongs in BLoC or use case code.

Questions to ask before creating a new BLoC:

- Is the state lifecycle different from the existing page?
- Will the screen fetch a different use case or combine multiple use cases?
- Is the state reusable elsewhere?

If the answer is mostly no, prefer reusing the existing BLoC or a smaller widget-level state object.

## 5. Adding A New Feature End To End

### Step 1: Define The Domain

Create the entity, repository contract, and use cases first.

Rules:

- Entities should not import Flutter.
- Repository contracts return `Either<Failure, T>`.
- Use cases should be very small orchestration units.

### Step 2: Add GraphQL Documents

Create a GraphQL document in `lib/data/graphql/`.

Example shape:

```graphql
query GetResidents($page: Int!) {
  residents(page: $page) {
    results {
      id
      name
    }
  }
}
```

Then run:

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Step 3: Build The Data Layer

1. Map the generated GraphQL response into a handwritten model.
2. Keep parsing and API details inside the data source.
3. Translate exceptions into failures in the repository implementation.

Repository rule of thumb:

- Data source throws `ServerException`, `NetworkException`, or another explicit exception.
- Repository catches those exceptions and returns the corresponding `Failure`.

### Step 4: Build The Presentation Layer

1. Add BLoC events and states for the feature flow.
2. Dispatch the initial event from the page entrypoint.
3. Handle loading, success, and error states in the page.
4. Extract repeatable UI into widgets.

### Step 5: Integrate The Feature

1. Register DI annotations if a new data source, repository, use case, or BLoC was added.
2. Re-run build runner.
3. Register the route in `app_router.dart`.
4. Add a navigation entry from the dashboard or another relevant screen.

## 6. Routing Rules

- Top-level routes and detail routes are defined in `lib/core/navigation/app_router.dart`.
- Use typed argument classes for detail pages instead of passing raw maps.
- Prefer `pushNamed` over inline `MaterialPageRoute` when a route already exists.
- Keep route generation declarative and side-effect free.

## 7. Theme Rules

- Shared theme decisions belong in `lib/core/config/app_theme.dart`.
- Feature pages can still use local accent colors when the page identity benefits from it.
- Do not recreate app-wide typography or snack bar policy in leaf pages.

## 8. GraphQL Rules

- Generated GraphQL classes stay in the data layer.
- The domain layer should never import generated GraphQL files.
- This sample does not require auth.
- If a downstream project needs auth, pass `GRAPHQL_AUTH_TOKEN` with `--dart-define` instead of hardcoding it.

Example:

```bash
flutter run --dart-define=GRAPHQL_AUTH_TOKEN=<token>
```

## 9. Regeneration Triggers

Run build runner when any of these change:

- `@injectable`, `@LazySingleton`, or other injectable annotations
- GraphQL operation documents
- json serializable models

Command:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## 10. Common Development Commands

```bash
dart format lib test
flutter analyze
flutter test
flutter clean
flutter pub get
```

## 11. Review Checklist For New Work

Before merging, verify all of the following:

- Layer dependencies still flow inward.
- No generated file was edited manually.
- New routes are registered in one place.
- New repositories return `Either<Failure, T>`.
- New pages handle loading and error states.
- Analyzer and tests pass.
- README or guide docs were updated if the workflow changed.

## 12. When To Create Shared Code

Promote something to `core/` only if it is genuinely cross-cutting.

Good candidates:

- Shared route registration
- Theme setup
- Error abstractions
- Common network services

Keep feature-specific layout, display formatting, and one-off widgets inside `presentation/` unless there is proven reuse.