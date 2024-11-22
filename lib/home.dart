import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/list_provider.dart';
import 'package:provider_example/second.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ListProvider>(builder: (context, listProviderModel, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Home Screen"),
        ),
        body: SizedBox(
          child: Column(
            children: [
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SecondScreen()));
                  },
                  child: const Text("Second Screen")),
              const SizedBox(height: 5),
              const Divider(),
              Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.only(bottom: 50),
                    itemCount: listProviderModel.numbers.length,
                    itemBuilder: (context, i) => Container(
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 10)
                            ]),
                        child: Text(listProviderModel.numbers[i].toString(),
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)))),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: listProviderModel.addNum,
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
