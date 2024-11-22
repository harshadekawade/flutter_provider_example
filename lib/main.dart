import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/home.dart';
import 'package:provider_example/list_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Colors.green;
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ListProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: primaryColor,
          colorScheme: ColorScheme.fromSeed(
            seedColor: primaryColor,
            secondary: Colors.deepOrangeAccent,
          ),
          appBarTheme: AppBarTheme(
              backgroundColor: primaryColor, foregroundColor: Colors.white),
          fontFamily: 'Georgia',
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
