import 'package:go_router/go_router.dart';
import 'package:talkativetitans/ui/auth/onboard_view.dart';
import 'package:talkativetitans/ui/auth/sign_in_view.dart';
import 'package:talkativetitans/ui/auth/sign_up_view.dart';
import 'package:talkativetitans/ui/home/home_page.dart';

class AppRouter {
  final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const OnboardView(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: '/signin',
        builder: (context, state) => const SignInView(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}
