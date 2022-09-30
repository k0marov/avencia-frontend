import 'package:flutter/material.dart';

class DatePickerField extends StatelessWidget {
  // This should trigger an update higher in the widget tree
  final Function(DateTime) onChanged;
  final DateTime current;
  final DateTime first;
  final DateTime last;
  const DatePickerField({
    Key? key,
    required this.onChanged,
    required this.current,
    required this.first,
    required this.last,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(current.toString()),
      onPressed: () async {
        final chosenDate = await showDatePicker(
          context: context,
          initialDate: current,
          firstDate: first,
          lastDate: last,
        );
        if (chosenDate != null) {
          onChanged(chosenDate);
        }
      },
    );
  }
}
