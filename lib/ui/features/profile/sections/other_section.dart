import 'package:avencia/ui/core/general/helpers.dart';
import 'package:avencia/ui/core/general/themes/theme.dart';
import 'package:avencia/ui/features/auth/display_name_field.dar.dart';
import 'package:avencia/ui/features/auth/email_field.dart';
import 'package:avencia/ui/features/dashboard/section_widget.dart';
import 'package:flutter/material.dart';

// TODO: change the splash screen to have dynamic theme brightness

class OtherSection extends StatelessWidget {
  const OtherSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SectionWidget(
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text("Other"),
      ),
      content: Column(
        children: [
          DisplayNameField(),
          EmailField(),
        ].withSpaceBetween(height: ThemeConstants.cardSpacing),
      ),
    );
  }
}
