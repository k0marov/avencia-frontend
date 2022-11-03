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
          label: "full name",
          updValue: (_) {},
          initial: Right(""),
        ),
        CustomTextField(
          enabled: false,
          label: "last name",
          updValue: (_) {},
          initial: Right(""),
        ),
        CustomTextField(
          enabled: false,
          label: "email",
          updValue: (_) {},
          initial: Right(""),
        ),
        CustomTextField(
          enabled: false,
          label: "phone number",
          updValue: (_) {},
          initial: Right(""),
        ),
        CustomTextField(
          enabled: false,
          label: "birth date",
          updValue: (_) {},
          initial: Right(""),
        ),
      ]),
    );
  }
}
