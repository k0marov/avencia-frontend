import 'package:flutter/material.dart';

class FlatColorButton extends StatelessWidget {
  final Color color;
  final Function() onPressed;
  const FlatColorButton({Key? key, required this.color, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            primary: Colors.white,
            backgroundColor: color,
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
