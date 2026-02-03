# Clean Architecture + GraphQL Flutter Project

This project demonstrates a Flutter application built with **Clean Architecture** principles and **GraphQL** integration using the Rick and Morty API.

## 🏗️ Architecture Overview

The project follows Clean Architecture with three main layers:

### 1. **Presentation Layer** (`lib/presentation/`)
- **BLoC**: State management using flutter_bloc
- **Pages**: UI screens
- **Widgets**: Reusable UI components

### 2. **Domain Layer** (`lib/domain/`)
- **Entities**: Business models (Character)
- **Repositories**: Abstract repository interfaces
- **Use Cases**: Business logic (GetCharacters, GetCharacter)

### 3. **Data Layer** (`lib/data/`)
- **Models**: Data models with JSON serialization
- **Data Sources**: Remote data sources for API calls
- **Repositories**: Implementation of domain repositories

### 4. **Core Layer** (`lib/core/`)
- **DI**: Dependency injection setup (get_it + injectable)
- **Network**: GraphQL client configuration
- **Error**: Error handling (Failures & Exceptions)
- **UseCase**: Base use case interface

## 📦 Key Dependencies

- **graphql_flutter** (^5.1.2): GraphQL client
- **flutter_bloc** (^8.1.3): State management
- **get_it** (^7.6.4): Service locator for DI
- **injectable** (^2.3.2): Code generation for DI
- **dartz** (^0.10.1): Functional programming (Either type)
- **equatable** (^2.0.5): Value equality
- **freezed** (^2.4.5): Code generation for models
- **json_serializable** (^6.7.1): JSON serialization

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.10.8 or higher)
- Dart SDK

### Installation

1. **Install dependencies:**
   ```bash
   flutter pub get
   ```

2. **Generate code:**
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

3. **Run the app:**
   ```bash
   flutter run
   ```

## 📱 Features

- **Character List**: Displays a list of Rick and Morty characters
- **Character Details**: Shows detailed information about a selected character
- **Pull to Refresh**: Reload character list
- **Error Handling**: Graceful error messages with retry functionality
- **Hero Animations**: Smooth transitions between screens

## 🔧 Project Structure

```
lib/
├── core/
│   ├── di/
│   │   ├── injection_container.dart
│   │   └── injection_container.config.dart (generated)
│   ├── error/
│   │   ├── exceptions.dart
│   │   └── failures.dart
│   ├── network/
│   │   └── graphql_client.dart
│   └── usecase/
│       └── usecase.dart
├── data/
│   ├── datasources/
│   │   └── character_remote_data_source.dart
│   ├── models/
│   │   ├── character_model.dart
│   │   └── character_model.g.dart (generated)
│   └── repositories/
│       └── character_repository_impl.dart
├── domain/
│   ├── entities/
│   │   └── character.dart
│   ├── repositories/
│   │   └── character_repository.dart
│   └── usecases/
│       ├── get_character.dart
│       └── get_characters.dart
├── presentation/
│   ├── bloc/
│   │   ├── character_bloc.dart
│   │   ├── character_event.dart
│   │   └── character_state.dart
│   ├── pages/
│   │   ├── character_detail_page.dart
│   │   └── character_list_page.dart
│   └── widgets/
│       └── character_list_widget.dart
└── main.dart
```

## 🔄 Data Flow

1. **UI** triggers an event (e.g., load characters)
2. **BLoC** receives the event
3. **BLoC** calls appropriate **Use Case**
4. **Use Case** calls **Repository** interface
5. **Repository Implementation** uses **Data Source**
6. **Data Source** makes **GraphQL** API call
7. **Result** flows back through the layers
8. **BLoC** emits new **State**
9. **UI** rebuilds based on new state

## 🎯 Clean Architecture Benefits

- **Independence**: Each layer is independent and testable
- **Flexibility**: Easy to swap implementations
- **Maintainability**: Clear separation of concerns
- **Testability**: Easy to write unit tests for each layer
- **Scalability**: Easy to add new features

## 🔌 GraphQL Integration

The project uses the Rick and Morty GraphQL API:
- **Endpoint**: `https://rickandmortyapi.com/graphql`
- **Queries**: GetCharacters, GetCharacter

### Example Query:
```graphql
query GetCharacters($page: Int!) {
  characters(page: $page) {
    results {
      id
      name
      status
      species
      image
    }
  }
}
```

## 📝 How to Extend

### Adding a New Feature:

1. **Create Entity** in `domain/entities/`
2. **Create Repository Interface** in `domain/repositories/`
3. **Create Use Case** in `domain/usecases/`
4. **Create Model** in `data/models/`
5. **Create Data Source** in `data/datasources/`
6. **Implement Repository** in `data/repositories/`
7. **Create BLoC** in `presentation/bloc/`
8. **Create UI** in `presentation/pages/` and `presentation/widgets/`
9. **Run build_runner** to generate code
10. **Register dependencies** will be auto-generated by injectable

## 🧪 Testing

The architecture makes it easy to write tests for each layer:

- **Unit Tests**: Test use cases and repositories
- **Widget Tests**: Test UI components
- **Integration Tests**: Test complete features

## 🔐 Environment Configuration

To use your own GraphQL endpoint:
1. Open `lib/core/network/graphql_client.dart`
2. Update the `HttpLink` URL
3. Configure authentication if needed

## 📚 Resources

- [Clean Architecture by Uncle Bob](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Flutter BLoC Documentation](https://bloclibrary.dev/)
- [GraphQL Flutter Documentation](https://github.com/zino-hofmann/graphql-flutter)
- [Rick and Morty API](https://rickandmortyapi.com/documentation)

## 🤝 Contributing

Feel free to contribute to this project by:
1. Forking the repository
2. Creating a feature branch
3. Making your changes
4. Submitting a pull request

## 📄 License

This project is open-source and available under the MIT License.
