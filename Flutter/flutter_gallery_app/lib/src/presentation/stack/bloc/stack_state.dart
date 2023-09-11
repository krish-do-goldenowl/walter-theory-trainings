import 'package:equatable/equatable.dart';

abstract class StackState extends Equatable {}

class InitState extends StackState {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class ChangeViewState extends StackState {
  @override
  List<Object?> get props => [identityHashCode(this)];
}
