import 'package:avencia/di.dart';
import 'package:avencia/logic/user_details/internal/user_details.dart';
import 'package:avencia/ui/core/date_picker_field.dart';
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
          initialValue: current.fullName,
          onChanged: (val) => update(current.copyWith(fullName: val)),
        ),
        TextFormField(
          initialValue: current.displayName,
          onChanged: (val) => update(current.copyWith(displayName: val)),
        ),
        TextFormField(
          initialValue: current.email,
          onChanged: (val) => update(current.copyWith(email: val)),
        ),
        TextFormField(
          initialValue: current.phone,
          onChanged: (val) => update(current.copyWith(phone: val)),
        ),
        DatePickerField(
          onChanged: (val) => update(current.copyWith(birthDate: val)),
          current: current.birthDate,
          first: DateTime(1900),
          last: DateTime.now(),
        ),
        TextFormField(
            initialValue: current.address.address,
            onChanged: (val) => update(
                  current.copyWith(address: current.address.copyWith(address: val)),
                ))
      ]),
    );
  }
}
