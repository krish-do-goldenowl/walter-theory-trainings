import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gallery_app/src/presentation/container/bloc/container_bloc.dart';
import 'package:flutter_gallery_app/src/presentation/container/bloc/container_event.dart';
import 'package:flutter_gallery_app/src/presentation/container/bloc/container_state.dart';
import 'package:flutter_gallery_app/src/presentation/container/widgets/view_option_swich.dart';
import 'package:flutter_gallery_app/src/presentation/row_column/widgets/view_option_dropdown.dart';

@RoutePage()
class ContainerPage extends StatelessWidget {
  const ContainerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ContainerBloc>(
      create: (context) => ContainerBloc(),
      child: const ContainerView(),
    );
  }
}

class ContainerView extends StatefulWidget {
  const ContainerView({super.key});

  @override
  State<ContainerView> createState() => _ContainerViewState();
}

class _ContainerViewState extends State<ContainerView> {
  BlendMode blendMode = BlendMode.src;
  bool isBorder = false;
  bool isBoxShadow = false;
  double borderRadius = 0.0;
  Color background = Colors.transparent;

  final List<BlendMode> listBlendMode = [
    BlendMode.clear,
    BlendMode.color,
    BlendMode.colorBurn,
    BlendMode.colorDodge,
    BlendMode.darken,
    BlendMode.difference,
    BlendMode.dst,
    BlendMode.dstATop,
    BlendMode.dstIn,
    BlendMode.dstOut,
    BlendMode.dstOver,
    BlendMode.exclusion,
    BlendMode.hardLight,
    BlendMode.hue,
    BlendMode.lighten,
    BlendMode.luminosity,
    BlendMode.modulate,
    BlendMode.multiply,
    BlendMode.overlay,
    BlendMode.plus,
    BlendMode.saturation,
    BlendMode.screen,
    BlendMode.screen,
    BlendMode.softLight,
    BlendMode.src,
    BlendMode.srcATop,
    BlendMode.srcIn,
    BlendMode.srcOut,
    BlendMode.srcOver,
    BlendMode.xor
  ];

  final List<Color> listColor = const [
    Colors.transparent,
    Colors.white,
    Colors.black,
    Colors.amber,
    Colors.blue,
    Colors.blueGrey,
    Colors.brown,
    Colors.cyan,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.green,
    Colors.grey,
    Colors.indigo,
    Colors.lightBlue,
    Colors.lightGreen,
    Colors.lime,
    Colors.orange,
    Colors.pink,
    Colors.purple,
    Colors.red,
    Colors.teal,
    Colors.yellow
  ];

  final List<String> listNameColor = [
    "None",
    "white",
    "black",
    "amber",
    "blue",
    "blueGrey",
    "brown",
    "cyan",
    "deepOrange",
    "deepPurple",
    "green",
    "grey",
    "indigo",
    "lightBlue",
    "lightGreen",
    "lime",
    "orange",
    "pink",
    "purple",
    "red",
    "teal",
    "yellow"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Container View")),
      bottomNavigationBar: optionView(),
      body: BlocBuilder<ContainerBloc, ContainerState>(
        builder: (context, state) {
          return Center(
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                border:
                    isBorder ? Border.all(color: Colors.black, width: 1) : null,
                backgroundBlendMode: blendMode,
                color: background,
                boxShadow: isBoxShadow
                    ? [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ]
                    : null,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget optionView() {
    return BlocBuilder<ContainerBloc, ContainerState>(
      builder: (context, state) {
        return Material(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ViewOptionSwich(
                  title: "Border",
                  value: isBorder,
                  onChanged: (value) {
                    isBorder = value;
                    context.read<ContainerBloc>().add(ChangeViewEvent());
                  },
                ),
                ViewOptionDropdown(
                  value: borderRadius,
                  title: "BorderRadius",
                  items: const [0.0, 10.0, 20.0, 30.0, 40.0, 50.0],
                  nameItems: const [
                    "None",
                    "10.0",
                    "20.0",
                    "30.0",
                    "40.0",
                    "50.0"
                  ],
                  onChanged: (state) {
                    borderRadius = state!;
                    context.read<ContainerBloc>().add(ChangeViewEvent());
                  },
                ),
                ViewOptionSwich(
                  title: "BoxShadow",
                  value: isBoxShadow,
                  onChanged: (value) {
                    isBoxShadow = value;
                    context.read<ContainerBloc>().add(ChangeViewEvent());
                  },
                ),
                ViewOptionDropdown(
                  value: background,
                  title: "Background",
                  items: listColor,
                  nameItems: listNameColor,
                  onChanged: (state) {
                    background = state!;
                    context.read<ContainerBloc>().add(ChangeViewEvent());
                  },
                ),
                ViewOptionDropdown(
                  value: blendMode,
                  title: "BlendMode",
                  items: listBlendMode,
                  onChanged: (state) {
                    blendMode = state!;
                    context.read<ContainerBloc>().add(ChangeViewEvent());
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
