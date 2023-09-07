import 'package:first_app/src/bloc/main_app_bloc.dart';
import 'package:first_app/src/bloc/main_app_event.dart';
import 'package:first_app/src/bloc/main_app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/big_card.dart';

class GeneratorPage extends StatelessWidget {
  const GeneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<MainAppBloc, MainAppState>(
            buildWhen: (previous, current) => current is NextWordState,
            builder: (context, state) {
              var appState = context.read<MainAppBloc>();
              return BigCard(pair: appState.current);
            },
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<MainAppBloc, MainAppState>(
                builder: (context, state) {
                  var appState = context.read<MainAppBloc>();
                  return ElevatedButton.icon(
                    onPressed: () {
                      context.read<MainAppBloc>().add(ToggleFavoriteEvent());
                    },
                    icon: Icon(
                      appState.favorites.contains(appState.current)
                          ? Icons.favorite
                          : Icons.favorite_border,
                    ),
                    label: const Text('Like'),
                  );
                },
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  context.read<MainAppBloc>().add(GetNextWordEvent());
                },
                child: const Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
