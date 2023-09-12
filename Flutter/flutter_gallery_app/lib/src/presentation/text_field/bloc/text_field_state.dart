import 'package:equatable/equatable.dart';

abstract class TextFieldState extends Equatable {}

class InitState extends TextFieldState {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class ChangeViewState extends TextFieldState {
  @override
  List<Object?> get props => [identityHashCode(this)];
}
