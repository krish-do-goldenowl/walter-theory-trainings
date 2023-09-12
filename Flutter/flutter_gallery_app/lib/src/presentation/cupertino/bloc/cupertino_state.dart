import 'package:equatable/equatable.dart';

abstract class CupertinoState extends Equatable {}

class InitState extends CupertinoState {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class ChangeViewState extends CupertinoState {
  @override
  List<Object?> get props => [identityHashCode(this)];
}
