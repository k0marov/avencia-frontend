import 'package:avencia/di.dart';
import 'package:avencia/logic/user_details/internal/user_details.dart';
import 'package:avencia/ui/auth/email_field.dart';
import 'package:avencia/ui/core/forms/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../core/forms/date_picker_field.dart';
import '../core/forms/form_section_widget.dart';
import '../core/forms/form_widget.dart';

class UserDetailsForm extends StatelessWidget {
  const UserDetailsForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormWidget<UserDetails>(
      cubitFactory: uiDeps.userDetailsFormFactory,
      bodyBuilder: (info) => Column(
        children: [
          _PersonalDetailsSection(
            i: info,
          ),
          SizedBox(height: 20),
          _AddressSection(i: info),
        ],
      ),
    );
  }
}

class _PersonalDetailsSection extends StatelessWidget {
  final FormInfo<UserDetails> i;
  const _PersonalDetailsSection({
    required this.i,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormSectionWidget(
      title: "Personal Details",
      updButton: i.action,
      fields: [
        CustomTextField<UserDetails>(
          label: "full name",
          updValue: (val) => i.update(i.current.copyWith(fullName: val)),
          getValue: (val) => val.fullName,
        ),
        CustomTextField<UserDetails>(
          label: "display name",
          updValue: (val) => i.update(i.current.copyWith(displayName: val)),
          getValue: (val) => val.displayName,
        ),
        EmailField(),
        CustomTextField<UserDetails>(
          label: "phone",
          updValue: (val) => i.update(i.current.copyWith(phone: val)),
          getValue: (val) => val.phone,
        ),
        DatePickerField<UserDetails>(
          updValue: (val) => i.update(i.current.copyWith(birthDate: val)),
          current: i.current.birthDate,
          format: (dt) => "${dt.month}/${dt.day}/${dt.year}",
          label: "birth date",
          first: DateTime(1900),
          last: DateTime.now(),
        ),
      ],
    );
  }
}

class _AddressSection extends StatelessWidget {
  final FormInfo<UserDetails> i;
  const _AddressSection({
    required this.i,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final a = i.current.address;
    void updAddr(Address addr) => i.update(i.current.copyWith(address: addr));
    return FormSectionWidget(
      title: "Your Address",
      updButton: i.action,
      fields: [
        CustomTextField<UserDetails>(
          label: "address",
          updValue: (val) => updAddr(a.copyWith(address: val)),
          getValue: (val) => val.address.address,
        ),
        CustomTextField<UserDetails>(
          label: "city",
          updValue: (val) => updAddr(a.copyWith(city: val)),
          getValue: (val) => val.address.city,
        ),
        CustomTextField<UserDetails>(
          label: "state",
          updValue: (val) => updAddr(a.copyWith(state: val)),
          getValue: (val) => val.address.state,
        ),
        CustomTextField<UserDetails>(
          label: "nationality",
          updValue: (val) => updAddr(a.copyWith(nation: val)),
          getValue: (val) => val.address.nation,
        ),
        CustomTextField<UserDetails>(
          label: "zip code",
          updValue: (val) => updAddr(a.copyWith(zipCode: val)),
          getValue: (val) => val.address.zipCode,
        ),
      ],
    );
  }
}
