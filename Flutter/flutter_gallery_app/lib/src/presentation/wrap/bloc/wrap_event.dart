import 'package:equatable/equatable.dart';

abstract class WrapEvent extends Equatable {}

class ChangeViewEvent extends WrapEvent {
  @override
  List<Object?> get props => [identityHashCode(this)];
}
