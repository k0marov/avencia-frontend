import 'package:avencia/ui/core/general/helpers.dart';
import 'package:avencia/ui/core/general/themes/theme.dart';
import 'package:avencia/ui/core/widgets/simple_screen.dart';
import 'package:avencia/ui/features/profile/sections/address_section.dart';
import 'package:avencia/ui/features/profile/sections/personal_details.dart';
import 'package:flutter/material.dart';

import '../../../di.dart';
import 'sections/documents_section.dart';

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
          TextButton(
            onPressed: uiDeps.authFacade.logout,
            child: Text("Logout", style: TextStyle(color: AppColors.red)),
          ),
        ].withSpaceBetween(height: ThemeConstants.sectionSpacing),
      ),
    );
  }
}
