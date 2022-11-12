import 'package:avencia/di.dart';
import 'package:avencia/logic/features/user/user_details/internal/values.dart';
import 'package:avencia/ui/core/general/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpers/logic/forms/form_cubit.dart';
import 'package:helpers/ui/forms/custom_form_text_field.dart';
import 'package:helpers/ui/forms/date_picker_field.dart';
import 'package:helpers/ui/forms/form_widget.dart';

import '../../../core/general/themes/theme.dart';
import '../../auth/email_field.dart';
import '../../dashboard/section_widget.dart';

class EditButton extends StatelessWidget {
  const EditButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        "Edit",
        style: Theme.of(context).textTheme.headline4?.copyWith(
              decoration: TextDecoration.underline,
            ),
      ),
    );
  }
}

class PersonalDetailsSection extends StatelessWidget {
  const PersonalDetailsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return uiDeps.formWidget(
      uiDeps.userDetailsFormFactory,
      (context, FormInfo<UserDetails> info) {
        final cubit = context.read<FormCubit<UserDetails>>();
        return SectionWidget(
          title: Text("Details"),
          action: Padding(
            padding: const EdgeInsets.all(8.0),
            child: info.action,
          ),
          content: Column(
            children: [
              CustomFormTextField(
                label: "full name",
                updValue: (v) => cubit.valueEdited(info.current.copyWith(fullName: v)),
                getValue: (UserDetails ud) => ud.fullName,
              ),
              CustomFormTextField(
                label: "last name",
                updValue: (v) => cubit.valueEdited(info.current.copyWith(lastName: v)),
                getValue: (UserDetails ud) => ud.lastName,
              ),
              CustomFormTextField(
                label: "phone number",
                updValue: (v) => cubit.valueEdited(info.current.copyWith(phone: v)),
                getValue: (UserDetails ud) => ud.phone,
              ),
              EmailField(),
              DatePickerField(
                enabled: info.isEditing,
                updValue: (v) => cubit.valueEdited(info.current.copyWith(birthDate: v)),
                current: info.current.birthDate,
                label: "birth date",
                format: (dt) => "${dt.month}/${dt.day}/${dt.year}",
                first: DateTime(1900),
                last: DateTime.now(),
              ),
            ].withSpaceBetween(height: ThemeConstants.textFieldSpacing),
          ),
        );
      },
    );
  }
}
