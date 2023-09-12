import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gallery_app/src/presentation/cupertino/bloc/cupertino_bloc.dart';
import 'package:flutter_gallery_app/src/presentation/cupertino/bloc/cupertino_event.dart';
import 'package:flutter_gallery_app/src/presentation/cupertino/bloc/cupertino_state.dart';

class CupertinoWidget extends StatefulWidget {
  const CupertinoWidget({super.key});

  @override
  State<CupertinoWidget> createState() => _CupertinoWidgetState();
}

class _CupertinoWidgetState extends State<CupertinoWidget> {
  double firstSlider = 0;
  double secondSlider = 0;
  bool firstSwitch = false;
  bool secondSwitch = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        leading: Text(
          'Widget',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      child: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [
            CupertinoSliverRefreshControl(
              onRefresh: () async {
                await Future<void>.delayed(const Duration(milliseconds: 1000));
              },
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 1,
                (context, index) => _mainView(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _mainView() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Text("Pull to request"),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Incaditor",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const CupertinoActivityIndicator(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Button",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          CupertinoButton(
            child: const Text("Button"),
            onPressed: () {},
          ),
          CupertinoButton(
            color: Colors.blue,
            child: const Text("With background"),
            onPressed: () {},
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Slider",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          _sliderGroup(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Switch",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          _switchGroup(),
        ],
      ),
    );
  }

  Widget _switchGroup() {
    return BlocBuilder<CupertinoBloc, CupertinoState>(
      builder: (context, state) {
        return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoSwitch(
              value: firstSwitch,
              onChanged: (value) {
                firstSwitch = value;
                context.read<CupertinoBloc>().add(ChangeViewEvent());
              },
            ),
            const SizedBox(width: 20),
            CupertinoSwitch(
              value: secondSwitch,
              onChanged: (value) {
                secondSwitch = value;
                context.read<CupertinoBloc>().add(ChangeViewEvent());
              },
            )
          ],
        );
      },
    );
  }

  Widget _sliderGroup() {
    return BlocBuilder<CupertinoBloc, CupertinoState>(
      builder: (context, state) {
        return Column(
          children: [
            CupertinoSlider(
              value: firstSlider,
              max: 100,
              onChanged: (value) {
                firstSlider = value;
                context.read<CupertinoBloc>().add(ChangeViewEvent());
              },
            ),
            CupertinoSlider(
              value: secondSlider,
              max: 100,
              onChanged: (value) {
                secondSlider = value;
                context.read<CupertinoBloc>().add(ChangeViewEvent());
              },
            ),
          ],
        );
      },
    );
  }
}
