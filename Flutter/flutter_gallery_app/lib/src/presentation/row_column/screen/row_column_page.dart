import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gallery_app/src/presentation/row_column/bloc/row_column_bloc.dart';
import 'package:flutter_gallery_app/src/presentation/row_column/bloc/row_column_event.dart';
import 'package:flutter_gallery_app/src/presentation/row_column/bloc/row_column_state.dart';
import 'package:flutter_gallery_app/src/presentation/row_column/widgets/view_option_dropdown.dart';

@RoutePage()
class RowColumnPage extends StatelessWidget {
  const RowColumnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RowColumnBloc>(
      create: (_) => RowColumnBloc(),
      child: const RowColumnView(),
    );
  }
}

class RowColumnView extends StatefulWidget {
  const RowColumnView({super.key});

  @override
  State<RowColumnView> createState() => _RowColumnViewState();
}

class _RowColumnViewState extends State<RowColumnView> {
  final List<Widget> icons = [
    const Icon(Icons.brightness_auto),
    const Icon(Icons.brightness_auto, size: 50),
    const Icon(Icons.brightness_auto)
  ];

  final List<MainAxisAlignment> listMainAxisAlignment = [
    MainAxisAlignment.center,
    MainAxisAlignment.end,
    MainAxisAlignment.spaceAround,
    MainAxisAlignment.spaceBetween,
    MainAxisAlignment.spaceEvenly,
    MainAxisAlignment.start,
  ];

  final List<CrossAxisAlignment> listCrossAxisAlignment = [
    CrossAxisAlignment.center,
    CrossAxisAlignment.end,
    CrossAxisAlignment.baseline,
    CrossAxisAlignment.stretch,
    CrossAxisAlignment.start,
  ];

  bool isRow = true;

  MainAxisSize mainAxisSize = MainAxisSize.min;

  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center;

  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center;

  VerticalDirection verticalDirection = VerticalDirection.up;

  TextDirection textDirection = TextDirection.ltr;

  TextBaseline textBaseline = TextBaseline.alphabetic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Row & Column")),
      bottomNavigationBar: viewOption(),
      body: mainView(),
    );
  }

  Widget mainView() {
    return BlocBuilder<RowColumnBloc, RowColumnState>(
      builder: (context, state) {
        return SafeArea(
          child: Container(
            color: Colors.yellow,
            child: isRow
                ? Row(
                    mainAxisAlignment: mainAxisAlignment,
                    crossAxisAlignment: crossAxisAlignment,
                    textBaseline: textBaseline,
                    textDirection: textDirection,
                    verticalDirection: verticalDirection,
                    children: icons,
                  )
                : Column(
                    mainAxisAlignment: mainAxisAlignment,
                    crossAxisAlignment: crossAxisAlignment,
                    textBaseline: textBaseline,
                    textDirection: textDirection,
                    verticalDirection: verticalDirection,
                    children: icons,
                  ),
          ),
        );
      },
    );
  }

  Widget viewOption() {
    return BlocBuilder<RowColumnBloc, RowColumnState>(
      builder: (context, state) {
        return Material(
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                pickViewType(),
                ViewOptionDropdown(
                  value: mainAxisSize,
                  title: "mainAxisSize",
                  items: const [MainAxisSize.max, MainAxisSize.min],
                  onChanged: (state) {
                    mainAxisSize = state!;
                    context.read<RowColumnBloc>().add(ChangeViewEvent());
                  },
                ),
                ViewOptionDropdown(
                  value: mainAxisAlignment,
                  title: "mainAxisAlignment",
                  items: listMainAxisAlignment,
                  onChanged: (state) {
                    mainAxisAlignment = state!;
                    context.read<RowColumnBloc>().add(ChangeViewEvent());
                  },
                ),
                ViewOptionDropdown(
                  value: crossAxisAlignment,
                  title: "crossAxisAlignment",
                  items: listCrossAxisAlignment,
                  onChanged: (state) {
                    crossAxisAlignment = state!;
                    context.read<RowColumnBloc>().add(ChangeViewEvent());
                  },
                ),
                ViewOptionDropdown(
                  value: verticalDirection,
                  title: "verticalDirection",
                  items: const [VerticalDirection.down, VerticalDirection.up],
                  onChanged: (state) {
                    verticalDirection = state!;
                    context.read<RowColumnBloc>().add(ChangeViewEvent());
                  },
                ),
                ViewOptionDropdown(
                  value: textDirection,
                  title: "textDirection",
                  items: const [TextDirection.ltr, TextDirection.rtl],
                  onChanged: (state) {
                    textDirection = state!;
                    context.read<RowColumnBloc>().add(ChangeViewEvent());
                  },
                ),
                ViewOptionDropdown(
                  value: textBaseline,
                  title: "textBaseline",
                  items: const [
                    TextBaseline.alphabetic,
                    TextBaseline.ideographic,
                  ],
                  onChanged: (state) {
                    textBaseline = state!;
                    context.read<RowColumnBloc>().add(ChangeViewEvent());
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget pickViewType() {
    return BlocBuilder<RowColumnBloc, RowColumnState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: RadioListTile(
                value: true,
                groupValue: isRow,
                onChanged: (value) {
                  isRow = value!;
                  context.read<RowColumnBloc>().add(ChangeViewEvent());
                },
                title: const Text("Row"),
              ),
            ),
            Expanded(
              child: RadioListTile(
                value: false,
                groupValue: isRow,
                onChanged: (value) {
                  isRow = value!;
                  context.read<RowColumnBloc>().add(ChangeViewEvent());
                },
                title: const Text("Column"),
              ),
            )
          ],
        );
      },
    );
  }
}
