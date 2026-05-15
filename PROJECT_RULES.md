# Project Rules

These are the conventions that keep this repository usable as a clean-architecture template.

## Core Rules

1. Keep dependencies pointing inward.
2. Keep the domain layer pure Dart.
3. Keep GraphQL and generated transport types in the data layer.
4. Convert transport data into domain entities before it reaches use cases or UI.
5. Convert exceptions into failures at the repository boundary.

## Layer Rules

### Presentation

- Pages may depend on Flutter, BLoC, route helpers, and domain entities.
- BLoCs should coordinate use cases, not implement business logic directly.
- Shared loading, error, and empty states should use common presentation widgets when possible.

### Domain

- Entities must not import Flutter, GraphQL, or generated files.
- Repository contracts belong here.
- Use cases should be small and explicit.
- Return `Either<Failure, T>` from use cases and repositories.

### Data

- Data sources may throw exceptions.
- Repositories must catch those exceptions and return failures.
- Mapper extensions are the preferred way to translate generated GraphQL classes into domain entities.
- Do not let generated result classes escape the data layer.

### Core

- Put app-wide concerns in `core/` only when they are truly cross-cutting.
- Keep route names and route argument classes centralized in `lib/core/navigation/app_router.dart`.
- Keep GraphQL client creation in one place.

## Code Generation Rules

- Edit `.graphql` documents, not generated Dart files.
- Edit DI annotations, not generated DI config.
- Run `dart run build_runner build --delete-conflicting-outputs` after GraphQL, DI, or serialization changes.
- Commit generated files that are part of the repository workflow.

## Error Handling Rules

- Throw exceptions in data sources.
- Return failures from repositories.
- Show user-facing error states in presentation.
- Avoid swallowing errors silently.

## Navigation Rules

- Register routes in one place.
- Prefer typed route argument classes over unstructured maps.
- Prefer route helper extensions on `BuildContext` instead of scattering raw `pushNamed` calls.

## Testing Rules

- Add at least one focused test for each new use case.
- Add repository tests for success and failure mapping.
- Add BLoC tests when state transitions become non-trivial.
- Run `flutter analyze` and `flutter test` before opening a PR.

## Template Rules For Real Projects

- Replace sample endpoints before shipping.
- Remove placeholder UI behavior or mark it clearly as not implemented.
- Add environment-specific configuration early.
- Decide on caching, persistence, auth refresh, and pagination as first-class architecture concerns, not later patches.
- Keep the sample's folder clarity even if you later group files by feature.

## Change Checklist

Before merging a change, verify these points:

- The layer boundary still makes sense.
- No generated type leaked into domain or presentation.
- New routes are registered centrally.
- Repositories still return failures instead of throwing transport exceptions upward.
- Code generation, analysis, and tests still pass.