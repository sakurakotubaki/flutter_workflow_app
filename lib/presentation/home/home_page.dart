import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import 'package:flutter_workflow_app/presentation/home/home_status_text.dart';

/// [HomePage Preview]
@Preview(name: 'My Sample Text')
Widget homePagePreview() {
  return const HomePage();
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const String _initialMessage = 'ボタンをタップ';

  String _message = _initialMessage;

  void _onMenuPressed() {
    setState(() {
      _message = 'IconButton（メニュー）がタップされた';
    });
  }

  void _onMainButtonPressed() {
    setState(() {
      _message = 'ElevatedButton がタップされた';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _onMenuPressed,
            icon: const Icon(Icons.menu_open),
          ),
        ],
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HomeStatusText(message: _message),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _onMainButtonPressed,
              child: const Text('Tap'),
            ),
          ],
        ),
      ),
    );
  }
}
