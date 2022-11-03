import 'package:avencia/ui/features/new/dashboard/dashboard_section.dart';
import 'package:avencia/ui/features/new/profile/sections/personal_details.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:helpers/ui/forms/custom_text_field.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DashboardSection(
      title: "Your Address",
      action: EditButton(),
      content: Column(children: [
        CustomTextField(
          enabled: false,
          label: "address",
          updValue: (_) {},
          initial: Right(""),
        ),
        CustomTextField(
          enabled: false,
          label: "city",
          updValue: (_) {},
          initial: Right(""),
        ),
        CustomTextField(
          enabled: false,
          label: "state",
          updValue: (_) {},
          initial: Right(""),
        ),
      ]),
    );
  }
}
