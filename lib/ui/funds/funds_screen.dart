import 'package:flutter/material.dart';

class FundsScreen extends StatelessWidget {
  const FundsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(child: Center(child: ListView(children: []))),
      Expanded(child: ListView(children: [])),
    ]);
  }
}
