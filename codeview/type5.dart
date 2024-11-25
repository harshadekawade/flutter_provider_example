import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/providers/counter_provider.dart';

class CountDisplay extends StatelessWidget {
  const CountDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final count = context.watch<CounterProvider>().count; // Listens for changes
    return Text('Count: $count');
  }
}
