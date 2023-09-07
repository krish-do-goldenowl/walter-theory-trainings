import 'package:first_app/src/bloc/main_app_bloc.dart';
import 'package:first_app/src/bloc/main_app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainAppBloc, MainAppState>(
      buildWhen: (previous, current) => current is ToggleFavoriteState,
      builder: (context, state) {
        var appState = context.read<MainAppBloc>();

        if (appState.favorites.isEmpty) {
          return const Center(child: Text('No favorites yet.'));
        }

        return ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text('You have ${appState.favorites.length} favorites:'),
            ),
            for (var pair in appState.favorites)
              ListTile(
                leading: const Icon(Icons.favorite),
                title: Text(pair.asLowerCase),
              ),
          ],
        );
      },
    );
  }
}
