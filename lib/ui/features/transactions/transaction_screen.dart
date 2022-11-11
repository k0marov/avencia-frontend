import 'package:avencia/logic/features/transactions/internal/values.dart';
import 'package:avencia/ui/core/widgets/simple_screen.dart';
import 'package:avencia/ui/features/transactions/transaction_code_widget.dart';
import 'package:flutter/material.dart';

class TransactionScreen extends StatelessWidget {
  final MetaTransaction trans;
  const TransactionScreen({Key? key, required this.trans}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleScreen(
      title: "Transaction",
      contents: [TransactionCodeWidget(metaTrans: trans)],
    );
  }
}
