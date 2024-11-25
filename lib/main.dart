import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/home.dart';
import 'package:provider_example/providers/counter_provider.dart';
import 'package:provider_example/providers/list_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // By multi provider
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ListProvider()),
        ChangeNotifierProvider(create: (context) => CounterProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Theme.themeData,
        home: const HomeScreen(),
      ),
    );

    // By single provider
    // ignore: dead_code
    return ChangeNotifierProvider<ListProvider>(
      create: (_) => ListProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Theme.themeData,
        home: const HomeScreen(),
      ),
    );
  }
}

class Theme {
  static const Color primaryColor = Colors.green;
  static ThemeData themeData = ThemeData(
    useMaterial3: false,
    primarySwatch: Colors.blue,
    primaryColor: Colors.blue,
    fontFamily: 'Georgia',
  );
}
