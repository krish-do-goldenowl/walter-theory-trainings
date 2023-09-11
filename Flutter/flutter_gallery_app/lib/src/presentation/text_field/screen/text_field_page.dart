import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gallery_app/src/presentation/container/widgets/view_option_swich.dart';
import 'package:flutter_gallery_app/src/presentation/text_field/bloc/text_field_bloc.dart';
import 'package:flutter_gallery_app/src/presentation/text_field/bloc/text_field_event.dart';
import 'package:flutter_gallery_app/src/presentation/text_field/bloc/text_field_state.dart';

@RoutePage()
class TextFieldPage extends StatelessWidget {
  const TextFieldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TextFieldBloc>(
      create: (context) => TextFieldBloc(),
      child: const TextFieldView(),
    );
  }
}

class TextFieldView extends StatefulWidget {
  const TextFieldView({super.key});

  @override
  State<TextFieldView> createState() => _TextFieldViewState();
}

class _TextFieldViewState extends State<TextFieldView> {
  bool isHintText = false;
  bool isLableText = false;
  bool isHelpText = false;
  bool isErrorText = false;
  bool isCounterText = false;
  bool isPrefix = false;
  bool isSuffix = false;
  bool isPrefixIcon = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Form view")),
      body: _optionView(),
      bottomNavigationBar: _mainView(),
    );
  }

  Widget _mainView() {
    return BlocBuilder<TextFieldBloc, TextFieldState>(
      builder: (context, state) {
        return Material(
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: isHintText ? "Hint Text" : null,
                    label: isLableText ? const Text("Lable Text") : null,
                    helperText: isHelpText ? "Help Text" : null,
                    counterText: isCounterText ? "Counter Text" : null,
                    errorText: isErrorText ? "Error Text" : null,
                    prefix: isPrefix
                        ? const Icon(Icons.account_circle_rounded)
                        : null,
                    suffix: isSuffix
                        ? const Icon(Icons.account_circle_rounded)
                        : null,
                    prefixIcon: isPrefixIcon
                        ? const Icon(Icons.account_circle_rounded)
                        : null,
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: isHintText ? "Hint Text" : null,
                    label: isLableText ? const Text("Lable Text") : null,
                    helperText: isHelpText ? "Help Text" : null,
                    counterText: isCounterText ? "Counter Text" : null,
                    errorText: isErrorText ? "Error Text" : null,
                    prefix: isPrefix
                        ? const Icon(Icons.account_circle_rounded)
                        : null,
                    suffix: isSuffix
                        ? const Icon(Icons.account_circle_rounded)
                        : null,
                    prefixIcon: isPrefixIcon
                        ? const Icon(Icons.account_circle_rounded)
                        : null,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _optionView() {
    return BlocBuilder<TextFieldBloc, TextFieldState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ViewOptionSwich(
                onChanged: (value) {
                  isHintText = value;
                  context.read<TextFieldBloc>().add(ChangeViewEvent());
                },
                title: "Hint Text",
                value: isHintText,
              ),
              ViewOptionSwich(
                onChanged: (value) {
                  isLableText = value;
                  context.read<TextFieldBloc>().add(ChangeViewEvent());
                },
                title: "Lable Text",
                value: isLableText,
              ),
              ViewOptionSwich(
                onChanged: (value) {
                  isHelpText = value;
                  context.read<TextFieldBloc>().add(ChangeViewEvent());
                },
                title: "Help Text",
                value: isHelpText,
              ),
              ViewOptionSwich(
                onChanged: (value) {
                  isErrorText = value;
                  context.read<TextFieldBloc>().add(ChangeViewEvent());
                },
                title: "Error Text",
                value: isErrorText,
              ),
              ViewOptionSwich(
                onChanged: (value) {
                  isCounterText = value;
                  context.read<TextFieldBloc>().add(ChangeViewEvent());
                },
                title: "Counter Text",
                value: isCounterText,
              ),
              ViewOptionSwich(
                onChanged: (value) {
                  isPrefix = value;
                  context.read<TextFieldBloc>().add(ChangeViewEvent());
                },
                title: "Prefix",
                value: isPrefix,
              ),
              ViewOptionSwich(
                onChanged: (value) {
                  isSuffix = value;
                  context.read<TextFieldBloc>().add(ChangeViewEvent());
                },
                title: "Suffix",
                value: isSuffix,
              ),
              ViewOptionSwich(
                onChanged: (value) {
                  isPrefixIcon = value;
                  context.read<TextFieldBloc>().add(ChangeViewEvent());
                },
                title: "Prefix Icon",
                value: isPrefixIcon,
              ),
            ],
          ),
        );
      },
    );
  }
}
