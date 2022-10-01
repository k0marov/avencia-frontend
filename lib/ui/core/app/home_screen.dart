import 'package:avencia/ui/funds/funds_screen.dart';
import 'package:flutter/material.dart';

import '../../profile/profile_screen.dart';
import '../../transactions/transaction_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  static const screens = [TransactionScreen(), FundsScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex], //SingleChildScrollView(child: screens[_currentIndex]),
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.request_quote),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notes),
            label: 'Funds',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        onTap: (ind) => setState(() => _currentIndex = ind),
      ),
    );
  }
}