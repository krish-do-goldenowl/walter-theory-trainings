import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gallery_app/src/presentation/button/bloc/button_event.dart';
import 'package:flutter_gallery_app/src/presentation/button/bloc/button_state.dart';

class ButtonBloc extends Bloc<ButtonEvent, ButtonState> {
  ButtonBloc() : super(InitState()) {
    on<ChangeViewEvent>((event, emit) => emit(ChangeViewState()));
  }
}
