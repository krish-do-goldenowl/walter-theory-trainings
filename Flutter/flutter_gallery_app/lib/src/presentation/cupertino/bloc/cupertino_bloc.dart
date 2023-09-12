import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gallery_app/src/presentation/cupertino/bloc/cupertino_event.dart';
import 'package:flutter_gallery_app/src/presentation/cupertino/bloc/cupertino_state.dart';

class CupertinoBloc extends Bloc<CupertinoEvent, CupertinoState> {
  CupertinoBloc() : super(InitState()) {
    on<ChangeViewEvent>((event, emit) => emit(ChangeViewState()));
  }
}
