import 'package:dartz/dartz.dart' show Right;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpers/ui/forms/custom_text_field.dart';

import '../../../logic/features/auth/email_field_cubit.dart';

void showEmailDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (ctx) => BlocProvider.value(
      value: context.read<EmailFieldCubit>(),
      child: const EmailDialog(),
    ),
  );
}

class EmailDialog extends StatelessWidget {
  const EmailDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmailFieldCubit, EmailCubitState>(builder: (context, state) {
      return AlertDialog(
        title: const Text("Change email"),
        content: SizedBox(
          width: 250,
          child: CustomTextField(
            hint: "email",
            updValue: context.read<EmailFieldCubit>().edited,
            initial: Right(state.edited),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Cancel"),
          ),
          _getActionButton(context, state),
        ],
      );
    });
  }

  Widget _getActionButton(BuildContext context, EmailCubitState state) {
    return ElevatedButton(
      onPressed: state.actionEnabled
          ? () {
              context.read<EmailFieldCubit>().actionPressed();
              Navigator.of(context).pop();
            }
          : null,
      child: Text(
        state.actionEnabled
            ? (state.action == CurrentAction.updating ? "Change" : "Verify")
            : "Change",
      ),
    );
  }
}
