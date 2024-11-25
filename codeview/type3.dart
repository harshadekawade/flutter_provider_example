import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/providers/counter_provider.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<CounterProvider, int>(
      selector: (context, counterProvider) => counterProvider.count,
      builder: (context, count, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Count: $count'), // Only rebuilds when `count` changes
            child!,
          ],
        );
      },
      child: ElevatedButton(
        onPressed: () {
          context.read<CounterProvider>().increment();
        },
        child: const Text('Increment'),
      ),
    );
  }
}
