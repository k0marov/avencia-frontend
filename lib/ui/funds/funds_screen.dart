import 'package:flutter/material.dart';

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
      child: Center(
        child: FutureBuilder(
          future: Future.value(DateTime.now()), // todo
          builder: (context, snapshot) => snapshot.data == null
              ? CircularProgressIndicator()
              : ListView(
                  children: [Text(snapshot.data.toString())],
                ),
        ),
      ),
    );
  }
}
