import 'package:avencia/ui/features/dashboard/app_bar.dart';
import 'package:avencia/ui/features/dashboard/simple_button.dart';
import 'package:flutter/material.dart';

import '../../core/general/themes/theme.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(Theme.of(context).backgroundColor);
    return Scaffold(
      appBar: createAvenciaAppBar(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            Material(
              elevation: 5,
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(25),
              shadowColor: Colors.black,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(children: [
                      Text("Overview", style: Theme.of(context).textTheme.titleLarge),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.more_horiz),
                      ),
                    ]),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Balance",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              "\$156,153,517,892",
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            SizedBox(height: 20),
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
                                      backgroundColor:
                                          MaterialStateProperty.all(Colors.transparent),
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
                                          color: Theme.of(context).colorScheme.onPrimary,
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          "Deposit",
                                          style: TextStyle(
                                              letterSpacing: 1.5,
                                              color: Theme.of(context).colorScheme.onPrimary),
                                        )
                                      ]),
                                    ),
                                  ),
                                ),
                              ]),
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                        child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(children: [
                        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text("Transactions", style: Theme.of(context).textTheme.titleMedium),
                          Text("34,405",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontWeight: FontWeight.bold)),
                        ]),
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
                      ]),
                    ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
