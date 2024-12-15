import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teamleader/features/features.dart';

const _quotations = '/quotations';
const _createQuotation = '/create-quotation';
const _singleQuotation = '/single-quotation';

typedef AppRoute = String;

abstract class AppRoutes {
  static AppRoute get quotations => _quotations;

  static AppRoute get createQuotation => _createQuotation;

  static AppRoute get singleQuotation => _singleQuotation;
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider((ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.quotations,
    routes: [
      GoRoute(
        path: AppRoutes.quotations,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: QuotationsScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.createQuotation,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: CreateQuotationScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.singleQuotation,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: SingleQuotationScreen(),
        ),
      ),
    ],
  );
});
