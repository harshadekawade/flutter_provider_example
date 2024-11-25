import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/providers/counter_provider.dart';
import 'package:readmore/readmore.dart';
import 'package:widget_with_codeview/widget_with_codeview.dart';

class Type6 extends StatelessWidget {
  final String title;
  const Type6({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final count =
        context.select<CounterProvider, int>((provider) => provider.count);
    return Scaffold(
      appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          centerTitle: true,
          title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ReadMoreText(
              trimLines: 3,
              trimMode: TrimMode.Line,
              style: TextStyle(fontSize: 14),
              trimExpandedText: ' Read Less',
              trimCollapsedText: ' Read More',
              "Subscribes to a specific field of the provider and listens for changes to that field only.",
            ),
            const SizedBox(height: 10),
            const Text("Code:", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Container(
                height: 350,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    border: Border.all(color: Colors.grey)),
                child: const SourceCodeView(filePath: 'codeview/type6.dart')),
            const SizedBox(height: 20),
            const Text("Example:",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  border: Border.all(color: Colors.grey)),
              child: Column(
                children: [
                  Center(
                    child: Text('Count: $count',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(height: 10),
                  Consumer<CounterProvider>(
                      builder: (context, counter, child) => Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    context.read<CounterProvider>().increment();
                                  },
                                  child: const Text('Increment'),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Opacity(
                                  opacity: counter.count != 0 ? 1 : 0.5,
                                  child: AbsorbPointer(
                                    absorbing:
                                        counter.count != 0 ? false : true,
                                    child: ElevatedButton(
                                      style: const ButtonStyle(
                                          backgroundColor:
                                              WidgetStatePropertyAll(
                                                  Colors.red)),
                                      onPressed: counter.decrement,
                                      child: const Text('Decrement'),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                ],
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
