import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider_example/provider_example.dart';
import 'package:provider_example/way_to_access_provider/type1.dart';

import 'way_to_access_provider/type2.dart';
import 'way_to_access_provider/type3.dart';
import 'way_to_access_provider/type4.dart';
import 'way_to_access_provider/type5.dart';
import 'way_to_access_provider/type6.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> listWays = [
    "Provider.of<T>(context)",
    "Consumer<T>",
    "Selector<T, R>",
    "context.read<T>()",
    "context.watch<T>()",
    "context.select<T, R>()"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.orange)),
                    onPressed: () => navigate(const ProviderExampleScreen()),
                    child: const Text("Provider List Example")),
              ),
              const SizedBox(height: 5),
              const Divider(),
              const Text("Below are the common types to access a provider",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: listWays.length,
                itemBuilder: (context, index) => buildListTitle(index),
                separatorBuilder: (context, index) => const Divider(
                  height: 25,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListTitle(index) {
    String title = listWays[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${index + 1}. $title"),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
              onPressed: () {
                Widget widget = Type1(title: title);
                if (index == 1) {
                  widget = Type2(title: title);
                } else if (index == 2) {
                  widget = Type3(title: title);
                } else if (index == 3) {
                  widget = Type4(title: title);
                } else if (index == 4) {
                  widget = Type5(title: title);
                } else if (index == 5) {
                  widget = Type6(title: title);
                }
                navigate(widget);
              },
              child: const Text("Open")),
        ),
      ],
    );
  }

  void navigate(Widget widget) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));
  }
}
