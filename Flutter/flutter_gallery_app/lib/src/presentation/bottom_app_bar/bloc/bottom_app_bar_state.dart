import 'package:equatable/equatable.dart';

abstract class BottomAppBarState extends Equatable {}

class InitState extends BottomAppBarState {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class ChangeViewState extends BottomAppBarState {
  @override
  List<Object?> get props => [identityHashCode(this)];
}
