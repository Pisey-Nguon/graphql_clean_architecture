import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/di/injection_container.dart';
import '../../core/navigation/app_router.dart';
import '../../domain/entities/character.dart';
import '../bloc/character_bloc.dart';
import '../widgets/app_state_views.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedStatus = 'All';
  String _selectedSpecies = 'All';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<CharacterBloc>()..add(const GetCharactersEvent(page: 1)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Search Characters'),
          backgroundColor: Colors.purple,
        ),
        body: Column(
          children: [
            // Search Bar
            Container(
              color: Colors.purple.shade50,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search by name...',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: _searchController.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                setState(() {
                                  _searchController.clear();
                                });
                              },
                            )
                          : null,
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 12),
                  // Filter Chips
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _FilterChip(
                          label: 'Status',
                          value: _selectedStatus,
                          options: ['All', 'Alive', 'Dead', 'Unknown'],
                          onChanged: (value) {
                            setState(() {
                              _selectedStatus = value;
                            });
                          },
                        ),
                        const SizedBox(width: 8),
                        _FilterChip(
                          label: 'Species',
                          value: _selectedSpecies,
                          options: ['All', 'Human', 'Alien', 'Robot', 'Animal'],
                          onChanged: (value) {
                            setState(() {
                              _selectedSpecies = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Results
            Expanded(
              child: BlocBuilder<CharacterBloc, CharacterState>(
                builder: (context, state) {
                  if (state is CharacterLoading) {
                    return const AppLoadingView();
                  } else if (state is CharactersLoaded) {
                    final filteredCharacters = _filterCharacters(
                      state.characters,
                      _searchController.text,
                      _selectedStatus,
                      _selectedSpecies,
                    );

                    if (filteredCharacters.isEmpty) {
                      return const AppEmptyState(
                        icon: Icons.search_off,
                        title: 'No characters found',
                        subtitle: 'Try adjusting your filters',
                      );
                    }

                    return ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: filteredCharacters.length,
                      itemBuilder: (context, index) {
                        final character = filteredCharacters[index];
                        return _SearchResultCard(character: character);
                      },
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
                    icon: Icons.search,
                    title: 'Start searching!',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Character> _filterCharacters(
    List<Character> characters,
    String query,
    String status,
    String species,
  ) {
    return characters.where((character) {
      final matchesQuery =
          query.isEmpty ||
          character.name.toLowerCase().contains(query.toLowerCase());
      final matchesStatus =
          status == 'All' ||
          character.status.toLowerCase() == status.toLowerCase();
      final matchesSpecies =
          species == 'All' ||
          character.species.toLowerCase() == species.toLowerCase();

      return matchesQuery && matchesStatus && matchesSpecies;
    }).toList();
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final String value;
  final List<String> options;
  final ValueChanged<String> onChanged;

  const _FilterChip({
    required this.label,
    required this.value,
    required this.options,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.purple.shade200),
      ),
      child: DropdownButton<String>(
        value: value,
        underline: const SizedBox(),
        isDense: true,
        items: options.map((option) {
          return DropdownMenuItem(
            value: option,
            child: Text(
              '$label: $option',
              style: const TextStyle(fontSize: 14),
            ),
          );
        }).toList(),
        onChanged: (newValue) {
          if (newValue != null) {
            onChanged(newValue);
          }
        },
      ),
    );
  }
}

class _SearchResultCard extends StatelessWidget {
  final Character character;

  const _SearchResultCard({required this.character});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
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
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 60,
                        height: 60,
                        color: Colors.grey[300],
                        child: const Icon(Icons.person, size: 30),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      character.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: _getStatusColor(character.status),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '${character.status} • ${character.species}',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: Colors.grey[400]),
            ],
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'alive':
        return Colors.green;
      case 'dead':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
