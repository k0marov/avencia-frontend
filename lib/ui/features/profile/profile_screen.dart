import 'package:avencia/ui/core/widgets/simple_screen.dart';
import 'package:avencia/ui/features/profile/sections/address_section.dart';
import 'package:flutter/material.dart';

import 'sections/documents_section.dart';
import 'sections/personal_details.dart';

class NewProfileScreen extends StatelessWidget {
  const NewProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleScreen(
      title: "My Profile",
      contentBuilder: (_) => Column(
        children: [
          PersonalDetailsSection(),
          AddressSection(),
          DocumentsSection(),
        ],
      ),
    );
  }
}
