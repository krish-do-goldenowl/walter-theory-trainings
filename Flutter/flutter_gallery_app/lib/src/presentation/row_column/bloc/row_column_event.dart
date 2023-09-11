import 'package:equatable/equatable.dart';

abstract class RowColumnEvent extends Equatable {}

class ChangeViewEvent extends RowColumnEvent {
  @override
  List<Object?> get props => [identityHashCode(this)];
}
