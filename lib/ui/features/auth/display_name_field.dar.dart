import 'package:avencia/di.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpers/logic/forms/form_cubit.dart';
import 'package:helpers/ui/forms/custom_text_field.dart';
import 'package:helpers/ui/forms/form_widget.dart';

import '../../core/widgets/simple_button.dart';

class DisplayNameField extends StatelessWidget {
  const DisplayNameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    return uiDeps.formWidget(
      uiDeps.displayNameFormFactory,
      (context, FormInfo<String> info) => CustomTextField(
        updValue: context.read<FormCubit<String>>().valueEdited,
        hint: "display name",
        label: "Input your display name",
        suffix: Padding(
          padding: const EdgeInsets.all(8),
          child: SizedBox(
            width: 100,
            child: SimpleButton(
              onPressed: context.read<FormCubit<String>>().updatePressed,
              contents: Text("Update"),
            ),
          ),
        ),
        initial: Right(info.current),
      ),
    );
  }
}
