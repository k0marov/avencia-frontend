import 'package:avencia/ui/features/auth/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/dashboard/dashboard_screen.dart';
import '../../features/orders/orders_screen.dart';
import '../../features/profile/profile_screen.dart';
import '../../features/settings/settings_screen.dart';
import '../../features/wallets/wallets.dart';
import 'auth_gate.dart';

enum Routes {
  login,
  dashboard,
  account,
  wallets,
  orders,
  settings,
}

extension RoutePaths on Routes {
  String get path {
    switch (this) {
      case Routes.login:
        return "login";
      case Routes.dashboard:
        return "dashboard";
      case Routes.account:
        return "account";
      case Routes.wallets:
        return "wallets";
      case Routes.orders:
        return "orders";
      case Routes.settings:
        return "settings";
    }
  }

  String get fullPath => [Routes.dashboard, Routes.login].contains(this)
      ? "/$path"
      : "/${Routes.dashboard.path}/$path";
}

final router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: "/",
      builder: (context, GoRouterState state) => AuthGate(),
      routes: [
        GoRoute(
          path: Routes.login.path,
          builder: (BuildContext context, GoRouterState state) => const AuthScreen(),
        ),
        GoRoute(
          path: Routes.dashboard.path,
          builder: (BuildContext context, GoRouterState state) => const DashboardScreen(),
          routes: [
            GoRoute(
              path: Routes.account.path,
              builder: (BuildContext context, GoRouterState state) => const NewProfileScreen(),
            ),
            GoRoute(
              path: Routes.wallets.path,
              builder: (BuildContext context, GoRouterState state) => const WalletsScreen(),
            ),
            GoRoute(
              path: Routes.orders.path,
              builder: (BuildContext context, GoRouterState state) => const OrdersScreen(),
            ),
            GoRoute(
              path: Routes.settings.path,
              builder: (BuildContext context, GoRouterState state) => SettingsScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
