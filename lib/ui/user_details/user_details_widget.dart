import 'package:avencia/di.dart';
import 'package:avencia/logic/user_details/internal/user_details.dart';
import 'package:avencia/ui/core/form_widget.dart';
import 'package:flutter/material.dart';

class UserDetailsForm extends StatelessWidget {
  const UserDetailsForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormWidget<UserDetails>(
      cubitFactory: uiDeps.userDetailsFormFactory,
      fields: (current, update) => Column(children: [
        TextFormField(
          initialValue: current.email,
          onChanged: (email) => update(current.copyWith(email: email)),
        ),
      ]),
    );
  }
}
