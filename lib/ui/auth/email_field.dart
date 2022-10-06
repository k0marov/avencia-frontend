import 'package:avencia/di.dart';
import 'package:avencia/logic/auth/email_field_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/forms/form_field_structure.dart';
import 'email_dialog.dart';

class EmailField extends StatelessWidget {
  const EmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmailFieldCubit(uiDeps.authFacade),
      child: BlocBuilder<EmailFieldCubit, EmailFieldState>(
        builder: (context, state) {
          print(state);
          final postfix = state.fold(
            () => Container(),
            (some) => some.fold(
              (e) => Container(),
              (email) => Center(
                child: email.current.isVerified
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
          return FormFieldStructure(
            label: "email",
            onTap: () => showEmailDialog(context),
            current: state.fold(
              () => "",
              (some) => some.fold(
                (e) => "Ooops. Some error happened", // TODO: handle exception
                (state) => state.current.email,
              ),
            ),
            postfix: postfix,
          );
        },
      ),
    );
  }
}
