import 'package:equatable/equatable.dart';

abstract class RowColumnState extends Equatable {}

class InitState extends RowColumnState {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class ChangeViewState extends RowColumnState {
  @override
  List<Object?> get props => [identityHashCode(this)];
}
