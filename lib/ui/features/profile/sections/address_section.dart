import 'package:avencia/logic/features/user/user_details/internal/values.dart';
import 'package:avencia/ui/core/general/helpers.dart';
import 'package:avencia/ui/core/general/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpers/logic/forms/form_cubit.dart';
import 'package:helpers/ui/forms/custom_form_text_field.dart';
import 'package:helpers/ui/forms/form_widget.dart';

import '../../../../di.dart';
import '../../dashboard/section_widget.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return uiDeps.formWidget(
      uiDeps.addressFormFactory,
      (context, FormInfo<Address> info) {
        final cubit = context.read<FormCubit<Address>>();
        return SectionWidget(
          title: Text("Address"),
          action: Padding(
            padding: const EdgeInsets.all(8.0),
            child: info.action,
          ),
          content: Column(
            children: [
              CustomFormTextField(
                label: "address",
                updValue: (v) => cubit.valueEdited(info.current.copyWith(address: v)),
                getValue: (Address a) => a.address,
              ),
              CustomFormTextField(
                label: "city",
                updValue: (v) => cubit.valueEdited(info.current.copyWith(city: v)),
                getValue: (Address a) => a.city,
              ),
              CustomFormTextField(
                label: "state",
                updValue: (v) => cubit.valueEdited(info.current.copyWith(state: v)),
                getValue: (Address a) => a.state,
              ),
            ].withSpaceBetween(height: ThemeConstants.textFieldSpacing),
          ),
        );
      },
    );
  }
}
