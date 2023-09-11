import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gallery_app/src/presentation/bottom_app_bar/bloc/bottom_app_bar_event.dart';
import 'package:flutter_gallery_app/src/presentation/bottom_app_bar/bloc/bottom_app_bar_state.dart';

class BottomAppBarBloc extends Bloc<BottomAppBarEvent, BottomAppBarState> {
  BottomAppBarBloc() : super(InitState()) {
    on<ChangeViewEvent>((event, emit) => emit(ChangeViewState()));
  }
}
