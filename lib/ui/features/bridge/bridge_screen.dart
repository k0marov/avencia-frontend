import 'package:avencia/ui/core/general/helpers.dart';
import 'package:avencia/ui/core/widgets/gradient_button.dart';
import 'package:avencia/ui/core/widgets/simple_screen.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:helpers/ui/forms/custom_text_field.dart';

class BridgeScreen extends StatelessWidget {
  const BridgeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    return SimpleScreen(
      title: "Bridge",
      contentBuilder: (context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Token Balance: 0.0", style: text.headline4),
          Text("Required transaction fee to cross-chain Transfer: 0.0", style: text.headline4),
          Text("Minimum Token Amount to Transfer: 0", style: text.headline4),
          SizedBox(height: 5),
          Theme(
            data: theme.copyWith(
              colorScheme: theme.colorScheme.copyWith(
                secondaryContainer: theme.colorScheme.primaryContainer,
              ),
            ),
            child: CustomTextField(
              updValue: (_) {},
              label: "transfer amount",
              hint: "0",
              initial: Right(""),
            ),
          ),
          Row(
              children: [
            SizedBox(
              width: 100,
              child: GradientButton(
                content: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text("Button"),
                ),
                onPressed: () {},
              ),
            ),
            Icon(Icons.arrow_forward),
            Card(
              child: SizedBox(
                height: 50,
                width: 100,
                child: Center(
                  child: Text("Value 1"),
                ),
              ),
            ),
          ].withSpaceBetween(width: 10)),
          SizedBox(
            width: 100,
            child: GradientButton(
              content: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text("Approve"),
              ),
              onPressed: () {},
            ),
          ),
        ].withSpaceBetween(height: 10),
      ),
    );
  }
}
