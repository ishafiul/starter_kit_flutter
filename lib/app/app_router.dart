import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:starter_kit_flutter/counter/view/counter_page.dart';
import 'package:starter_kit_flutter/errors/page_not_found.dart';

GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  errorBuilder: (context, state) {
    return const PageNotFound();
  },
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => PageAnimation(
        key: state.pageKey,
        child: const CounterPage(),
      ),
    )
  ],
);

class PageAnimation extends CustomTransitionPage {
  PageAnimation({
    required LocalKey key,
    required super.child,
  }) : super(
          transitionDuration: const Duration(milliseconds: 200),
          key: key,
          transitionsBuilder: (context, animation, secondaryAnimation, child) => SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}
