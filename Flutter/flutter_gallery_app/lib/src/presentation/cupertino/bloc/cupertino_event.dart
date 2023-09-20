import 'package:equatable/equatable.dart';

abstract class CupertinoEvent extends Equatable {}

class ChangeViewEvent extends CupertinoEvent {
  @override
  List<Object?> get props => [identityHashCode(this)];
}
