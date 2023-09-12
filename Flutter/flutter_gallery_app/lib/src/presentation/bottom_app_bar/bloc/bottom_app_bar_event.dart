import 'package:equatable/equatable.dart';

abstract class BottomAppBarEvent extends Equatable {}

class ChangeViewEvent extends BottomAppBarEvent {
  @override
  List<Object?> get props => [identityHashCode(this)];
}
