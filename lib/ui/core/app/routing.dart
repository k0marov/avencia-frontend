import 'package:avencia/ui/core/app/auth_state_inherited_widget.dart';
import 'package:avencia/ui/core/app/splash_screen.dart';
import 'package:avencia/ui/features/auth/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/dashboard/dashboard_screen.dart';
import '../../features/orders/orders_screen.dart';
import '../../features/profile/profile_screen.dart';
import '../../features/settings/settings_screen.dart';
import '../../features/wallets/wallets.dart';

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

  String get fullPath => "/$path";
}

final router = GoRouter(
  redirect: (context, state) {
    // creates a subscription on AuthStateCubit
    // which causes this method to run every time a new auth state is emitted
    final authState = context.dependOnInheritedWidgetOfExactType<AuthStateInheritedWidget>()!.state;
    switch (authState) {
      case AuthenticationState.loading:
        return "/";
      case AuthenticationState.unauthenticated:
        return Routes.login.fullPath;
      case AuthenticationState.authenticated:
        final isLoggingIn = [Routes.login.fullPath, "/"].contains(state.location);
        // if the user is not logging in, then do not redirect anywhere
        return isLoggingIn ? Routes.dashboard.fullPath : null;
    }
  },
  routes: <GoRoute>[
    GoRoute(
      path: "/",
      builder: (context, GoRouterState state) => SplashScreen(),
    ),
    GoRoute(
      path: Routes.login.fullPath,
      builder: (BuildContext context, GoRouterState state) => const AuthScreen(),
    ),
    GoRoute(
      path: Routes.dashboard.fullPath,
      builder: (BuildContext context, GoRouterState state) => const DashboardScreen(),
    ),
    GoRoute(
      path: Routes.account.fullPath,
      builder: (BuildContext context, GoRouterState state) => const NewProfileScreen(),
    ),
    GoRoute(
      path: Routes.wallets.fullPath,
      builder: (BuildContext context, GoRouterState state) => const WalletsScreen(),
    ),
    GoRoute(
      path: Routes.orders.fullPath,
      builder: (BuildContext context, GoRouterState state) => const OrdersScreen(),
    ),
    GoRoute(
      path: Routes.settings.fullPath,
      builder: (BuildContext context, GoRouterState state) => SettingsScreen(),
    ),
  ],
);
