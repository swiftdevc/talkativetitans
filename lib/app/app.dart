import 'package:flutter/material.dart';
import 'package:talkativetitans/ui/auth/onboard_view.dart';
import 'package:talkativetitans/ui/auth/sign_in_view.dart';

class App extends StatefulWidget {
  const App({super.key, required this.title});

  final String? title;
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return const OnboardView();
  }
}
