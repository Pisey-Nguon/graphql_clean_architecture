import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/di/injection_container.dart';
import '../../core/navigation/app_router.dart';
import '../../domain/entities/episode.dart';
import '../bloc/episode_bloc.dart';
import '../bloc/episode_event.dart';
import '../bloc/episode_state.dart';
import '../widgets/app_state_views.dart';

class EpisodeDetailPage extends StatelessWidget {
  final String episodeId;

  const EpisodeDetailPage({super.key, required this.episodeId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<EpisodeBloc>()..add(GetEpisodeEvent(id: episodeId)),
      child: Scaffold(
        body: BlocBuilder<EpisodeBloc, EpisodeState>(
          builder: (context, state) {
            if (state is EpisodeLoading) {
              return const AppLoadingView(
                message: 'Loading episode details...',
              );
            } else if (state is EpisodeLoaded) {
              final episode = state.episode;
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: 200,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text(episode.episode),
                      background: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.green.shade400,
                              Colors.green.shade700,
                            ],
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.tv,
                            size: 80,
                            color: Colors.white.withValues(alpha: 0.3),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            episode.name,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _InfoCard(
                            icon: Icons.movie,
                            title: 'Episode',
                            value: episode.episode,
                            color: Colors.green,
                          ),
                          _InfoCard(
                            icon: Icons.calendar_today,
                            title: 'Air Date',
                            value: episode.airDate,
                            color: Colors.blue,
                          ),
                          _InfoCard(
                            icon: Icons.tag,
                            title: 'Episode ID',
                            value: '#${episode.id}',
                            color: Colors.purple,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Characters (${episode.characters.length})',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          if (episode.characters.isEmpty)
                            const Text(
                              'No characters found for this episode.',
                              style: TextStyle(color: Colors.black54),
                            )
                          else
                            SizedBox(
                              height: 150,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: episode.characters.length,
                                separatorBuilder: (_, _) =>
                                    const SizedBox(width: 12),
                                itemBuilder: (context, index) {
                                  final character = episode.characters[index];
                                  return _EpisodeCharacterCard(
                                    character: character,
                                  );
                                },
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is EpisodeError) {
              return AppErrorView(message: state.message);
            }
            return const AppLoadingView(message: 'Loading episode details...');
          },
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color color;

  const _InfoCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _EpisodeCharacterCard extends StatelessWidget {
  final EpisodeCharacter character;

  const _EpisodeCharacterCard({required this.character});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          context.pushCharacterDetail(characterId: character.id);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                character.image,
                height: 100,
                width: 120,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 100,
                    width: 120,
                    color: Colors.grey[300],
                    alignment: Alignment.center,
                    child: const Icon(Icons.person, size: 30),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            Text(
              character.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
