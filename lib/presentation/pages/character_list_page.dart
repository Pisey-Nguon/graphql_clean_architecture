import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/di/injection_container.dart';
import '../bloc/character_bloc.dart';
import '../widgets/character_list_widget.dart';

class CharacterListPage extends StatelessWidget {
  const CharacterListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CharacterBloc>()
        ..add(const GetCharactersEvent(page: 1)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Rick and Morty Characters'),
          backgroundColor: Colors.blue,
        ),
        body: const CharacterListWidget(),
      ),
    );
  }
}
