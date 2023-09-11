import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gallery_app/src/presentation/container/bloc/container_event.dart';
import 'package:flutter_gallery_app/src/presentation/container/bloc/container_state.dart';

class ContainerBloc extends Bloc<ContainerEvent, ContainerState> {
  ContainerBloc() : super(InitState()) {
    on<ChangeViewEvent>((event, emit) => emit(ChangeViewState()));
  }
}
