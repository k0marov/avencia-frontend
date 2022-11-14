import 'package:avencia/di.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpers/logic/auth/auth_state_bloc.dart';
import 'package:helpers/ui/forms/custom_text_field.dart';

import '../../../logic/features/auth/email_field_cubit.dart';
import 'email_dialog.dart';

class EmailField extends StatelessWidget {
  const EmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailState = context.read<AuthStateCubit>().state!.fold(
          () => throw Exception(
              "Failed assertion of user being authenticated when viewing an EmailField widget."),
          (state) => state.emailState,
        );
    return BlocProvider<EmailFieldCubit>(
      create: (context) => EmailFieldCubit(uiDeps.authFacade, emailState),
      child: uiDeps.exceptionListener<EmailFieldCubit, EmailCubitState>(
        (s) => s.exception,
        BlocBuilder<EmailFieldCubit, EmailCubitState>(
          builder: (context, state) {
            return InkWell(
              onTap: () => showEmailDialog(context),
              child: CustomTextField(
                enabled: false,
                initial: Right(state.current.email ?? ""),
                label: "Change and verify email",
                hint: 'email',
                updValue: (_) {},
              ),
            );
          },
        ),
      ),
    );
  }
}
