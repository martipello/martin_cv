import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:martin_cv/privacy_policy.dart';

import 'main.dart';

const kHomeRoute = '/';

final router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: kHomeRoute,
      builder: (BuildContext context, GoRouterState state) {
        return const MyHomePage();
      },
    ),
    GoRoute(
      path: kPrivacyPolicyRoute,
      builder: (BuildContext context, GoRouterState state) {
        return const PrivacyPolicy();
      },
    ),
  ],
);
