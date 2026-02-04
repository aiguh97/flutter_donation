import 'package:flutter/material.dart';
import 'package:flutter_donation/screens/dashboard/dashboard_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter();

  late final GoRouter router = GoRouter(
    initialLocation: '/dashboard/home',
    routes: [
      ShellRoute(
        builder: (_, _, child) => DashboardScreen(child: child),
        routes: [
          GoRoute(
            path: '/dashboard/home',
            builder: (_, _) => const Text('Home'),
          ),
          GoRoute(
            path: '/dashboard/campaign_list',
            builder: (_, _) => const Text('Campaign List'),
          ),
          GoRoute(
            path: '/dashboard/my_donations',
            builder: (_, _) => const Text('My Donations'),
          ),
          GoRoute(
            path: '/dashboard/account',
            builder: (_, _) => const Text('Account'),
          ),
        ],
      ),
    ],
  );
}
