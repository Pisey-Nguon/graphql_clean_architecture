# 🚀 Rick & Morty Explorer - Clean Architecture Demo

A production-ready Flutter application demonstrating **Clean Architecture** with **GraphQL**, **BLoC**, and **Dependency Injection**.

[![Flutter](https://img.shields.io/badge/Flutter-3.10.8-blue)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.0.0-blue)](https://dart.dev/)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)

## 📱 Features

- 🎬 **Characters** - Browse all Rick & Morty characters
- 📺 **Episodes** - Explore show episodes by season
- 🌍 **Locations** - Discover dimensions and planets
- 🔍 **Search** - Find characters with filters
- ⚙️ **Settings** - App configuration

## 🏗️ Architecture

This project follows **Clean Architecture** principles:

```
┌─────────────────────────────────────────┐
│         Presentation Layer              │
│  (Pages, Widgets, BLoC)                 │
└────────────┬────────────────────────────┘
             │
             ↓
┌─────────────────────────────────────────┐
│           Domain Layer                  │
│  (Entities, Use Cases, Repositories)    │
└────────────┬────────────────────────────┘
             │
             ↓
┌─────────────────────────────────────────┐
│            Data Layer                   │
│  (Models, Data Sources, Repos Impl)     │
└────────────┬────────────────────────────┘
             │
             ↓
┌─────────────────────────────────────────┐
│            Core Layer                   │
│  (DI, Network, Errors, Base Classes)    │
└─────────────────────────────────────────┘
```

### Key Benefits
- ✅ **Testable** - Easy to write unit tests for all layers
- ✅ **Maintainable** - Clear separation of concerns
- ✅ **Scalable** - Easy to add new features
- ✅ **Type-Safe** - GraphQL code generation
- ✅ **Reusable** - Shared business logic

## 🛠️ Tech Stack

| Category | Technology |
|----------|------------|
| Framework | Flutter 3.10.8 |
| Language | Dart 3.0.0 |
| API | GraphQL (Rick & Morty API) |
| State Management | flutter_bloc ^8.1.3 |
| Dependency Injection | get_it + injectable |
| Functional Programming | dartz (Either pattern) |
| Code Generation | build_runner, graphql_codegen |
| Value Equality | equatable |

## 📚 Documentation

- **[DEVELOPER_GUIDE.md](DEVELOPER_GUIDE.md)** - Complete onboarding guide for new developers
- **[PROJECT_RULES.md](PROJECT_RULES.md)** - Coding standards and conventions
- **[CONTRIBUTING.md](CONTRIBUTING.md)** - How to contribute to this project
- **[CLEAN_ARCHITECTURE_README.md](CLEAN_ARCHITECTURE_README.md)** - Deep dive into architecture
- **[NEW_FEATURES_SUMMARY.md](NEW_FEATURES_SUMMARY.md)** - Recently added features

## 🚀 Quick Start

### Prerequisites

```bash
flutter --version  # Should be 3.10.0+
dart --version     # Should be 3.0.0+
```

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd jalat_driver_module
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

## 📖 Project Structure

```
lib/
├── core/                          # Shared utilities
│   ├── di/                        # Dependency injection
│   ├── error/                     # Error handling
│   ├── network/                   # Network services
│   └── usecase/                   # Base use case
├── domain/                        # Business logic (Pure Dart)
│   ├── entities/                  # Business objects
│   ├── repositories/              # Repository interfaces
│   └── usecases/                  # Business use cases
├── data/                          # Data access
│   ├── models/                    # Data models
│   ├── datasources/               # Data sources
│   ├── repositories/              # Repository implementations
│   └── graphql/                   # GraphQL queries
└── presentation/                  # UI layer
    ├── bloc/                      # State management
    ├── pages/                     # Full screens
    └── widgets/                   # Reusable components
```

## 🎯 Features Implementation

Each feature follows the same clean architecture pattern:

### Characters Feature ✅
- Browse paginated character list
- View character details
- Pull-to-refresh
- Error handling with retry

### Episodes Feature ✅
- Browse all episodes
- View episode details (code, air date)
- Search and filter

### Locations Feature ✅
- Browse all locations
- View location details (type, dimension)
- Search and filter

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Run specific test file
flutter test test/domain/usecases/get_characters_test.dart
```

## 🔧 Common Commands

```bash
# Format code
dart format .

# Analyze code
flutter analyze

# Generate code (after changes)
flutter pub run build_runner build --delete-conflicting-outputs

# Clean build
flutter clean && flutter pub get

# Build APK
flutter build apk

# Build iOS
flutter build ios
```

## 🤝 Contributing

We welcome contributions! Please read:
1. [DEVELOPER_GUIDE.md](DEVELOPER_GUIDE.md) - Setup and development guide
2. [PROJECT_RULES.md](PROJECT_RULES.md) - Coding standards
3. [CONTRIBUTING.md](CONTRIBUTING.md) - Contribution process

## 📝 Adding New Features

Follow these steps to add a new feature:

1. **Domain Layer** - Create entity, repository interface, use cases
2. **Data Layer** - Create GraphQL queries, models, data sources, repository impl
3. **Presentation Layer** - Create BLoC, pages, widgets
4. **Integration** - Add to dashboard and navigation

See [DEVELOPER_GUIDE.md](DEVELOPER_GUIDE.md) for detailed step-by-step instructions.

## 🐛 Troubleshooting

**Build Runner Fails:**
```bash
flutter clean
rm -rf .dart_tool/
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

**Dependency Injection Issues:**
- Ensure `@injectable` or `@LazySingleton` annotation is present
- Regenerate code: `flutter pub run build_runner build`

**API Not Working:**
- Check internet connection
- Verify API endpoint in `graphql_client.dart`

For more troubleshooting, see [DEVELOPER_GUIDE.md](DEVELOPER_GUIDE.md#troubleshooting).

## 📊 Code Statistics

- **Total Files:** ~80 files
- **Lines of Code:** ~8,000 lines
- **Features:** 3 complete features (Characters, Episodes, Locations)
- **Test Coverage:** Target 80%+

## 🙏 Credits

- **API:** [Rick and Morty API](https://rickandmortyapi.com/)
- **Architecture:** Uncle Bob's Clean Architecture
- **State Management:** BLoC Pattern

## 👥 Team

- **Tech Lead:** [Your Name]
- **Contributors:** See [CONTRIBUTORS.md](CONTRIBUTORS.md)

## 🔗 Links

- **Project Board:** [Link to project board]
- **Design Files:** [Link to Figma/design files]
- **API Documentation:** https://rickandmortyapi.com/documentation

---

**Made with ❤️ using Flutter and Clean Architecture**

*Last Updated: February 3, 2026*

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
