import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gallery_app/src/presentation/button/bloc/button_bloc.dart';
import 'package:flutter_gallery_app/src/presentation/button/bloc/button_event.dart';
import 'package:flutter_gallery_app/src/presentation/button/bloc/button_state.dart';
import 'package:flutter_gallery_app/src/presentation/button/widgets/custom_border_button.dart';
import 'package:flutter_gallery_app/src/presentation/button/widgets/option_button.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({super.key});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  int indexOption = 0;
  String dropdownValue = "option 1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Button View")),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding:
            const EdgeInsets.only(left: 10, top: 10, bottom: 70, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _dropdownButton(),
            DropdownButtonFormField<String>(
              value: "option 1",
              items: ["option 1", "option 2", "option 3"]
                  .map(
                      (e) => DropdownMenuItem<String>(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) {},
              validator: (value) => null,
              isExpanded: true,
              onSaved: (newValue) {},
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_box_rounded),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Elevated Button"),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.account_circle_rounded),
                label: const Text("Elevated Button Icon"),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {},
                child: const Text("Text Button"),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.account_circle_rounded),
                label: const Text("Text Button Icon"),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                child: const Text("Outlined Button"),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.account_circle_rounded),
                label: const Text("Outlined Button icons"),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                color: Colors.grey,
                child: const Text("Cupertino Button"),
                onPressed: () {},
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ClipPath(
                clipper: CustomBorderButton(radius: 10),
                child: MaterialButton(
                  color: Colors.grey,
                  onPressed: () {},
                  child: const Text("Material Button"),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ClipPath(
                clipper: CustomBorderButton(radius: 10),
                child: RawMaterialButton(
                  fillColor: Colors.grey,
                  onPressed: () {},
                  child: const Text("Raw Material Button"),
                ),
              ),
            ),
            _optionButtonGroup(),
          ],
        ),
      ),
    );
  }

  Widget _dropdownButton() {
    return BlocBuilder<ButtonBloc, ButtonState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: DropdownButton<String>(
            value: dropdownValue,
            items: ["option 1", "option 2", "option 3"]
                .map((e) => DropdownMenuItem<String>(value: e, child: Text(e)))
                .toList(),
            onChanged: (value) {
              dropdownValue = value!;
              context.read<ButtonBloc>().add(ChangeViewEvent());
            },
          ),
        );
      },
    );
  }

  Widget _optionButtonGroup() {
    return BlocBuilder<ButtonBloc, ButtonState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 2),
          ),
          child: IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                OptionButton(
                  title: "Opption 1",
                  onTap: () {
                    indexOption = 0;
                    context.read<ButtonBloc>().add(ChangeViewEvent());
                  },
                  isChoose: indexOption == 0,
                ),
                const VerticalDivider(
                  color: Colors.grey,
                  thickness: 2,
                  width: 2,
                ),
                OptionButton(
                  title: "Opption 2",
                  onTap: () {
                    indexOption = 1;
                    context.read<ButtonBloc>().add(ChangeViewEvent());
                  },
                  isChoose: indexOption == 1,
                ),
                const VerticalDivider(
                  color: Colors.grey,
                  thickness: 2,
                  width: 2,
                ),
                OptionButton(
                  title: "Opption 3",
                  onTap: () {
                    indexOption = 2;
                    context.read<ButtonBloc>().add(ChangeViewEvent());
                  },
                  isChoose: indexOption == 2,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
