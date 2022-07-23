import 'package:flutter/material.dart';

import '../../di.dart';
import '../../logic/user_info/internal/entities.dart';
import '../core/simple_future_builder.dart';

// TODO: (concerning backend) fix backend handling an integer value that is used as float64 (it gives 500)

class FundsScreen extends StatefulWidget {
  const FundsScreen({Key? key}) : super(key: key);

  @override
  State<FundsScreen> createState() => _FundsScreenState();
}

class _FundsScreenState extends State<FundsScreen> {
  void _refresh() {
    setState(() {});
  }

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
              "Your funds",
              style: Theme.of(context).textTheme.displaySmall,
              textAlign: TextAlign.center,
            ),
            for (final entry in userInfo.wallet.entries)
              ListTile(
                leading: Text(
                  entry.key,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                title: Text(entry.value.toString()),
              ),
            Text(
              "Withdraw Limits",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5,
            ),
            for (final entry in userInfo.limits.entries)
              ListTile(
                leading: Text(entry.key),
                title: LinearProgressIndicator(value: entry.value.withdrawn / entry.value.max),
              )
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
