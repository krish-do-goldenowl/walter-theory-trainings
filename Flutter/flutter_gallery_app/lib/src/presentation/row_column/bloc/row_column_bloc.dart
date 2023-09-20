import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gallery_app/src/presentation/row_column/bloc/row_column_event.dart';
import 'package:flutter_gallery_app/src/presentation/row_column/bloc/row_column_state.dart';

class RowColumnBloc extends Bloc<RowColumnEvent, RowColumnState> {
  RowColumnBloc() : super(InitState()) {
    on<ChangeViewEvent>((event, emit) => emit(ChangeViewState()));
  }
}
