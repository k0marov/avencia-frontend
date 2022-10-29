import 'package:avencia/ui/features/dashboard/simple_button.dart';
import 'package:flutter/material.dart';

AppBar createAvenciaAppBar(BuildContext context) => AppBar(
      leadingWidth: Theme.of(context).appBarTheme.toolbarHeight,
      leading: Padding(
        padding: const EdgeInsets.all(10),
        child: SimpleButton(
          onPressed: () {},
          icon: Icons.list,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: Avatar(),
          ),
          SizedBox(width: 15),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("vino_costa", style: Theme.of(context).textTheme.titleLarge),
            Text("Unverified", style: Theme.of(context).textTheme.subtitle1),
          ]),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SimpleButton(
            iconSize: 35,
            onPressed: () {},
            icon: Icons.keyboard_arrow_down,
          ),
        )
      ],
    );

class Avatar extends StatelessWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset("assets/avatar.png"),
    );
  }
}
