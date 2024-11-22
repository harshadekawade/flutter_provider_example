import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/list_provider.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ListProvider>(builder: (context, listProviderModel, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Second Screen"),
        ),
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: listProviderModel.numbers.length,
            itemBuilder: (context, i) => Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5), blurRadius: 10)
                    ]),
                child: Center(
                  child: Text(listProviderModel.numbers[i].toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ))),
        floatingActionButton: FloatingActionButton(
          onPressed: listProviderModel.addNum,
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
