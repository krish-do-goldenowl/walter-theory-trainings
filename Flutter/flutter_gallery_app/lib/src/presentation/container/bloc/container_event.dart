import 'package:equatable/equatable.dart';

abstract class ContainerEvent extends Equatable {}

class ChangeViewEvent extends ContainerEvent {
  @override
  List<Object?> get props => [identityHashCode(this)];
}
