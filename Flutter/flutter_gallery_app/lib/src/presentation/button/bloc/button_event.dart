import 'package:equatable/equatable.dart';

abstract class ButtonEvent extends Equatable {}

class ChangeViewEvent extends ButtonEvent {
  @override
  List<Object?> get props => [identityHashCode(this)];
}
