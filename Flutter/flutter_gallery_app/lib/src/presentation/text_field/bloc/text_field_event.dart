import 'package:equatable/equatable.dart';

abstract class TextFieldEvent extends Equatable {}

class ChangeViewEvent extends TextFieldEvent {
  @override
  List<Object?> get props => [identityHashCode(this)];
}
