import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talkativetitans/constants/project_strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.go('/');
            },
            icon: const Icon(Icons.chevron_left_outlined)),
        title: Text(ProjectString.appName),
        centerTitle: true,
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('yapılacak')],
      ),
      bottomNavigationBar: BottomNavigationBar(onTap: (value) {}, items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: 'Home'),
      ]),
    );
  }
}
