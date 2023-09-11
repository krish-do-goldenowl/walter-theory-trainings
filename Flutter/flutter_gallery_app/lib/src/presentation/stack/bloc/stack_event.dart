import 'package:equatable/equatable.dart';

abstract class StackEvent extends Equatable {}

class ChangeViewEvent extends StackEvent {
  @override
  List<Object?> get props => [identityHashCode(this)];
}
