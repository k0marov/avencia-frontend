import 'package:flutter/material.dart';

class FlatColorButton extends StatelessWidget {
  const FlatColorButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
            primary: Colors.white,
            backgroundColor: Colors.red.shade400,
            fixedSize: Size(150, 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
              side: BorderSide(color: Colors.grey.shade500, width: 2),
            )),
        child: Text("LOGOUT", style: TextStyle(fontSize: 18, color: Colors.white)),
      ),
    );
  }
}
