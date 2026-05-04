import 'package:go_router/go_router.dart';

import 'features/autenticacao/presentation/screens/login_screen.dart';
import 'features/autenticacao/presentation/screens/register_screen.dart';
import 'features/homepage/presentation/screens/homepage_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/homepage',
      builder: (context, state) => const HomepageScreen(),
    ),
  ],
);