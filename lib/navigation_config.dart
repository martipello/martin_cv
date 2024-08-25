import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:martin_cv/app_frame.dart';
import 'package:martin_cv/privacy_policy.dart';

import 'main.dart';

const kHomeRoute = '/';

final router = GoRouter(
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      pageBuilder: (context, state, navigationShell) {
        return NoTransitionPage(
          child: AppFrame(
            navigationShell: navigationShell,
          ),
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: kHomeRoute,
              builder: (BuildContext context, GoRouterState state) {
                return const MyHomePage();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: kPrivacyPolicyRoute,
              builder: (BuildContext context, GoRouterState state) {
                return const PrivacyPolicy();
              },
            ),
          ],
        ),
      ].toList(),
    ),
  ],
);
