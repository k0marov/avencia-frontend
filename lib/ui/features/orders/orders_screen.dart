import 'package:avencia/di.dart';
import 'package:avencia/logic/features/history/internal/entities.dart';
import 'package:avencia/ui/core/general/helpers.dart';
import 'package:avencia/ui/core/general/themes/theme.dart';
import 'package:avencia/ui/core/widgets/simple_screen.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:helpers/ui/errors/state_switch.dart';
import 'package:helpers/ui/forms/custom_text_field.dart';

import '../dashboard/section_widget.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    return uiDeps.simpleBuilder<History>(
      load: uiDeps.getHistory,
      loadingBuilder: () => SimpleScreen(
        title: "Orders",
        contentBuilder: (_) => AspectRatio(aspectRatio: 1, child: loadingWidget),
      ),
      loadedBuilder: (_, cubit) => SimpleScreen(
        title: 'Orders',
        onRefresh: cubit.refresh,
        contentBuilder: (_) => Column(
          children: [
            CustomTextField(
              hint: "Search",
              prefixIcon: Icon(Icons.search),
              updValue: (_) {},
              initial: Right(""),
            ),
            _AllOrders(),
          ].withSpaceBetween(height: ThemeConstants.sectionSpacing),
        ),
      ),
    );
  }
}

class _AllOrders extends StatelessWidget {
  const _AllOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SectionWidget(
      padding: EdgeInsets.zero,
      title: Padding(
        padding: const EdgeInsets.all(24),
        child: Text("All orders", style: Theme.of(context).textTheme.headline3),
      ),
      content: Column(
        children: [
          _DayOrders(
            dayName: "Today",
            orders: [],
          ),
          _DayOrders(
            dayName: "Yesterday",
            orders: [],
          ),
          SizedBox(height: 20),
        ].withSpaceBetween(height: 25),
      ),
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
