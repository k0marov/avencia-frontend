import 'package:avencia/ui/core/general/themes/theme.dart';
import 'package:flutter/material.dart';

class CurrencyIcon extends StatelessWidget {
  final String currency;
  const CurrencyIcon({
    Key? key,
    required this.currency,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/currencies/${currency.toLowerCase()}.png",
      errorBuilder: (_, __, ___) => AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.purple,
            shape: BoxShape.circle,
          ),
          child: Center(child: Text(currency[0], style: Theme.of(context).textTheme.button)),
        ),
      ),
    );
  }
}
