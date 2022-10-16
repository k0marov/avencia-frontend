import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../di.dart';
import '../../../logic/features/user/user_info/internal/entities.dart';

class FundsScreen extends StatelessWidget {
  const FundsScreen({Key? key}) : super(key: key);

  int _getCurrentStep(Limit l) => (l.withdrawn / l.max * 10).floor();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: uiDeps.simpleBuilder<UserInfo>(
        load: () => uiDeps.getUserInfo(null),
        loadedBuilder: (userInfo, cubit) => RefreshIndicator(
          onRefresh: () async => cubit.refresh(),
          child: ListView(children: [
            const SizedBox(height: 20),
            Text(
              "Your Funds",
              style: Theme.of(context).textTheme.displaySmall,
              textAlign: TextAlign.center,
            ),
            for (final entry in userInfo.wallet.entries)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Expanded(
                    child: Text(
                      entry.key,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      entry.value.toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ]),
              ),
            const SizedBox(height: 20),
            Text(
              "Withdraw Limits",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5,
            ),
            for (final entry in userInfo.limits.entries)
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          entry.key,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "${entry.value.withdrawn} of ${entry.value.max}",
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        StepProgressIndicator(
                          selectedGradientColor:
                              const LinearGradient(colors: [Colors.pink, Colors.blue]),
                          size: 8,
                          roundedEdges: const Radius.circular(5),
                          currentStep: _getCurrentStep(entry.value),
                          totalSteps: 10,
                        ),
                        const SizedBox(height: 5),
                        Row(children: [
                          const Text("0"),
                          const Spacer(),
                          Text(entry.value.max.toString()),
                        ])
                      ],
                    ),
                  ),
                ),
              ),
            // title: Column(
            //   children: [
            //     LinearProgressIndicator(value: entry.value.withdrawn / entry.value.max),
            //     Row(children: [
            //       Align(alignment: Alignment.centerLeft, child: Text("0")),
            //       Spacer(),
            //       Align(alignment: Alignment.centerRight, child: Text(entry.value.max.toString())),
            //     ])
            //   ],
            // ),
          ]),
        ),
      ),
      // ]),
    );
  }
}
