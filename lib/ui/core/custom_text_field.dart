import 'package:avencia/ui/core/date_picker_field.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? initial;
  final String? label;
  final Function(String) onChanged;
  const CustomTextField({
    Key? key,
    required this.initial,
    required this.label,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white12,
        ),
        child: TextFormField(
          initialValue: initial,
          onChanged: onChanged,
          decoration: InputDecoration(
            labelText: label,
            hintText: "Input your $label",
            contentPadding: EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 5),
            floatingLabelStyle: labelStyle,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
