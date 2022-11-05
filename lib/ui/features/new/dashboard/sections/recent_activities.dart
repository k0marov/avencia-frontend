import 'package:flutter/material.dart';

import '../../history_entry.dart';
import '../section_widget.dart';

class RecentActivitiesSection extends StatelessWidget {
  const RecentActivitiesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const actionsSpacing = SizedBox(height: 15);
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
        HistoryEntry(
          currency: "BTC",
          action: "Buy Bitcoin",
          date: "26m ago",
          usdAmount: "3,980.93 USD",
          amount: "0.5384 BTC",
        ),
        actionsSpacing,
        HistoryEntry(
          currency: "ETH",
          action: "Withdraw",
          date: "3d 2h ago",
          usdAmount: "3,980.93 USD",
          amount: "0.5384 BTC",
        ),
        actionsSpacing,
        HistoryEntry(
          currency: "BTC",
          action: "Buy Bitcoin",
          date: "26m ago",
          usdAmount: "3,980.93 USD",
          amount: "0.5384 BTC",
        ),
        actionsSpacing,
        HistoryEntry(
          currency: "LTC",
          action: "Withdraw",
          date: "3d 2h ago",
          usdAmount: "3,980.93 USD",
          amount: "0.5384 BTC",
        ),
        actionsSpacing,
      ]),
    );
  }
}
