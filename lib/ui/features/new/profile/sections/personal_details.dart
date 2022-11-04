import 'package:avencia/ui/features/new/card_with_buttons.dart';
import 'package:avencia/ui/features/new/dashboard/dashboard_section.dart';
import 'package:avencia/ui/features/new/profile/sections/address_section.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:helpers/ui/forms/custom_text_field.dart';

class EditButton extends StatelessWidget {
  const EditButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: const Text(
        "Edit",
        style: TextStyle(decoration: TextDecoration.underline),
      ),
    );
  }
}

class PersonalDetailsSection extends StatelessWidget {
  const PersonalDetailsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DashboardSection(
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
      ].withSpaceBetween(height: textFieldSpacing)),
    );
  }
}
