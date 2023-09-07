import 'package:english_words/english_words.dart';
import 'package:first_app/src/bloc/main_app_event.dart';
import 'package:first_app/src/bloc/main_app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainAppBloc extends Bloc<MainAppEvent, MainAppState> {
  late WordPair current = WordPair.random();
  final favorites = <WordPair>[];

  MainAppBloc() : super(InitState()) {
    on<ToggleFavoriteEvent>(_toggleFavorite);

    on<GetNextWordEvent>(_getNext);
  }

  void _getNext(GetNextWordEvent event, Emitter emit) {
    current = WordPair.random();
    emit(NextWordState());
  }

  void _toggleFavorite(ToggleFavoriteEvent event, Emitter emit) {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    emit(ToggleFavoriteState());
  }
}
