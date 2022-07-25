import 'package:flutter/material.dart';

class TransferWidget extends StatefulWidget {
  const TransferWidget({Key? key}) : super(key: key);

  @override
  State<TransferWidget> createState() => _TransferWidgetState();
}

class _TransferWidgetState extends State<TransferWidget> {
  String _email = "";
  String _currency = "";
  double _amount = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (email) => setState(() => _email = email),
        ),
      ],
    );
  }
}
