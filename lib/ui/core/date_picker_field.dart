import 'package:flutter/material.dart';

final labelStyle = TextStyle(fontSize: 16, color: Colors.grey[400]);

class DatePickerField extends StatelessWidget {
  // This should trigger an update higher in the widget tree
  final Function(DateTime) onChanged;
  final String label;
  final DateTime current;
  final String Function(DateTime) format;
  final DateTime first;
  final DateTime last;
  const DatePickerField({
    Key? key,
    required this.label,
    required this.onChanged,
    required this.current,
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
        onTap: () async {
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
        child: Container(
          padding: EdgeInsets.only(top: 5, bottom: 12, left: 20, right: 20),
          decoration: BoxDecoration(
            color: Colors.white12,
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
