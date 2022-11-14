import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpers/logic/auth/auth_facade.dart';
import 'package:helpers/logic/auth/auth_state_bloc.dart';
import 'package:helpers/ui/errors/state_switch.dart';

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
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: Avatar(),
          ),
          SizedBox(width: 15),
          _AuthInfo(),
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

class _AuthInfo extends StatelessWidget {
  const _AuthInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AuthStateCubit>().state;
    final theme = Theme.of(context);
    final text = theme.textTheme;
    return BlocBuilder<AuthStateCubit, AuthState?>(
      builder: (context, state) => (state ?? None()).fold(
        () => AspectRatio(aspectRatio: 1, child: loadingWidget),
        (auth) => Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                (auth.displayName?.isEmpty ?? true) ? "Me" : auth.displayName!,
                style: text.headline3,
                overflow: TextOverflow.clip,
              ),
              Text(auth.emailState.isVerified ? "Verified" : "Unverified", style: text.headline5),
            ],
          ),
        ),
      ),
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
