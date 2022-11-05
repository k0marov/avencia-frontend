import 'package:flutter/material.dart';

import 'custom_icon_button.dart';

PreferredSizeWidget createAvenciaAppBar(BuildContext context) {
  final preferredSize = Theme.of(context).appBarTheme.toolbarHeight;
  if (preferredSize == null) {
    throw Exception(
      "No AppBar toolbar height was provided.",
    );
  }
  return PreferredSize(
    preferredSize: Size.fromHeight(preferredSize),
    child: AvenciaAppBar(),
  );
}

class AvenciaAppBar extends StatelessWidget {
  const AvenciaAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      leadingWidth: theme.appBarTheme.toolbarHeight,
      leading: Padding(
        padding: const EdgeInsets.all(14),
        child: CustomIconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          color: theme.colorScheme.surface,
          iconSize: 18,
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
            Text("vino_costa", style: theme.textTheme.headline3),
            Text("Unverified", style: theme.textTheme.headline5),
          ]),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: CustomIconButton(
            iconSize: 28,
            onPressed: () {},
            color: theme.colorScheme.surface,
            icon: Icons.keyboard_arrow_down,
          ),
        )
      ],
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset("assets/avatar.png"),
    );
  }
}
