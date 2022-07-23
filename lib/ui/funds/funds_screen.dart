import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../di.dart';
import '../../logic/user_info/internal/entities.dart';
import '../core/simple_future_builder.dart';

class FundsScreen extends StatefulWidget {
  const FundsScreen({Key? key}) : super(key: key);

  @override
  State<FundsScreen> createState() => _FundsScreenState();
}

class _FundsScreenState extends State<FundsScreen> {
  void _refresh() {
    print("asdf");
    setState(() {});
  }

  int getCurrentStep(Limit l) => (l.withdrawn / l.max * 10).floor();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RefreshIndicator(
        onRefresh: () async => _refresh(),
        // child: ListView(children: [
        child: SimpleFutureBuilder<UserInfo>(
          future: uiDeps.getUserInfo(),
          loading: CircularProgressIndicator(),
          loadedBuilder: (userInfo) => ListView(children: [
            SizedBox(height: 20),
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
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      entry.value.toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ]),
              ),
            SizedBox(height: 20),
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
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "${entry.value.withdrawn} of ${entry.value.max}",
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        StepProgressIndicator(
                          selectedGradientColor: LinearGradient(colors: [Colors.pink, Colors.blue]),
                          size: 8,
                          roundedEdges: Radius.circular(5),
                          currentStep: getCurrentStep(entry.value),
                          totalSteps: 10,
                        ),
                        SizedBox(height: 5),
                        Row(children: [
                          Text("0"),
                          Spacer(),
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
          exceptionBuilder: (exception) => ListView(
            children: [
              Text(exception.toString()),
            ],
          ),
        ),
        // ]),
      ),
    );
  }
}
