import 'package:avencia/ui/core/general/themes/theme.dart';
import 'package:avencia/ui/features/new/card_with_buttons.dart';
import 'package:avencia/ui/features/new/dashboard/section_widget.dart';
import 'package:avencia/ui/features/new/profile/sections/personal_details.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:helpers/ui/forms/custom_text_field.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SectionWidget(
      title: Text("Your Address"),
      action: EditButton(),
      content: Column(
          children: [
        CustomTextField(
          hint: "Input your address",
          label: "address",
          updValue: (_) {},
          initial: Right(""),
        ),
        CustomTextField(
          label: "city",
          hint: "Input your city",
          updValue: (_) {},
          initial: Right(""),
        ),
        CustomTextField(
          label: "state",
          hint: "Input your state",
          updValue: (_) {},
          initial: Right(""),
        ),
      ].withSpaceBetween(height: ThemeConstants.textFieldSpacing)),
    );
  }
}
