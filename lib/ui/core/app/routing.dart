import 'package:avencia/di.dart';
import 'package:avencia/ui/features/auth/auth_screen.dart';
import 'package:avencia/ui/features/new/dashboard/dashboard_screen.dart';
import 'package:avencia/ui/features/new/orders/orders_screen.dart';
import 'package:avencia/ui/features/new/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:helpers/logic/auth/auth_facade.dart';

import '../../features/new/wallets/wallets.dart';

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
        return "/login";
      case Routes.dashboard:
        return "/";
      case Routes.account:
        return "/account";
      case Routes.wallets:
        return "/wallets";
      case Routes.orders:
        return "/orders";
      case Routes.settings:
        return "/settings";
    }
  }
}

GoRouter routerFactory() => GoRouter(
      routes: <GoRoute>[
        GoRoute(
          path: Routes.login.path,
          builder: (BuildContext context, GoRouterState state) => const AuthScreen(),
        ),
        GoRoute(
          path: Routes.dashboard.path,
          builder: (BuildContext context, GoRouterState state) => const DashboardScreen(),
        ),
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
          builder: (BuildContext context, GoRouterState state) =>
              Container(), // TODO: implement the settings screen
        ),
      ],

      // redirect to the login page if the user is not logged in
      redirect: (BuildContext context, GoRouterState state) async {
        // Using `of` method creates a dependency of StreamAuthScope. It will
        // cause go_router to reparse current route if StreamAuth has new sign-in
        // information.
        final loggedIn = (await StreamAuthScope.of(context).getToken()).isSome();
        final bool loggingIn = state.subloc == Routes.login.path;
        if (!loggedIn) {
          return Routes.login.path;
        }

        // if the user is logged in but still on the login page, send them to
        // the home page
        if (loggingIn) {
          return Routes.dashboard.path;
        }

        // no need to redirect at all
        return null;
      },
    );

/// A scope that provides [StreamAuth] for the subtree.
class StreamAuthScope extends InheritedNotifier<StreamAuthNotifier> {
  /// Creates a [StreamAuthScope] sign in scope.
  StreamAuthScope({
    Key? key,
    required Widget child,
  }) : super(
          key: key,
          notifier: StreamAuthNotifier(),
          child: child,
        );

  /// Gets the [StreamAuth].
  static AuthFacade of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<StreamAuthScope>()!.notifier!.streamAuth;
  }
}

/// A class that converts [StreamAuth] into a [ChangeNotifier].
class StreamAuthNotifier extends ChangeNotifier {
  /// Creates a [StreamAuthNotifier].
  StreamAuthNotifier() : streamAuth = uiDeps.authFacade {
    streamAuth.getTokenStream().listen((_) {
      notifyListeners();
    });
  }

  /// The stream auth client.
  final AuthFacade streamAuth;
}
