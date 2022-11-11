import 'package:avencia/ui/core/widgets/simple_button.dart';
import 'package:flutter/material.dart';

class ButtonData {
  final void Function() onPressed;
  final Widget contents;
  final bool highlighted;
  const ButtonData({
    required this.onPressed,
    required this.contents,
    this.highlighted = false,
  });
}

class CardWithButtons extends StatelessWidget {
  final Widget body;
  final List<ButtonData> buttons;
  const CardWithButtons({
    Key? key,
    required this.body,
    required this.buttons,
  }) : super(key: key);

  static const _spacing = 5.0;
  static const _bRadius = Radius.circular(15);

  BorderRadius _getButtonBRadius(int i) {
    if (i == 0) return BorderRadius.only(bottomLeft: _bRadius);
    if (i == buttons.length - 1) return BorderRadius.only(bottomRight: _bRadius);
    return BorderRadius.zero;
  }

  Widget _buildButtons(BuildContext context) {
    final widgets = <Widget>[];
    for (int i = 0; i < buttons.length; ++i) {
      if (i > 0) widgets.add(SizedBox(width: _spacing));
      final buttonWidget = widgets.add(Expanded(
        child: SimpleButton(
          onPressed: buttons[i].onPressed,
          contents: buttons[i].contents,
          borderRadius: _getButtonBRadius(i),
          background: buttons[i].highlighted ? Theme.of(context).colorScheme.primary : null,
        ),
      ));
    }
    return Row(children: widgets);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.onSecondaryContainer,
            borderRadius: BorderRadius.only(topLeft: _bRadius, topRight: _bRadius),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: body,
          ),
        ),
        SizedBox(height: _spacing),
        _buildButtons(context),
      ],
    );
  }
}
