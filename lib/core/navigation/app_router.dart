import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
  static const characterDetail = 'detail';
  static const episodes = '/episodes';
  static const episodeDetail = 'detail';
  static const locations = '/locations';
  static const locationDetail = 'detail';
  static const search = '/search';
  static const settings = '/settings';
}

/// Strongly-typed argument classes (if you want to expand them to hold objects)
class CharacterDetailRouteArgs {
  const CharacterDetailRouteArgs({required this.characterId});
  final String characterId;
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

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.dashboard,
    errorBuilder: (context, state) =>
        _errorWidget(state.error?.toString() ?? 'Unknown Navigation Error'),
    routes: [
      GoRoute(
        path: AppRoutes.dashboard,
        builder: (context, state) => const DashboardPage(),
      ),
      GoRoute(
        path: AppRoutes.characters,
        builder: (context, state) => const CharacterListPage(),
        routes: [
          GoRoute(
            path: AppRoutes.characterDetail,
            builder: (context, state) {
              final args = state.extra as CharacterDetailRouteArgs;
              return CharacterDetailPage(characterId: args.characterId);
            },
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.episodes,
        builder: (context, state) => const EpisodeListPage(),
        routes: [
          GoRoute(
            path: AppRoutes.episodeDetail,
            builder: (context, state) {
              final args = state.extra as EpisodeDetailRouteArgs;
              return EpisodeDetailPage(episodeId: args.episodeId);
            },
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.locations,
        builder: (context, state) => const LocationListPage(),
        routes: [
          GoRoute(
            path: AppRoutes.locationDetail,
            builder: (context, state) {
              final args = state.extra as LocationDetailRouteArgs;
              return LocationDetailPage(locationId: args.locationId);
            },
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.search,
        builder: (context, state) => const SearchPage(),
      ),
      GoRoute(
        path: AppRoutes.settings,
        builder: (context, state) => const SettingsPage(),
      ),
    ],
  );

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
/// Instead of writing `context.go(...)` and passing strings/objects manually,
/// you can now use this extension method safely:
///
/// ```dart
/// context.goCharacterDetail(args: const CharacterDetailRouteArgs(characterId: '1'));
/// ```
extension AppRouterExtension on BuildContext {
  // --- Characters ---
  void goCharacters() => go(AppRoutes.characters);

  void goCharacterDetail({required CharacterDetailRouteArgs args}) {
    go('${AppRoutes.characters}/${AppRoutes.characterDetail}', extra: args);
  }

  // --- Episodes ---
  void goEpisodes() => go(AppRoutes.episodes);

  void goEpisodeDetail({required EpisodeDetailRouteArgs args}) {
    go('${AppRoutes.episodes}/${AppRoutes.episodeDetail}', extra: args);
  }

  // --- Locations ---
  void goLocations() => go(AppRoutes.locations);

  void goLocationDetail({required LocationDetailRouteArgs args}) {
    go('${AppRoutes.locations}/${AppRoutes.locationDetail}', extra: args);
  }

  // --- Others ---
  void goSearch() => go(AppRoutes.search);
  void goSettings() => go(AppRoutes.settings);
}
