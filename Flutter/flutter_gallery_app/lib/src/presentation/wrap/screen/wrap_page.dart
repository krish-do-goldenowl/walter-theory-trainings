import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gallery_app/src/presentation/wrap/bloc/wrap_bloc.dart';
import 'package:flutter_gallery_app/src/presentation/wrap/widgets/wrap_widget.dart';

@RoutePage()
class WrapPage extends StatelessWidget {
  const WrapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WrapBloc>(
      create: (context) => WrapBloc(),
      child: const WrapWidget(),
    );
  }
}
