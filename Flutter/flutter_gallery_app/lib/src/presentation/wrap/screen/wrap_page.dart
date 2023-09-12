import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gallery_app/src/presentation/container/widgets/view_option_swich.dart';
import 'package:flutter_gallery_app/src/presentation/wrap/bloc/wrap_bloc.dart';
import 'package:flutter_gallery_app/src/presentation/wrap/bloc/wrap_event.dart';
import 'package:flutter_gallery_app/src/presentation/wrap/bloc/wrap_state.dart';

@RoutePage()
class WrapPage extends StatelessWidget {
  const WrapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WrapBloc>(
      create: (context) => WrapBloc(),
      child: const WrapView(),
    );
  }
}

class WrapView extends StatefulWidget {
  const WrapView({super.key});

  @override
  State<WrapView> createState() => _WrapViewState();
}

class _WrapViewState extends State<WrapView> {
  final List<MapEntry<String, OutlinedBorder>> listBorder = [
    const MapEntry('Circle', CircleBorder()),
    const MapEntry('RoundedRectangle', RoundedRectangleBorder()),
    const MapEntry('Stadium', StadiumBorder()),
    const MapEntry(' BeveledRectangle', BeveledRectangleBorder()),
    const MapEntry('ContinuousRectangle', ContinuousRectangleBorder()),
  ];

