import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/providers/counter_provider.dart';

class SpecificFieldWidget extends StatelessWidget {
  const SpecificFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final count =
        context.select<CounterProvider, int>((provider) => provider.count);
    return Text('Count: $count'); // Only listens to changes in `count`
  }
}
