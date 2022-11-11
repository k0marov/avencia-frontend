import 'package:avencia/di.dart';
import 'package:avencia/logic/features/history/internal/entities.dart';
import 'package:avencia/logic/features/history/usecases.dart';
import 'package:avencia/ui/core/general/helpers.dart';
import 'package:avencia/ui/core/general/themes/theme.dart';
import 'package:avencia/ui/core/widgets/history_entry_widget.dart';
import 'package:avencia/ui/core/widgets/simple_screen.dart';
import 'package:avencia/ui/features/dashboard/sections/overview.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpers/logic/core.dart';
import 'package:helpers/logic/search_cubit.dart';
import 'package:helpers/logic/simple_cubit.dart';
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
        contentBuilder: (_) => BlocProvider<SearchCubit>(
          create: (_) => SearchCubit(),
          child: BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) => Column(
              children: [
                CustomTextField(
                  hint: "Search",
                  prefixIcon: Icon(Icons.search),
                  updValue: context.read<SearchCubit>().updSearchText,
                  initial: Right(state),
                ),
                _AllOrders(),
              ].withSpaceBetween(height: ThemeConstants.sectionSpacing),
            ),
          ),
        ),
      ),
    );
  }
}

class _AllOrders extends StatelessWidget {
  const _AllOrders({Key? key}) : super(key: key);

  History _filterHistory(History h, String query) {
    return History(h.entries
        .where(
          (e) =>
              e.money.currency.toString().toLowerCase().contains(query) ||
              e.money.amount.toString().contains(query) ||
              e.transactedAt.toIso8601String().contains(query) ||
              entryAction(e).toLowerCase().contains(query) ||
              getDayName(e.transactedAt).toLowerCase().contains(query) ||
              formatDate(e.transactedAt).toLowerCase().contains(query) ||
              getInDollars(e.money).toLowerCase().contains(query),
        )
        .toList());
  }

  @override
  Widget build(BuildContext context) {
    final state = context.read<SimpleCubit<History>>().state;
    final history = state.assertLoaded();
    final searchText = context.read<SearchCubit>().state;
    final filteredHistory = _filterHistory(history, searchText);
    return SectionWidget(
      padding: EdgeInsets.zero,
      title: Padding(
        padding: const EdgeInsets.all(24),
        child: Text("All orders", style: Theme.of(context).textTheme.headline3),
      ),
      content: Column(
        children: [
          ...splitHistoryByDay(filteredHistory)
              .map(
                (day) => _DayOrders(history: day),
              )
              .toList(),
          SizedBox(height: 20),
        ].withSpaceBetween(height: 25),
      ),
    );
  }
}

String getDayName(DateTime day) {
  final now = DateTime.now();
  final diff = DateTime(now.year, now.month, now.day)
      .difference(DateTime(day.year, day.month, day.day))
      .inDays;
  if (diff == 0) return "Today";
  if (diff == 1) return "Yesterday";
  return "${getMonth(day.month).substring(0, 3)} ${day.day}";
}

class _DayOrders extends StatelessWidget {
  final DayHistory history;
  const _DayOrders({
    Key? key,
    required this.history,
  }) : super(key: key);

  List<Widget> _buildOrders(BuildContext context) {
    final separator = Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      height: 2,
      color: Theme.of(context).colorScheme.onSecondaryContainer,
    );
    final separatedOrders = <Widget>[];
    for (int i = 0; i < history.operations.length; ++i) {
      separatedOrders.add(separator);
      separatedOrders.add(HistoryEntryWidget(entry: history.operations[i]));
    }
    return separatedOrders;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    return Column(children: [
      Text(
        getDayName(history.day),
        style: text.headline3?.copyWith(fontWeight: FontWeight.bold),
      ),
      ..._buildOrders(context),
    ]);
  }
}
