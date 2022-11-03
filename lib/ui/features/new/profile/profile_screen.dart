import 'package:avencia/ui/features/new/app_bar.dart';
import 'package:avencia/ui/features/new/dashboard/dashboard_screen.dart';
import 'package:avencia/ui/features/new/navigation_menu/navigation_menu.dart';
import 'package:avencia/ui/features/new/profile/sections/address_section.dart';
import 'package:avencia/ui/features/new/profile/sections/documents_section.dart';
import 'package:avencia/ui/features/new/profile/sections/personal_details.dart';
import 'package:flutter/material.dart';

class NewProfileScreen extends StatelessWidget {
  const NewProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    return Scaffold(
      appBar: createAvenciaAppBar(context),
      drawer: NavigationMenuDrawer(),
      body: Padding(
        padding: screenPadding,
        child: ListView(children: [
          Text("My Profile", style: text.headline2),
          SizedBox(height: sectionSpacing),
          PersonalDetailsSection(),
          SizedBox(height: sectionSpacing),
          AddressSection(),
          SizedBox(height: sectionSpacing),
          DocumentsSection(),
        ]),
      ),
    );
  }
}
