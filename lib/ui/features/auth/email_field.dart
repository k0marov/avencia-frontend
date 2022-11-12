import 'package:avencia/di.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpers/logic/errors/bloc_state.dart';
import 'package:helpers/ui/errors/state_switch.dart';
import 'package:helpers/ui/forms/custom_text_field.dart';

import '../../../logic/features/auth/email_field_cubit.dart';
import 'email_dialog.dart';

class EmailField extends StatelessWidget {
  const EmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EmailFieldCubit>(
      create: (context) => EmailFieldCubit(uiDeps.authFacade),
      child: uiDeps.exceptionListener<EmailFieldCubit, EmailFieldState>(
        (s) => s.getException(),
        BlocBuilder<EmailFieldCubit, EmailFieldState>(
          builder: (context, state) {
            return stateSwitch<LoadedState>(
              state: state,
              loadedBuilder: (loaded) => InkWell(
                onTap: () => showEmailDialog(context),
                child: CustomTextField(
                  enabled: false,
                  initial: Right(loaded.current.email),
                  label: "Change and verify email",
                  hint: 'email',
                  updValue: (_) {},
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
