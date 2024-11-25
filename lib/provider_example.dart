import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/providers/list_provider.dart';

class ProviderExampleScreen extends StatefulWidget {
  const ProviderExampleScreen({super.key});

  @override
  State<ProviderExampleScreen> createState() => _ProviderExampleScreenState();
}

class _ProviderExampleScreenState extends State<ProviderExampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ListProvider>(builder: (context, listProviderModel, child) {
      return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          title: const Text("Provider Example"),
        ),
        body: listProviderModel.numbers.isNotEmpty
            ? ListView.builder(
                padding: const EdgeInsets.only(bottom: 50),
                itemCount: listProviderModel.numbers.length,
                itemBuilder: (context, i) => Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 10)
                        ]),
                    child: ListTile(
                      trailing: IconButton(
                          onPressed: () => listProviderModel.removeNum(i),
                          icon: const Icon(Icons.cancel, color: Colors.red)),
                      title: Text(listProviderModel.numbers[i].toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    )))
            : const Center(
                child: Text(
                "List data is Empty",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              )),
        floatingActionButton: FloatingActionButton(
          onPressed: listProviderModel.addNum,
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
