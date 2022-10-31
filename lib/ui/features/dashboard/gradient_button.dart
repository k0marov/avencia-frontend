import 'package:flutter/material.dart';

import '../../core/general/themes/theme.dart';

class GradientButton extends StatelessWidget {
  final Widget content;
  final void Function() onPressed;
  const GradientButton({
    Key? key,
    required this.content,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    return Container(
      decoration: BoxDecoration(
        gradient: Gradients.avenciaDiagonal,
        borderRadius: BorderRadius.circular(40),
        boxShadow: const <BoxShadow>[
          BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.57), blurRadius: 3)
        ],
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          overlayColor: MaterialStateProperty.all(Colors.white24),
        ),
        onPressed: () {},
        child: content,
      ),
    );
  }
}
