import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gallery_app/src/presentation/text_field/bloc/text_field_bloc.dart';
import 'package:flutter_gallery_app/src/presentation/text_field/widgets/text_field_widget.dart';

@RoutePage()
class TextFieldPage extends StatelessWidget {
  const TextFieldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TextFieldBloc>(
      create: (context) => TextFieldBloc(),
      child: const TextFieldWidget(),
    );
  }
}
