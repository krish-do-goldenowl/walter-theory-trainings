import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gallery_app/src/presentation/button/bloc/button_bloc.dart';
import 'package:flutter_gallery_app/src/presentation/button/widgets/button_widget.dart';

@RoutePage()
class ButtonPage extends StatelessWidget {
  const ButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ButtonBloc>(
      create: (context) => ButtonBloc(),
      child: const ButtonWidget(),
    );
  }
}
