import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/di/injection_container.dart';
import '../bloc/episode_bloc.dart';
import '../bloc/episode_event.dart';
import '../bloc/episode_state.dart';
import 'episode_detail_page.dart';

class EpisodeListPage extends StatelessWidget {
  const EpisodeListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<EpisodeBloc>()..add(const GetEpisodesEvent(page: 1)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Episodes'),
          backgroundColor: Colors.green,
        ),
        body: BlocBuilder<EpisodeBloc, EpisodeState>(
          builder: (context, state) {
            if (state is EpisodeLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is EpisodesLoaded) {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<EpisodeBloc>().add(const GetEpisodesEvent(page: 1));
                },
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: state.episodes.length,
                  itemBuilder: (context, index) {
                    final episode = state.episodes[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.green.shade100,
                          child: Text(
                            episode.episode.replaceAll('S', '').replaceAll('E', '.'),
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.green.shade900,
                            ),
                          ),
                        ),
                        title: Text(
                          episode.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          '${episode.episode} • ${episode.airDate}',
                          style: const TextStyle(fontSize: 12),
                        ),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => EpisodeDetailPage(episodeId: episode.id),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              );
            } else if (state is EpisodeError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error, size: 60, color: Colors.red),
                    const SizedBox(height: 16),
                    Text('Error: ${state.message}'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<EpisodeBloc>().add(const GetEpisodesEvent(page: 1));
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
