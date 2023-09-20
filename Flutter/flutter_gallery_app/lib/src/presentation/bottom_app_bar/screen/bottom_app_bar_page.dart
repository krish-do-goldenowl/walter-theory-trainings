import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gallery_app/src/presentation/bottom_app_bar/bloc/bottom_app_bar_bloc.dart';
import 'package:flutter_gallery_app/src/presentation/bottom_app_bar/bloc/bottom_app_bar_event.dart';
import 'package:flutter_gallery_app/src/presentation/bottom_app_bar/bloc/bottom_app_bar_state.dart';
import 'package:flutter_gallery_app/src/presentation/container/widgets/view_option_swich.dart';

@RoutePage()
class BottomAppBarPage extends StatelessWidget {
  const BottomAppBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BottomAppBarBloc>(
      create: (context) => BottomAppBarBloc(),
      child: const BottomAppBarView(),
    );
  }
}

class BottomAppBarView extends StatefulWidget {
  const BottomAppBarView({super.key});

  @override
  State<BottomAppBarView> createState() => _BottomAppBarViewState();
}

class _BottomAppBarViewState extends State<BottomAppBarView> {
  bool isAcionButton = false;
  bool isNotch = false;
  int floatingButtonPosition = 0;
  FloatingActionButtonLocation floatingActionButtonLocation =
      FloatingActionButtonLocation.endDocked;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomAppBarBloc, BottomAppBarState>(
        builder: (context, state) {
      return Scaffold(
        appBar: AppBar(title: const Text("Bottom App Bar View")),
        floatingActionButton: isAcionButton
            ? FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.add),
              )
            : null,
        floatingActionButtonLocation: floatingActionButtonLocation,
        bottomNavigationBar: _bottomBar(),
        body: _optionView(),
      );
    });
  }

  Widget _bottomBar() {
    return BottomAppBar(
      padding: const EdgeInsets.all(15),
      shape: isNotch ? const CircularNotchedRectangle() : null,
      child: const Row(
        children: [
          Icon(Icons.menu_rounded),
          SizedBox(width: 15),
          Icon(Icons.search_rounded),
          SizedBox(width: 15),
          Icon(Icons.favorite_rounded),
        ],
      ),
    );
  }

  Widget _optionView() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              ViewOptionSwich(
                onChanged: (value) {
                  isAcionButton = value;
                  context.read<BottomAppBarBloc>().add(ChangeViewEvent());
                },
                title: "Float Action Button",
                value: isAcionButton,
              ),
              ViewOptionSwich(
                onChanged: (value) {
                  isNotch = value;
                  context.read<BottomAppBarBloc>().add(ChangeViewEvent());
                },
                title: "Notch",
                value: isNotch,
              ),
            ],
          ),
        ),
        Expanded(child: _radioView())
      ],
    );
  }

  Widget _radioView() {
    return Material(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Float Action Button Position",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            RadioListTile(
              value: floatingButtonPosition,
              groupValue: 0,
              onChanged: (value) {
                floatingButtonPosition = 0;
                floatingActionButtonLocation =
                    FloatingActionButtonLocation.endDocked;
                context.read<BottomAppBarBloc>().add(ChangeViewEvent());
              },
              title: const Text("Docked - End"),
            ),
            RadioListTile(
              value: floatingButtonPosition,
              groupValue: 1,
              onChanged: (value) {
                floatingButtonPosition = 1;
                floatingActionButtonLocation =
                    FloatingActionButtonLocation.centerDocked;
                context.read<BottomAppBarBloc>().add(ChangeViewEvent());
              },
              title: const Text("Docked - Center"),
            ),
            RadioListTile(
              value: floatingButtonPosition,
              groupValue: 2,
              onChanged: (value) {
                floatingButtonPosition = 2;
                floatingActionButtonLocation =
                    FloatingActionButtonLocation.endFloat;
                context.read<BottomAppBarBloc>().add(ChangeViewEvent());
              },
              title: const Text("Floating - End"),
            ),
            RadioListTile(
              value: floatingButtonPosition,
              groupValue: 3,
              onChanged: (value) {
                floatingButtonPosition = 3;
                floatingActionButtonLocation =
                    FloatingActionButtonLocation.centerFloat;
                context.read<BottomAppBarBloc>().add(ChangeViewEvent());
              },
              title: const Text("Floating - Center"),
            ),
          ],
        ),
      ),
    );
  }
}
