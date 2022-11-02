import 'package:flutter/material.dart';

import '../../../core/app/logo_widget.dart';
import '../../../core/general/themes/theme.dart';
import '../icon_with_text.dart';
import '../simple_button.dart';

class NavigationHeader extends StatelessWidget {
  const NavigationHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.topLeft,
          colors: [
            Theme.of(context).colorScheme.primary.withAlpha(20),
            Colors.transparent,
          ],
        ),
      ),
      child: Column(
        children: [
          _NavigationAppBar(),
          _BalanceSection(),
          SizedBox(height: 15),
          _BalanceActions(),
        ],
      ),
    );
  }
}

class _NavigationAppBar extends StatelessWidget {
  const _NavigationAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(children: [
        SizedBox(
            child: LogoWidget(
          width: 150,
        )),
        Spacer(),
        IconButton(
          iconSize: 25,
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.close, color: TextColors.greyText),
        )
      ]),
    );
  }
}

class _BalanceSection extends StatelessWidget {
  const _BalanceSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    return Column(children: [
      Row(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Balance", style: text.headline5),
          Text("\$156,153,517,892", style: text.headline2),
        ]),
        Spacer(),
        SizedBox(
          height: 55,
          width: 55,
          child: SimpleButton(iconSize: 25, onPressed: () {}, icon: Icons.monitor_heart),
        ),
      ])
    ]);
  }
}

const _actionsBorderRadius = Radius.circular(15);

class _BalanceActions extends StatelessWidget {
  const _BalanceActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    const spacing = 5.0;
    return Column(
      children: [
        _BalanceAdditionalInfo(),
        SizedBox(height: spacing),
        Row(children: [
          _BalanceActionButton(
            contents: IconWithText(
              text: "Deposit",
              icon: Icons.arrow_downward,
              style: text.button,
            ),
            borders: BorderRadius.only(bottomLeft: _actionsBorderRadius),
            bgColor: theme.colorScheme.primary,
          ),
          SizedBox(width: spacing),
          _BalanceActionButton(
            contents: IconWithText(
              text: "Withdraw",
              icon: Icons.arrow_upward,
              style: text.headline4,
            ),
            borders: BorderRadius.only(bottomRight: _actionsBorderRadius),
            bgColor: theme.colorScheme.secondaryContainer,
          ),
        ])
      ],
    );
  }
}

class _BalanceActionButton extends StatelessWidget {
  final IconWithText contents;
  final BorderRadius borders;
  final Color bgColor;
  const _BalanceActionButton({
    Key? key,
    required this.contents,
    required this.borders,
    required this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    return Expanded(
      child: SizedBox(
        height: 40,
        child: Material(
          color: bgColor,
          borderRadius: borders,
          child: InkWell(
            borderRadius: borders,
            splashColor: Colors.white,
            onTap: () {},
            child: Center(
              child: contents,
            ),
          ),
        ),
      ),
    );
  }
}

class _BalanceAdditionalInfo extends StatelessWidget {
  const _BalanceAdditionalInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.secondaryContainer,
        borderRadius: BorderRadius.only(
          topLeft: _actionsBorderRadius,
          topRight: _actionsBorderRadius,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(children: [
          Row(
            children: [
              Icon(Icons.label, size: 12),
              SizedBox(width: 8),
              Text("Profits", style: text.bodyText2),
              Spacer(),
              Text("+13,5%", style: text.bodyText2?.copyWith(color: AppColors.green)),
              Spacer(),
              Text("+ 0.0525 BTC", style: text.bodyText2),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.timer, size: 12),
              SizedBox(width: 8),
              Text("Deposit in orders", style: text.bodyText2),
              Spacer(),
              Text("+ 0.005400 BTC", style: text.bodyText2),
            ],
          )
        ]),
      ),
    );
  }
}
