# Clean Architecture Notes

This repository is a small but real vertical-slice Flutter app. It is useful as a teaching project because it shows the full request path from page to backend and back without hiding that flow behind too much framework code.

Use it as a reference for structure and boundaries, not as a direct copy of every UI or product decision.

## What Is Actually Implemented

The project has three backend-backed feature slices:

- Characters: list and detail
- Episodes: list and detail
- Locations: list and detail

It also has three app-level surfaces:

- Dashboard: entry page that routes to the feature areas
- Search: client-side filtering over loaded characters
- Settings: mostly static placeholder page for app-level controls

That distinction matters if you plan to reuse this as a template. The backend and domain patterns are strongest in the character, episode, and location slices. Search and settings mainly show presentation patterns.

## Architectural Goal

The main rule is simple: dependencies point inward.

- Presentation depends on domain use cases.
- Domain depends only on abstractions and entities.
- Data depends on domain contracts and on infrastructure details such as GraphQL.
- Core holds app-wide concerns that are shared across slices.

The domain layer does not know about Flutter widgets, GraphQL result classes, or generated files.

## Layer Responsibilities

### Presentation

Presentation lives in `lib/presentation/`.

- Pages set up screens and `BlocProvider`s.
- BLoCs translate UI events into use case calls.
- Widgets render loading, success, empty, and error states.

Patterns worth copying:

- Shared UI state widgets live in `presentation/widgets/app_state_views.dart`.
- Route helpers live in `core/navigation/app_router.dart` and keep navigation type-safe.
- `CharacterDetailPage` can receive an `initialCharacter` and skip a second fetch when the list page already has enough data.

### Domain

Domain lives in `lib/domain/`.

- Entities are plain Dart value objects using `Equatable`.
- Repository interfaces define what the app needs, not how data is fetched.
- Use cases are thin and return `Either<Failure, T>`.

This layer is intentionally boring. That is a good sign. If domain code starts importing GraphQL, Flutter, or generated models, the boundary is already leaking.

### Data

Data lives in `lib/data/`.

- GraphQL documents are the source of truth for requested fields.
- Generated files under `lib/data/graphql/__generated__/` provide strongly typed operations.
- Data sources execute queries and throw exceptions.
- Repositories catch those exceptions and convert them into domain-facing failures.
- Mappers convert generated GraphQL classes into domain entities.

The mapper layer is one of the better patterns in this repo. It keeps generated code from spreading into the rest of the app.

### Core

Core lives in `lib/core/`.

- `config/` contains endpoint and theme setup.
- `di/` contains `get_it` and `injectable` wiring.
- `error/` defines shared exceptions and failures.
- `navigation/` centralizes route names, route argument types, and navigation helpers.
- `network/` owns GraphQL client construction.
- `usecase/` defines the base use case contract.

## End-to-End Flow

The character list flow is the easiest slice to study.

1. `CharacterListPage` resolves `CharacterBloc` from DI and dispatches `GetCharactersEvent(page: 1)`.
2. `CharacterBloc` calls `GetCharacters`.
3. `GetCharacters` calls the `CharacterRepository` contract.
4. `CharacterRepositoryImpl` delegates to `CharacterRemoteDataSource`.
5. `CharacterRemoteDataSourceImpl` executes the generated `query$GetCharacters` operation.
6. `character_mapper.dart` converts generated result objects into `Character` entities.
7. `CharacterRepositoryImpl` returns `Right(List<Character>)` on success or maps exceptions into `Left(Failure)`.
8. `CharacterBloc` emits `CharactersLoaded` or `CharacterError`.
9. `CharacterListWidget` renders the next UI state.

That flow is the core reason this repository works well as a role model. Each step has one job and the dependencies are predictable.

## Why The Current Structure Works

- The app shell is tiny. `main.dart` only initializes DI and boots `MyApp`.
- Routing is centralized. Pages do not hardcode route names across the codebase.
- Generated code stays in the data layer.
- Exceptions are translated once, at the repository boundary.
- Shared app concerns are not buried inside a specific feature.

## GraphQL And Code Generation Model

There are three separate artifacts to keep straight:

1. `lib/data/graphql/*.graphql`
These are the handwritten operation documents.

2. `lib/data/graphql/__generated__/*.dart`
These are generated Dart operation models and client helpers.

3. `lib/data/graphql/schema.graphql`
This is a checked-in SDL snapshot of the backend schema.

In daily Flutter development, the files that matter most are the handwritten operation documents and the generated Dart files. The local schema snapshot is useful documentation and a good way to keep the repo aligned with backend changes, but the architecture boundary still sits at the mapper and repository layers.

## What To Reuse In A Real Project

These parts are strong candidates to keep:

- The folder split between `presentation`, `domain`, `data`, and `core`
- Repository interfaces in domain and implementations in data
- Mapper extensions for converting generated transport types into domain entities
- Type-safe route argument classes and route helper extensions
- A single DI entry point
- Failure-based repository results with `Either`

These parts should be treated as sample-only and adapted:

- Hardcoded sample counts on the dashboard
- Placeholder favorites and settings actions
- Search implemented only as client-side filtering over the first loaded page
- A single remote-only data source strategy with no caching or persistence
- Minimal test coverage focused on one slice

## If You Turn This Into A Production Template

Raise the bar in these areas first:

- Replace `AppEndpoint` with environment-specific endpoints for dev, staging, and prod.
- Add auth token handling rules per environment.
- Add pagination strategy beyond the first page.
- Decide whether you need caching, offline support, or local persistence.
- Add BLoC tests and integration tests, not just repository and use case tests.
- Add feature-level folders if the app grows beyond a few slices.

## Reading Order For New Developers

If someone joins the project and needs to understand it quickly, point them here:

1. `README.md` for the project shape and setup commands.
2. `lib/core/navigation/app_router.dart` to see the app surface.
3. `lib/presentation/bloc/character_bloc.dart` for the presentation-to-domain handoff.
4. `lib/domain/usecases/get_characters.dart` and `lib/domain/repositories/character_repository.dart` for the domain contract.
5. `lib/data/datasources/character_remote_data_source.dart`, `lib/data/repositories/character_repository_impl.dart`, and `lib/data/mappers/character_mapper.dart` for the data path.
6. `DEVELOPER_GUIDE.md` for the day-to-day workflow.

If those files make sense, the rest of the codebase follows the same pattern.