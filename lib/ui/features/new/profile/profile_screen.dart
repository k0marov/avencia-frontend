import 'package:avencia/ui/features/new/profile/sections/address_section.dart';
import 'package:avencia/ui/features/new/profile/sections/documents_section.dart';
import 'package:avencia/ui/features/new/profile/sections/personal_details.dart';
import 'package:avencia/ui/features/new/simple_screen.dart';
import 'package:avencia/ui/features/profile/toggle_theme_widget.dart';
import 'package:flutter/material.dart';

class NewProfileScreen extends StatelessWidget {
  const NewProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleScreen(
      title: "My Profile",
      contents: [
        PersonalDetailsSection(),
        AddressSection(),
        DocumentsSection(),
        ToggleThemeWidget(),
      ],
    );
  }
}
