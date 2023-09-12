import 'package:equatable/equatable.dart';

abstract class ButtonState extends Equatable {}

class InitState extends ButtonState {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class ChangeViewState extends ButtonState {
  @override
  List<Object?> get props => [identityHashCode(this)];
}
