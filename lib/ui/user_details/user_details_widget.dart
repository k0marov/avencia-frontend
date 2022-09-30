import 'package:avencia/di.dart';
import 'package:avencia/logic/user_details/internal/user_details.dart';
import 'package:avencia/ui/core/custom_text_field.dart';
import 'package:avencia/ui/core/date_picker_field.dart';
import 'package:avencia/ui/core/form_section_widget.dart';
import 'package:avencia/ui/core/form_widget.dart';
import 'package:flutter/material.dart';

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
      updButton: i.updButton,
      fields: [
        CustomTextField(
          initial: a.address,
          label: "Address",
          onChanged: (val) => updAddr(a.copyWith(address: val)),
        ),
        CustomTextField(
          initial: a.city,
          label: "City",
          onChanged: (val) => updAddr(a.copyWith(city: val)),
        ),
        CustomTextField(
          initial: a.state,
          label: "State",
          onChanged: (val) => updAddr(a.copyWith(state: val)),
        ),
        CustomTextField(
          initial: a.nation,
          label: "Nationality",
          onChanged: (val) => updAddr(a.copyWith(nation: val)),
        ),
        CustomTextField(
          initial: a.zipCode,
          label: "Zip Code",
          onChanged: (val) => updAddr(a.copyWith(zipCode: val)),
        ),
      ],
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
      updButton: i.updButton,
      fields: [
        CustomTextField(
          initial: i.current.fullName,
          label: "Full Name",
          onChanged: (val) => i.update(i.current.copyWith(fullName: val)),
        ),
        CustomTextField(
          initial: i.current.displayName,
          label: "Display Name",
          onChanged: (val) => i.update(i.current.copyWith(displayName: val)),
        ),
        CustomTextField(
          initial: i.current.email,
          label: "Email",
          onChanged: (val) => i.update(i.current.copyWith(email: val)),
        ),
        CustomTextField(
          initial: i.current.phone,
          label: "Phone",
          onChanged: (val) => i.update(i.current.copyWith(phone: val)),
        ),
        DatePickerField(
          onChanged: (val) => i.update(i.current.copyWith(birthDate: val)),
          current: i.current.birthDate,
          format: (dt) => "${dt.month}/${dt.day}/${dt.year}",
          label: "Birth Date",
          first: DateTime(1900),
          last: DateTime.now(),
        ),
      ],
    );
  }
}
