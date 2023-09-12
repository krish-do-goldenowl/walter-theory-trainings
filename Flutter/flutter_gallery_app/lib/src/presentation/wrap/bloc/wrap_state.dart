import 'package:equatable/equatable.dart';

abstract class WrapState extends Equatable {}

class InitState extends WrapState {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class ChangeViewState extends WrapState {
  @override
  List<Object?> get props => [identityHashCode(this)];
}
