import 'package:avencia/ui/features/dashboard/app_bar.dart';
import 'package:avencia/ui/features/dashboard/simple_button.dart';
import 'package:flutter/material.dart';

import '../../core/general/themes/theme.dart';
import 'dashboard_card.dart';
import 'dashboard_section.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    return Scaffold(
      appBar: createAvenciaAppBar(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: ListView(
          children: [
            Text("Dashboard", style: text.headline1),
            SizedBox(height: 15),
            DashboardSection(
              title: "Overview",
              action: IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_horiz),
              ),
              content: Column(
                children: const [
                  BalanceCard(),
                  SizedBox(height: 15),
                  TransactionsCard(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BalanceCard extends StatelessWidget {
  const BalanceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    return DashboardCard(
      title: "Balance",
      content: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text("\$156,153,517,892", style: text.headline2),
        SizedBox(height: 15),
        SizedBox(
          height: 40,
          child: Row(children: [
            SimpleButton(
              onPressed: () {},
              icon: Icons.settings,
            ),
            SizedBox(width: 15),
            SimpleButton(
              onPressed: () {},
              icon: Icons.compare_arrows,
            ),
            SizedBox(width: 15),
            Container(
              decoration: BoxDecoration(
                gradient: Gradients.avenciaHorizontal,
                borderRadius: BorderRadius.circular(40),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                      blurRadius: 3) //blur radius of shadow
                ],
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.transparent),
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                  overlayColor: MaterialStateProperty.all(Colors.white24),
                ),
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Row(children: [
                    Icon(
                      Icons.arrow_downward,
                      size: 20,
                      color: theme.textTheme.button?.color,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Deposit",
                      style: text.button,
                    )
                  ]),
                ),
              ),
            ),
          ]),
        )
      ]),
    );
  }
}

class TransactionsCard extends StatelessWidget {
  const TransactionsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    return DashboardCard(
        title: "Transactions",
        content: Row(children: [
          Text("34,405", style: text.headline2),
          Spacer(),
          SizedBox(
            width: 45,
            height: 45,
            child: SimpleButton(
              iconSize: 20,
              onPressed: () {},
              icon: Icons.send,
            ),
          ),
        ]));
  }
}
