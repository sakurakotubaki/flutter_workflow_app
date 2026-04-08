import 'package:flutter/material.dart';

/// カウンター値を表示するテキスト。
class CounterText extends StatelessWidget {
  /// [CounterText] を作成する。
  const CounterText({required this.valueCounter, super.key});

  final int valueCounter;

  @override
  Widget build(BuildContext context) {
    return Text('$valueCounter');
  }
}