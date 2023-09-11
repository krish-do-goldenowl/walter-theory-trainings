import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gallery_app/src/presentation/stack/bloc/stack_event.dart';
import 'package:flutter_gallery_app/src/presentation/stack/bloc/stack_state.dart';

class StackBloc extends Bloc<StackEvent, StackState> {
  StackBloc() : super(InitState()) {
    on<ChangeViewEvent>((event, emit) => emit(ChangeViewState()));
  }
}
