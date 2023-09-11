import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gallery_app/src/presentation/stack/bloc/stack_bloc.dart';
import 'package:flutter_gallery_app/src/presentation/stack/bloc/stack_event.dart';
import 'package:flutter_gallery_app/src/presentation/stack/bloc/stack_state.dart';

import '../../row_column/widgets/view_option_dropdown.dart';

@RoutePage()
class StackPage extends StatelessWidget {
  const StackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StackBloc>(
      create: (context) => StackBloc(),
      child: const StackView(),
    );
  }
}

class StackView extends StatefulWidget {
  const StackView({super.key});

  @override
  State<StackView> createState() => _StackViewState();
}

class _StackViewState extends State<StackView> {
  final List<Alignment> listAlignment = [
    Alignment.bottomCenter,
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.center,
    Alignment.centerLeft,
    Alignment.centerRight,
    Alignment.topCenter,
    Alignment.topLeft,
    Alignment.topRight,
  ];

  final List<StackFit> listStackFit = [
    StackFit.expand,
    StackFit.loose,
    StackFit.passthrough,
  ];

  final List<Clip> listClip = [
    Clip.antiAlias,
    Clip.antiAliasWithSaveLayer,
    Clip.hardEdge,
    Clip.none,
  ];

  Alignment alignment = Alignment.center;
  TextDirection textDirection = TextDirection.ltr;
  StackFit stackFit = StackFit.loose;
  Clip clip = Clip.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stack & Align")),
      bottomNavigationBar: viewOption(),
      body: mainView(),
    );
  }

  Widget mainView() {
    return BlocBuilder<StackBloc, StackState>(
      builder: (context, state) {
        return SizedBox.expand(
          child: Stack(
            alignment: alignment,
            fit: stackFit,
            textDirection: textDirection,
            clipBehavior: clip,
            children: [
              Container(color: Colors.blue, height: 250, width: 250),
              Container(color: Colors.green, height: 200, width: 200),
              Container(color: Colors.orange, height: 120, width: 120),
            ],
          ),
        );
      },
    );
  }

  Widget viewOption() {
    return BlocBuilder<StackBloc, StackState>(
      builder: (context, state) {
        return Material(
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ViewOptionDropdown(
                  value: alignment,
                  title: "alignment",
                  items: listAlignment,
                  onChanged: (state) {
                    alignment = state!;
                    context.read<StackBloc>().add(ChangeViewEvent());
                  },
                ),
                ViewOptionDropdown(
                  value: textDirection,
                  title: "textDirection",
                  items: const [TextDirection.ltr, TextDirection.rtl],
                  onChanged: (state) {
                    textDirection = state!;
                    context.read<StackBloc>().add(ChangeViewEvent());
                  },
                ),
                ViewOptionDropdown(
                  value: stackFit,
                  title: "stackFit",
                  items: listStackFit,
                  onChanged: (state) {
                    stackFit = state!;
                    context.read<StackBloc>().add(ChangeViewEvent());
                  },
                ),
                ViewOptionDropdown(
                  value: clip,
                  title: "clip",
                  items: listClip,
                  onChanged: (state) {
                    clip = state!;
                    context.read<StackBloc>().add(ChangeViewEvent());
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
