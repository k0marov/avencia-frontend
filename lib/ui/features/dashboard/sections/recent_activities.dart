import 'package:avencia/logic/features/dashboard/internal/values.dart';
import 'package:avencia/ui/core/app/routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:helpers/logic/core.dart';
import 'package:helpers/logic/simple_cubit.dart';
import 'package:helpers/logic/simple_state_cubit.dart';

import '../../../../logic/features/history/internal/entities.dart';
import '../../../core/widgets/history_entry_widget.dart';
import '../section_widget.dart';

enum ActivityFilter {
  buy,
  sell,
  all,
}

class RecentActivitiesSection extends StatelessWidget {
  const RecentActivitiesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SectionWidget(
      title: Text("Recent Activities"),
      action: TextButton(
        onPressed: () => context.go(Routes.orders.fullPath),
        child: Text("View All"),
      ),
      content: BlocProvider<SimpleStateCubit<ActivityFilter>>(
          create: (_) => SimpleStateCubit(ActivityFilter.all),
          child: BlocBuilder<SimpleStateCubit<ActivityFilter>, ActivityFilter>(
            builder: (context, state) => _ActivitiesContent(),
          )),
    );
  }
}

class _ActivitiesContent extends StatelessWidget {
  const _ActivitiesContent({Key? key}) : super(key: key);

  List<HistoryEntry> _filterEntries(History h, ActivityFilter filter) => h.entries.where(
        (e) {
          switch (filter) {
            case ActivityFilter.buy:
              return !e.money.amount.isNegative;
            case ActivityFilter.sell:
              return e.money.amount.isNegative;
            case ActivityFilter.all:
              return true;
          }
        },
      ).toList();

  @override
  Widget build(BuildContext context) {
    const actionsSpacing = SizedBox(height: 15);
    final state = context.read<SimpleCubit<FullUserInfo>>().state;
    final history = state.assertLoaded().history;
    final filterCubit = context.read<SimpleStateCubit<ActivityFilter>>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextButton(
          onPressed: () => filterCubit.setState(ActivityFilter.buy),
          child: Text("Buy"),
        ),
        TextButton(
          onPressed: () => filterCubit.setState(ActivityFilter.sell),
          child: Text("Sell"),
        ),
        TextButton(
          onPressed: () => filterCubit.setState(ActivityFilter.all),
          child: Text("All"),
          style: TextButton.styleFrom(
            backgroundColor: Theme.of(context).highlightColor,
          ),
        ),
        SizedBox(height: 18),
        ...(_filterEntries(history, filterCubit.state))
            .map((entry) => HistoryEntryWidget(entry: entry))
            .toList(),
        actionsSpacing,
      ],
    );
  }
}
