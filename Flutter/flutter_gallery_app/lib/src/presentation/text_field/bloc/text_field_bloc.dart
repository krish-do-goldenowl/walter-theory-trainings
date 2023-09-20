import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gallery_app/src/presentation/text_field/bloc/text_field_event.dart';
import 'package:flutter_gallery_app/src/presentation/text_field/bloc/text_field_state.dart';

class TextFieldBloc extends Bloc<TextFieldEvent, TextFieldState> {
  TextFieldBloc() : super(InitState()) {
    on<ChangeViewEvent>((event, emit) => emit(ChangeViewState()));
  }
}
