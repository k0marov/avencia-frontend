import 'package:avencia/ui/features/new/dashboard/dashboard_section.dart';
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
      content: Column(children: [
        CustomTextField(
          enabled: false,
          hint: "full name",
          updValue: (_) {},
          initial: Right(""),
        ),
        CustomTextField(
          enabled: false,
          hint: "last name",
          updValue: (_) {},
          initial: Right(""),
        ),
        CustomTextField(
          enabled: false,
          hint: "email",
          updValue: (_) {},
          initial: Right(""),
        ),
        CustomTextField(
          enabled: false,
          hint: "phone number",
          updValue: (_) {},
          initial: Right(""),
        ),
        CustomTextField(
          enabled: false,
          hint: "birth date",
          updValue: (_) {},
          initial: Right(""),
        ),
      ]),
    );
  }
}
