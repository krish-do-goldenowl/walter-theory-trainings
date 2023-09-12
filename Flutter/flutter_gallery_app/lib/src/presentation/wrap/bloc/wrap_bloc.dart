import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gallery_app/src/presentation/wrap/bloc/wrap_event.dart';
import 'package:flutter_gallery_app/src/presentation/wrap/bloc/wrap_state.dart';

class WrapBloc extends Bloc<WrapEvent, WrapState> {
  WrapBloc() : super(InitState()) {
    on<ChangeViewEvent>((event, emit) => emit(ChangeViewState()));
  }
}
