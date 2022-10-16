import 'package:avencia/di.dart';
import 'package:avencia/logic/auth/email_field_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpers/logic/errors/bloc_state.dart';
import 'package:helpers/ui/errors/state_switch.dart';
import 'package:helpers/ui/forms/form_field_structure.dart';

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
              loadedBuilder: (loaded) => FormFieldStructure(
                current: loaded.current.email,
                label: 'email',
                onTap: () => showEmailDialog(context),
                postfix: Center(
                  child: loaded.current.isVerified
                      ? Icon(
                          Icons.check,
                          color: Colors.green,
                        )
                      : Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
