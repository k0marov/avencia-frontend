import 'package:avencia/logic/features/dashboard/internal/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpers/logic/core.dart';
import 'package:helpers/logic/simple_cubit.dart';

import '../../../core/widgets/history_entry_widget.dart';
import '../section_widget.dart';

class RecentActivitiesSection extends StatelessWidget {
  const RecentActivitiesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const actionsSpacing = SizedBox(height: 15);
    final state = context.read<SimpleCubit<FullUserInfo>>().state;
    final history = state.assertLoaded().history;
    return SectionWidget(
      title: Text("Recent Activities"),
      action: IconButton(
        onPressed: () {},
        icon: Icon(Icons.more_horiz),
      ),
      content: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        TextButton(
          onPressed: () {},
          child: Text("Buy"),
          style: TextButton.styleFrom(
            backgroundColor: Theme.of(context).highlightColor,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text("Sell"),
        ),
        TextButton(
          onPressed: () {},
          child: Text("All"),
        ),
        SizedBox(height: 18),
        ...history.entries.map((entry) => HistoryEntryWidget(entry: entry)).toList(),
        actionsSpacing,
      ]),
    );
  }
}