  bool isElevation = false;
  bool isDeleteIcon = false;
  bool isAvatar = false;
  bool isSpacing = false;
  bool isRunSpacing = false;
  OutlinedBorder border = const StadiumBorder();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Wrap view")),
      bottomNavigationBar: _optionView(),
      body: _mainView(),
    );
  }

  Widget _optionView() {
    return BlocBuilder<WrapBloc, WrapState>(
      builder: (context, state) {
        return Material(
          elevation: 10,
          child: Row(
            children: [
              const SizedBox(width: 10),
              Expanded(child: _optionLeft()),
              const SizedBox(width: 20),
              Expanded(child: _optionRight()),
              const SizedBox(width: 10),
            ],
          ),
        );
      },
    );
  }

  Widget _optionLeft() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ViewOptionSwich(
          onChanged: (value) {
            isElevation = value;
            context.read<WrapBloc>().add(ChangeViewEvent());
          },
          title: "Elevation",
          value: isElevation,
        ),
        ViewOptionSwich(
          onChanged: (value) {
            isDeleteIcon = value;
            context.read<WrapBloc>().add(ChangeViewEvent());
          },
          title: "Delete Icon",
          value: isDeleteIcon,
        ),
        ViewOptionSwich(
          onChanged: (value) {
            isSpacing = value;
            context.read<WrapBloc>().add(ChangeViewEvent());
          },
          title: "Spacing",
          value: isSpacing,
        )
      ],
    );
  }

  Widget _optionRight() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ViewOptionSwich(
          onChanged: (value) {
            isAvatar = value;
            context.read<WrapBloc>().add(ChangeViewEvent());
          },
          title: "Avatar",
          value: isAvatar,
        ),
        DropdownButton(
          value: border,
          isExpanded: true,
          items: listBorder
              .map((e) => DropdownMenuItem(
                  value: e.value,
                  child: Text(
                    e.key,
                    overflow: TextOverflow.ellipsis,
                  )))
              .toList(),
          onChanged: (value) {
            border = value!;
            context.read<WrapBloc>().add(ChangeViewEvent());
          },
        ),
        ViewOptionSwich(
          onChanged: (value) {
            isRunSpacing = value;
            context.read<WrapBloc>().add(ChangeViewEvent());
          },
          title: "Run Spacing",
          value: isRunSpacing,
        )
      ],
    );
  }

  Widget _mainView() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          const Text(
            "Chip Chip",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          _chipChipGroup(),
          const SizedBox(height: 15),
          const Text(
            "ChoiceChip",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          _choiceChipGroup(),
          const SizedBox(height: 15),
          const Text(
            "Input Chip",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          _inputChipGroup(),
        ],
      ),
    );
  }

  Widget _chipChipGroup() {
    return BlocBuilder<WrapBloc, WrapState>(
      builder: (context, state) {
        return Wrap(
          spacing: isSpacing ? 50 : 0,
          runSpacing: isRunSpacing ? 50 : 0,
          children: [
            Chip(
              avatar: isAvatar ? _avatarWidget : null,
              deleteIcon: isDeleteIcon ? _deleteWidget : null,
              label: const Text("Chip"),
              elevation: isElevation ? 10 : null,
              onDeleted: isDeleteIcon ? () {} : null,
              shape: border,
            ),
            ActionChip(
              avatar: isAvatar ? _avatarWidget : null,
              label: const Text("Action Chip"),
              elevation: isElevation ? 10 : null,
              onPressed: () {},
              shape: border,
            ),
            RawChip(
              avatar: isAvatar ? _avatarWidget : null,
              deleteIcon: isDeleteIcon ? _deleteWidget : null,
              label: const Text("Raw Chip"),
              elevation: isElevation ? 10 : null,
              onPressed: () {},
              onDeleted: isDeleteIcon ? () {} : null,
              shape: border,
              // selected: true,
              // onSelected: (value) {},
            )
          ],
        );
      },
    );
  }

  Widget _choiceChipGroup() {
    return BlocBuilder<WrapBloc, WrapState>(
      builder: (context, state) {
        return Wrap(
          spacing: isSpacing ? 50 : 0,
          runSpacing: isRunSpacing ? 50 : 0,
          children: [
            ChoiceChip(
              avatar: isAvatar ? _avatarWidget : null,
              label: const Text("Disable"),
              selected: false,
              elevation: isElevation ? 10 : null,
              onSelected: (value) {},
              shape: border,
            ),
            ChoiceChip(
              avatar: isAvatar ? _avatarWidget : null,
              label: const Text("small"),
              selected: true,
              elevation: isElevation ? 10 : null,
              onSelected: (value) {},
              shape: border,
            ),
            ChoiceChip(
              avatar: isAvatar ? _avatarWidget : null,
              label: const Text("Large"),
              selected: true,
              elevation: isElevation ? 10 : null,
              onSelected: (value) {},
              shape: border,
            ),
          ],
        );
      },
    );
  }

  Widget _inputChipGroup() {
    return BlocBuilder<WrapBloc, WrapState>(
      builder: (context, state) {
        return Wrap(
          spacing: isSpacing ? 50 : 0,
          runSpacing: isRunSpacing ? 50 : 0,
          children: [
            InputChip(
              avatar: isAvatar ? _avatarWidget : null,
              deleteIcon: isDeleteIcon ? _deleteWidget : null,
              label: const Text("Disable"),
              isEnabled: false,
              elevation: isElevation ? 10 : null,
              onDeleted: isDeleteIcon ? () {} : null,
              onPressed: () {},
              // selected: true,
              // onSelected: (value) {},
              shape: border,
            ),
            InputChip(
              avatar: isAvatar ? _avatarWidget : null,
              deleteIcon: isDeleteIcon ? _deleteWidget : null,
              label: const Text("iOS"),
              elevation: isElevation ? 10 : null,
              onDeleted: isDeleteIcon ? () {} : null,
              onPressed: () {},
              // selected: true,
              // onSelected: (value) {},
              shape: border,
            ),
            InputChip(
              avatar: isAvatar ? _avatarWidget : null,
              deleteIcon: isDeleteIcon ? _deleteWidget : null,
              label: const Text("Android"),
              elevation: isElevation ? 10 : null,
              onDeleted: isDeleteIcon ? () {} : null,
              onPressed: () {},
              // selected: true,
              // onSelected: (value) {},
              shape: border,
            ),
          ],
        );
      },
    );
  }

  Widget get _avatarWidget => const Icon(Icons.account_circle_rounded);

  Widget get _deleteWidget => const Icon(Icons.delete_rounded);
}
