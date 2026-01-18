import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate_agency/core/navigation/root_screen.dart';

final router = GoRouter(
  initialLocation: '/landlords',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          RootScreen(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/landlords',
              builder: (context, state) {
                return Scaffold();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/tanat',
              builder: (context, state) {
                return Scaffold();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/real_estate',
              builder: (context, state) {
                return Scaffold();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
