import 'package:flutter/material.dart';

import '../../../core/general/themes/theme.dart';
import '../icon_with_text.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderRadius = BorderRadius.all(Radius.circular(20));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Material(
        color: AppColors.whiteButton,
        borderRadius: borderRadius,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: IconWithText(
                text: "Support",
                icon: Icons.question_mark_outlined,
                style: theme.textTheme.headline3,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
