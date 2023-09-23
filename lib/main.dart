import 'package:flutter/material.dart';
import 'package:talkativetitans/app/app.dart';
import 'package:talkativetitans/constants/project_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:talkativetitans/core/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('tr', 'TR'), Locale('en', 'US')],
      fallbackLocale: const Locale('en', 'US'),
      path: 'assets/translations',
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      title: ProjectString.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: AppRouter().router,
    );
  }
}
