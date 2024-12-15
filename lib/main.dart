import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;
import 'package:teamleader/core/navigation/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(child: TeamLeader()),
  );

  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
    return stack;
  };
}

class TeamLeader extends ConsumerWidget {
  const TeamLeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      // theme: themeData,
      title: 'TeamLeader',
      debugShowCheckedModeBanner: false,
      routerDelegate: ref.read(goRouterProvider).routerDelegate,
      routeInformationProvider:
          ref.read(goRouterProvider).routeInformationProvider,
      routeInformationParser: ref.read(goRouterProvider).routeInformationParser,
    );
  }
}
