import 'package:flutter/material.dart';

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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => _refresh(),
      child: SingleChildScrollView(
        child: SimpleFutureBuilder<UserInfo>(
          future: uiDeps.getUserInfo(),
          loading: CircularProgressIndicator(),
          loadedBuilder: (userInfo) => Column(children: [
            Text(
              "Your funds",
            ),
            Text(userInfo.wallet.toString()),
            Text(userInfo.limits.toString()),
          ]),
          exceptionBuilder: (exception) => Text(exception.toString()),
        ),
      ),
    );
  }
}
