import 'package:flutter/material.dart';

/// ホーム画面のメッセージ（タップ結果など）を表示する。
class HomeStatusText extends StatelessWidget {
  const HomeStatusText({required this.message, super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Text(message);
  }
}
