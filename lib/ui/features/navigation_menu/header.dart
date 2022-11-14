import 'package:avencia/di.dart';
import 'package:avencia/ui/core/app/routing.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../logic/features/wallets/internal/values.dart';
import '../../core/app/logo_widget.dart';
import '../../core/general/themes/theme.dart';
import '../../core/widgets/card_with_buttons.dart';
import '../../core/widgets/custom_icon_button.dart';
import '../../core/widgets/icon_with_text.dart';

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
          end: Alignment.bottomLeft,
          colors: [
            Theme.of(context).colorScheme.primary.withAlpha(65),
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
          onPressed: () => Scaffold.of(context).closeDrawer(),
          icon: Icon(Icons.close, color: Theme.of(context).iconTheme.color),
        )
      ]),
    );
  }
}

class _BalanceSection extends StatelessWidget {
  const _BalanceSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: optimize this somehow, since loading all of the wallets info every time you open then nav bar is not good
    final theme = Theme.of(context);
    final text = theme.textTheme;
    return Column(children: [
      Row(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Balance", style: text.headline5),
          uiDeps.simpleBuilder<Wallets>(
            load: uiDeps.getWallets,
            loadingBuilder: () => Text("\$0.00", style: text.headline2),
            loadedBuilder: (context, wallets) {
              final usdTotal = uiDeps.getUsdTotal(wallets);
              return Text("\$${usdTotal.toStringAsFixed(2)}", style: text.headline2);
            },
          ),
        ]),
        Spacer(),
        SizedBox(
          height: 55,
          width: 55,
          child: CustomIconButton(
            iconSize: 25,
            onPressed: () => context.go(Routes.orders.fullPath),
            icon: Icons.monitor_heart,
          ),
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
    return CardWithButtons(
      body: _BalanceAdditionalInfo(),
      buttons: [
        ButtonData(
          onPressed: () => context.go(Routes.wallets.fullPath),
          contents: IconWithText(
            icon: Icons.arrow_downward,
            text: Text(
              "Deposit",
              style: text.button,
            ),
          ),
          highlighted: true,
        ),
        ButtonData(
          onPressed: () => context.go(Routes.wallets.fullPath),
          contents: IconWithText(
            icon: Icons.arrow_upward,
            text: Text(
              "Withdraw",
              style: text.button?.copyWith(color: text.headline3?.color),
            ),
          ),
        ),
      ],
    );
  }
}

class _BalanceAdditionalInfo extends StatelessWidget {
  const _BalanceAdditionalInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    return Column(children: [
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
    ]);
  }
}
