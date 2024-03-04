import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:miztli/ui/pages/home.dart';
import 'package:miztli/ui/providers/theme_provider.dart';
import 'package:miztli/ui/utils/theme_data.dart';

CustomTransitionPage buildPageWithSlideTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const beginOffset = Offset(0.0, 1.0); // Comienza desde la derecha
      const endOffset = Offset.zero; // Termina en la posición inicial
      var tween = Tween<Offset>(begin: beginOffset, end: endOffset);

      var offsetAnimation = animation.drive(tween);

      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}

class Miztli extends ConsumerWidget {
  Miztli({super.key});

  final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const HomePage(),
      ),
    ],
    errorBuilder: (BuildContext context, GoRouterState state) =>
        const Scaffold(),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return MaterialApp.router(
      title: 'Miztli',
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      theme: isDarkMode
          ? MiztliThemes.miztliDarkTheme
          : MiztliThemes.miztliLightTheme,
      darkTheme: MiztliThemes.miztliDarkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
