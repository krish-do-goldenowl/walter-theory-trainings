import 'package:equatable/equatable.dart';

abstract class MainAppState extends Equatable {}

class InitState extends MainAppState {
  @override
  List<Object?> get props => [];
}

class NextWordState extends MainAppState {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class ToggleFavoriteState extends MainAppState {
  @override
  List<Object?> get props => [identityHashCode(this)];
}
