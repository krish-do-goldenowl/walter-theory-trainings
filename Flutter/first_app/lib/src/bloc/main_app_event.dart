import 'package:equatable/equatable.dart';

abstract class MainAppEvent extends Equatable {}

class GetNextWordEvent extends MainAppEvent {
  @override
  List<Object?> get props => [];
}

class ToggleFavoriteEvent extends MainAppEvent {
  @override
  List<Object?> get props => [];
}
