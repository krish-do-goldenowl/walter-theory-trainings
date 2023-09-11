import 'package:equatable/equatable.dart';

abstract class ContainerState extends Equatable {}

class InitState extends ContainerState {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class ChangeViewState extends ContainerState {
  @override
  List<Object?> get props => [identityHashCode(this)];
}
