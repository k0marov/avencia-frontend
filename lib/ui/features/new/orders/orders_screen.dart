import 'package:avencia/ui/features/new/card_with_buttons.dart';
import 'package:avencia/ui/features/new/dashboard/dashboard_section.dart';
import 'package:avencia/ui/features/new/simple_screen.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:helpers/ui/forms/custom_text_field.dart';

import '../dashboard/sections/recent_activities.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    return SimpleScreen(
      title: 'Orders',
      contents: [
        CustomTextField(
          hint: "Search",
          prefixIcon: Icon(Icons.search),
          updValue: (_) {},
          initial: Right(""),
        ),
        DashboardSection(
          padding: EdgeInsets.zero,
          title: Padding(
            padding: const EdgeInsets.all(24),
            child: Text("All orders", style: text.headline3),
          ),
          content: Column(
            children: [
              _DayOrders(
                dayName: "Today",
                orders: [
                  ActionWidget(
                    currency: "BTC",
                    action: "Buy Bitcoin",
                    date: "26m ago",
                    usdAmount: "3,980.93 USD",
                    amount: "0.5384 BTC",
                  ),
                  ActionWidget(
                    currency: "ETH",
                    action: "Withdraw",
                    date: "3d 2h ago",
                    usdAmount: "3,980.93 USD",
                    amount: "0.5384 BTC",
                  ),
                  ActionWidget(
                    currency: "BTC",
                    action: "Buy Bitcoin",
                    date: "26m ago",
                    usdAmount: "3,980.93 USD",
                    amount: "0.5384 BTC",
                  ),
                  ActionWidget(
                    currency: "ETH",
                    action: "Withdraw",
                    date: "3d 2h ago",
                    usdAmount: "3,980.93 USD",
                    amount: "0.5384 BTC",
                  ),
                ],
              ),
              _DayOrders(
                dayName: "Yesterday",
                orders: [
                  ActionWidget(
                    currency: "BTC",
                    action: "Buy Bitcoin",
                    date: "26m ago",
                    usdAmount: "3,980.93 USD",
                    amount: "0.5384 BTC",
                  ),
                  ActionWidget(
                    currency: "ETH",
                    action: "Withdraw",
                    date: "3d 2h ago",
                    usdAmount: "3,980.93 USD",
                    amount: "0.5384 BTC",
                  ),
                  ActionWidget(
                    currency: "BTC",
                    action: "Buy Bitcoin",
                    date: "26m ago",
                    usdAmount: "3,980.93 USD",
                    amount: "0.5384 BTC",
                  ),
                  ActionWidget(
                    currency: "ETH",
                    action: "Withdraw",
                    date: "3d 2h ago",
                    usdAmount: "3,980.93 USD",
                    amount: "0.5384 BTC",
                  ),
                ],
              ),
              SizedBox(height: 20),
            ].withSpaceBetween(height: 25),
          ),
        ),
      ],
    );
  }
}

class _DayOrders extends StatelessWidget {
  final String dayName;
  final List<Widget> orders;
  const _DayOrders({
    Key? key,
    required this.dayName,
    required this.orders,
  }) : super(key: key);

  List<Widget> _buildOrders(BuildContext context) {
    final separator = Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      height: 2,
      color: Theme.of(context).colorScheme.onSecondaryContainer,
    );
    final separatedOrders = <Widget>[];
    for (int i = 0; i < orders.length; ++i) {
      separatedOrders.add(separator);
      separatedOrders.add(orders[i]);
    }
    return separatedOrders;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    return Column(children: [
      Text(
        dayName,
        style: text.headline3?.copyWith(fontWeight: FontWeight.bold),
      ),
      ..._buildOrders(context),
    ]);
  }
}
