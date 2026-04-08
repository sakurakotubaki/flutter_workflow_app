import 'package:flutter/material.dart';

class CounterText extends StatelessWidget {
  const CounterText({required this.value, super.key});

  final int value;

  @override
  Widget build(BuildContext context) {
    return Text('$value');
  }
}
