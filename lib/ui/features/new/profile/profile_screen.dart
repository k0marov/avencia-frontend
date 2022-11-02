import 'package:avencia/ui/features/new/app_bar.dart';
import 'package:avencia/ui/features/new/navigation_menu/navigation_menu.dart';
import 'package:avencia/ui/features/user/user_details/user_details_form.dart';
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
      body: ListView(children: [
        Text("My Profile", style: text.headline2),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: UserDetailsForm(),
        ),
      ]),
    );
  }
}
