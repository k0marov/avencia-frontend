import 'package:avencia/ui/features/new/dashboard/icon_with_text.dart';
import 'package:flutter/material.dart';

import '../../../core/general/themes/theme.dart';

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
        boxShadow: [
          BoxShadow(
            offset: Offset(5, 5),
            color: theme.colorScheme.primary.withAlpha(125),
            blurRadius: 10,
          )
        ],
      ),
      child: MaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.zero,
        shape: StadiumBorder(),
        onPressed: () {},
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Theme(
            data: theme.copyWith(
              iconTheme: theme.iconTheme.copyWith(
                color: text.button?.color,
                size: IconWithText.getIconSize(text.button, theme),
              ),
            ),
            child: DefaultTextStyle(
              style: text.button ?? TextStyle(),
              child: content,
            ),
          ),
        ),
      ),
    );
  }
}
