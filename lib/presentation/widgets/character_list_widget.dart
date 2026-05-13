import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/navigation/app_router.dart';
import '../../domain/entities/character.dart';
import '../bloc/character_bloc.dart';
import 'app_state_views.dart';

class CharacterListWidget extends StatelessWidget {
  const CharacterListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterBloc, CharacterState>(
      builder: (context, state) {
        if (state is CharacterLoading) {
          return const AppLoadingView();
        } else if (state is CharactersLoaded) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<CharacterBloc>().add(
                const GetCharactersEvent(page: 1),
              );
            },
            child: ListView.builder(
              itemCount: state.characters.length,
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) {
                final character = state.characters[index];
                return CharacterCard(character: character);
              },
            ),
          );
        } else if (state is CharacterError) {
          return AppErrorView(
            message: state.message,
            onRetry: () {
              context.read<CharacterBloc>().add(
                const GetCharactersEvent(page: 1),
              );
            },
          );
        }
        return const AppEmptyState(
          icon: Icons.people_outline,
          title: 'Welcome! Pull to load characters',
        );
      },
    );
  }
}

class CharacterCard extends StatelessWidget {
  final Character character;

  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          context.goCharacterDetail(
            args: CharacterDetailRouteArgs(characterId: character.id),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Hero(
                tag: 'character-${character.id}',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    character.image,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 80,
                        height: 80,
                        color: Colors.grey[300],
                        child: const Icon(Icons.person, size: 40),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      character.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        _StatusIndicator(status: character.status),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            '${character.status} - ${character.species}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusIndicator extends StatelessWidget {
  final String status;

  const _StatusIndicator({required this.status});

  Color get statusColor {
    switch (status.toLowerCase()) {
      case 'alive':
        return Colors.green;
      case 'dead':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(color: statusColor, shape: BoxShape.circle),
    );
  }
}
