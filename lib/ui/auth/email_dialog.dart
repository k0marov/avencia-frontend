import 'package:avencia/logic/auth/email_field_cubit.dart';
import 'package:dartz/dartz.dart' show Right;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/forms/custom_text_field.dart';

void showEmailDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (ctx) => BlocProvider.value(
      value: context.read<EmailFieldCubit>(),
      child: EmailDialog(),
    ),
  );
}

class EmailDialog extends StatelessWidget {
  const EmailDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmailFieldCubit, EmailFieldState>(builder: (context, state) {
      // TODO: handle the error state here
      LoadedState? loaded = state.fold(
        () => null,
        (some) => some.fold(
          (e) => null,
          (loadedState) => loadedState,
        ),
      );
      if (loaded == null) {
        return AlertDialog(
          title: Text("Oops. Some error happened"),
          actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: Text("Ok"))],
        );
      }

      return AlertDialog(
        title: Text("Change email"),
        content: Container(
          child: CustomTextField(
            enabled: true,
            label: "email",
            updValue: context.read<EmailFieldCubit>().edited,
            initial: Right(loaded.edited),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Cancel"),
          ),
          _getActionButton(context, loaded),
        ],
      );
    });
  }

  Widget _getActionButton(BuildContext context, LoadedState state) {
    return TextButton(
      onPressed: state.actionEnabled
          ? () {
              context.read<EmailFieldCubit>().actionPressed();
              Navigator.of(context).pop();
            }
          : null,
      child: Text(state.action == CurrentAction.updating ? "Update" : "Verify"),
    );
  }
}
