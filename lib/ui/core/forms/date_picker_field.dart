import 'package:avencia/logic/core/cubit_form/form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/core/entity/entity.dart';
import '../general/style.dart';

class DatePickerField<V extends Value> extends StatelessWidget {
  final DateTime current;
  // This should trigger an update higher in the widget tree
  final Function(DateTime) updValue;
  final String label;
  final String Function(DateTime) format;
  final DateTime first;
  final DateTime last;
  const DatePickerField({
    Key? key,
    required this.updValue,
    required this.current,
    required this.label,
    required this.format,
    required this.first,
    required this.last,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        onTap: !context.read<FormCubit<V>>().state.isEditing
            ? null
            : () async {
                final chosenDate = await showDatePicker(
                  context: context,
                  initialDate: current,
                  firstDate: first,
                  lastDate: last,
                );
                if (chosenDate != null) {
                  updValue(chosenDate);
                }
              },
        child: Container(
          padding: EdgeInsets.only(top: 5, bottom: 20, left: 20, right: 20),
          decoration: BoxDecoration(
            color: fieldFill,
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                textScaleFactor: 0.8,
                style: labelStyle,
              ),
              SizedBox(height: 7),
              Text(format(current)),
            ],
          ),
        ),
      ),
    );
  }
}
