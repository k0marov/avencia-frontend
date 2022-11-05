import 'package:avencia/ui/core/general/helpers.dart';
import 'package:avencia/ui/features/new/dashboard/section_widget.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:helpers/ui/forms/custom_text_field.dart';

import '../../../../core/general/themes/theme.dart';

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
    return SectionWidget(
      title: Text("Personal Details"),
      action: EditButton(),
      content: Column(
          children: [
        CustomTextField(
          hint: "Input your full name",
          label: "full name",
          updValue: (_) {},
          initial: Right(""),
        ),
        CustomTextField(
          hint: "Input your last name",
          label: "last name",
          updValue: (_) {},
          initial: Right(""),
        ),
        CustomTextField(
          hint: "Input your email",
          label: "email",
          updValue: (_) {},
          initial: Right(""),
        ),
        CustomTextField(
          hint: "Input your phone number",
          label: "phone number",
          updValue: (_) {},
          initial: Right(""),
        ),
        CustomTextField(
          hint: "Input your birth date",
          label: "birth date",
          updValue: (_) {},
          initial: Right(""),
        ),
      ].withSpaceBetween(height: ThemeConstants.textFieldSpacing)),
    );
  }
}
