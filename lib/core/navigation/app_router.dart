import 'package:flutter/material.dart';

import '../../domain/entities/character.dart';
import '../../presentation/pages/character_detail_page.dart';
import '../../presentation/pages/character_list_page.dart';
import '../../presentation/pages/dashboard_page.dart';
import '../../presentation/pages/episode_detail_page.dart';
import '../../presentation/pages/episode_list_page.dart';
import '../../presentation/pages/location_detail_page.dart';
import '../../presentation/pages/location_list_page.dart';
import '../../presentation/pages/search_page.dart';
import '../../presentation/pages/settings_page.dart';

abstract class AppRoutes {
  static const dashboard = '/';
  static const characters = '/characters';
  static const characterDetail = '/characters/detail';
  static const episodes = '/episodes';
  static const episodeDetail = '/episodes/detail';
  static const locations = '/locations';
  static const locationDetail = '/locations/detail';
  static const search = '/search';
  static const settings = '/settings';
}

class CharacterDetailRouteArgs {
  const CharacterDetailRouteArgs({
    required this.characterId,
    this.initialCharacter,
  });

  final String characterId;
  final Character? initialCharacter;
}

class EpisodeDetailRouteArgs {
  const EpisodeDetailRouteArgs({required this.episodeId});
  final String episodeId;
}

class LocationDetailRouteArgs {
  const LocationDetailRouteArgs({required this.locationId});
  final String locationId;
}

class AppRouter {
  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.dashboard:
        return _buildRoute(settings, (_) => const DashboardPage());
      case AppRoutes.characters:
        return _buildRoute(settings, (_) => const CharacterListPage());
      case AppRoutes.characterDetail:
        final args = settings.arguments;
        if (args is! CharacterDetailRouteArgs) {
          return _errorRoute(settings, 'Missing character detail arguments');
        }
        return _buildRoute(
          settings,
          (_) => CharacterDetailPage(
            characterId: args.characterId,
            initialCharacter: args.initialCharacter,
          ),
        );
      case AppRoutes.episodes:
        return _buildRoute(settings, (_) => const EpisodeListPage());
      case AppRoutes.episodeDetail:
        final args = settings.arguments;
        if (args is! EpisodeDetailRouteArgs) {
          return _errorRoute(settings, 'Missing episode detail arguments');
        }
        return _buildRoute(
          settings,
          (_) => EpisodeDetailPage(episodeId: args.episodeId),
        );
      case AppRoutes.locations:
        return _buildRoute(settings, (_) => const LocationListPage());
      case AppRoutes.locationDetail:
        final args = settings.arguments;
        if (args is! LocationDetailRouteArgs) {
          return _errorRoute(settings, 'Missing location detail arguments');
        }
        return _buildRoute(
          settings,
          (_) => LocationDetailPage(locationId: args.locationId),
        );
      case AppRoutes.search:
        return _buildRoute(settings, (_) => const SearchPage());
      case AppRoutes.settings:
        return _buildRoute(settings, (_) => const SettingsPage());
      default:
        return _errorRoute(
          settings,
          'Unknown route: ${settings.name ?? 'null'}',
        );
    }
  }

  static Route<dynamic> _buildRoute(
    RouteSettings settings,
    WidgetBuilder builder,
  ) {
    return MaterialPageRoute(builder: builder, settings: settings);
  }

  static Route<dynamic> _errorRoute(RouteSettings settings, String message) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => _errorWidget(message),
    );
  }

  static Widget _errorWidget(String message) {
    return Scaffold(
      appBar: AppBar(title: const Text('Navigation Error')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(message, textAlign: TextAlign.center),
        ),
      ),
    );
  }
}

/// Extension for type-safe route navigation.
/// Instead of writing `Navigator.of(context).pushNamed(...)` and building
/// route arguments manually,
/// you can now use this extension method safely:
///
/// ```dart
/// context.pushCharacterDetail(characterId: '1', character: character);
/// ```
extension AppRouterExtension on BuildContext {
  // --- Characters ---
  Future<T?> pushCharacters<T extends Object?>() =>
      Navigator.of(this).pushNamed<T>(AppRoutes.characters);

  Future<T?> pushCharacterDetail<T extends Object?>({
    required String characterId,
    Character? character,
  }) => Navigator.of(this).pushNamed<T>(
    AppRoutes.characterDetail,
    arguments: CharacterDetailRouteArgs(
      characterId: characterId,
      initialCharacter: character,
    ),
  );

  // --- Episodes ---
  Future<T?> pushEpisodes<T extends Object?>() =>
      Navigator.of(this).pushNamed<T>(AppRoutes.episodes);

  Future<T?> pushEpisodeDetail<T extends Object?>({
    required String episodeId,
  }) => Navigator.of(this).pushNamed<T>(
    AppRoutes.episodeDetail,
    arguments: EpisodeDetailRouteArgs(episodeId: episodeId),
  );

  // --- Locations ---
  Future<T?> pushLocations<T extends Object?>() =>
      Navigator.of(this).pushNamed<T>(AppRoutes.locations);

  Future<T?> pushLocationDetail<T extends Object?>({
    required String locationId,
  }) => Navigator.of(this).pushNamed<T>(
    AppRoutes.locationDetail,
    arguments: LocationDetailRouteArgs(locationId: locationId),
  );

  // --- Others ---
  Future<T?> pushSearch<T extends Object?>() =>
      Navigator.of(this).pushNamed<T>(AppRoutes.search);
  Future<T?> pushSettings<T extends Object?>() =>
      Navigator.of(this).pushNamed<T>(AppRoutes.settings);
}
