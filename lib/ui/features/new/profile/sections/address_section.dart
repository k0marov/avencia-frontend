import 'package:avencia/ui/features/new/card_with_buttons.dart';
import 'package:avencia/ui/features/new/dashboard/dashboard_section.dart';
import 'package:avencia/ui/features/new/profile/sections/personal_details.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:helpers/ui/forms/custom_text_field.dart';

const textFieldSpacing = 15.0;

class AddressSection extends StatelessWidget {
  const AddressSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return DashboardSection(
      title: Text("Your Address"),
      action: EditButton(),
      content: Column(
          children: [
        CustomTextField(
          enabled: false,
          hint: "address",
          updValue: (_) {},
          initial: Right(""),
        ),
        CustomTextField(
          enabled: false,
          hint: "city",
          updValue: (_) {},
          initial: Right(""),
        ),
        CustomTextField(
          enabled: false,
          hint: "state",
          updValue: (_) {},
          initial: Right(""),
        ),
      ].withSpaceBetween(height: textFieldSpacing)),
    );
  }
}
